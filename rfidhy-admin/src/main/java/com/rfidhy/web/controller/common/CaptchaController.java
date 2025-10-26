package com.rfidhy.web.controller.common;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import jakarta.annotation.Resource;

import javax.imageio.ImageIO;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.google.code.kaptcha.Producer;
import com.rfidhy.common.config.RfidhyConfig;
import com.rfidhy.common.constant.CacheConstants;
import com.rfidhy.common.constant.Constants;
import com.rfidhy.common.core.domain.AjaxResult;
import com.rfidhy.common.core.redis.RedisCache;
import com.rfidhy.common.utils.sign.Base64;
import com.rfidhy.common.utils.uuid.IdUtils;
import com.rfidhy.system.service.ISysConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 验证码操作处理
 *
 * @author ruoyi
 */
@RestController
public class CaptchaController {
    private static final Logger log = LoggerFactory.getLogger(CaptchaController.class);
    
    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ISysConfigService configService;

    /**
     * 生成验证码
     */
    @GetMapping("/captchaImage")
    public AjaxResult getCode(HttpServletResponse response) throws IOException {
        AjaxResult ajax = AjaxResult.success();
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled) {
            return ajax;
        }

        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;

        String capStr = null, code = null;
        BufferedImage image = null;

        try {
            // 生成验证码
            String captchaType = RfidhyConfig.getCaptchaType();
            // 添加默认值，防止配置读取失败
            if (captchaType == null) {
                captchaType = "math";
                log.warn("验证码类型配置为空，使用默认值: math");
            }
            
            log.info("开始生成验证码，验证码类型: {}", captchaType);
            
            if ("math".equals(captchaType)) {
                String capText = captchaProducerMath.createText();
                log.info("生成的数学验证码文本: {}", capText);
                
                if (capText != null && capText.contains("@")) {
                    capStr = capText.substring(0, capText.lastIndexOf("@"));
                    code = capText.substring(capText.lastIndexOf("@") + 1);
                    log.info("数学验证码内容: {}, 验证码答案: {}", capStr, code);
                    
                    if (capStr != null && !capStr.isEmpty()) {
                        image = captchaProducerMath.createImage(capStr);
                        log.info("数学验证码图片生成成功");
                    } else {
                        log.error("数学验证码内容为空");
                    }
                } else {
                    log.error("生成的数学验证码文本格式不正确: {}", capText);
                }
            } else if ("char".equals(captchaType)) {
                capStr = code = captchaProducer.createText();
                log.info("生成的字符验证码文本: {}", capStr);
                
                if (capStr != null && !capStr.isEmpty()) {
                    image = captchaProducer.createImage(capStr);
                    log.info("字符验证码图片生成成功");
                } else {
                    log.error("字符验证码内容为空");
                }
            } else {
                log.error("不支持的验证码类型: {}", captchaType);
                // 使用默认的数学验证码
                captchaType = "math";
                String capText = captchaProducerMath.createText();
                log.info("使用默认数学验证码，生成的文本: {}", capText);
                
                if (capText != null && capText.contains("@")) {
                    capStr = capText.substring(0, capText.lastIndexOf("@"));
                    code = capText.substring(capText.lastIndexOf("@") + 1);
                    log.info("默认数学验证码内容: {}, 验证码答案: {}", capStr, code);
                    
                    if (capStr != null && !capStr.isEmpty()) {
                        image = captchaProducerMath.createImage(capStr);
                        log.info("默认数学验证码图片生成成功");
                    } else {
                        log.error("默认数学验证码内容为空");
                    }
                }
            }

            // 添加空值检查，避免image为null导致异常
            if (image == null) {
                log.error("验证码生成失败，image对象为null，验证码内容: {}", capStr);
                return AjaxResult.error("验证码生成失败");
            }

            redisCache.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
            // 转换流信息写出
            FastByteArrayOutputStream os = new FastByteArrayOutputStream();
            try {
                ImageIO.write(image, "jpg", os);
            } catch (IOException e) {
                log.error("验证码图片写入输出流失败", e);
                return AjaxResult.error(e.getMessage());
            }

            ajax.put("uuid", uuid);
            ajax.put("img", Base64.encode(os.toByteArray()));
            log.info("验证码生成并返回成功，UUID: {}", uuid);
            return ajax;
        } catch (Exception e) {
            log.error("验证码生成过程中发生异常", e);
            return AjaxResult.error("验证码生成失败: " + e.getMessage());
        }
    }
}