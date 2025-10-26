package com.rfidhy.framework.config;

import java.util.Random;
import com.google.code.kaptcha.text.impl.DefaultTextCreator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 验证码文本生成器
 *
 * @author ruoyi
 */
public class KaptchaTextCreator extends DefaultTextCreator
{
    private static final Logger log = LoggerFactory.getLogger(KaptchaTextCreator.class);
    private static final String[] CNUMBERS = "0,1,2,3,4,5,6,7,8,9,10".split(",");

    @Override
    public String getText()
    {
        Integer result = 0;
        Random random = new Random();
        int x = random.nextInt(10);
        int y = random.nextInt(10);
        StringBuilder suChinese = new StringBuilder();
        int randomoperands = random.nextInt(3);
        
        log.debug("开始生成数学验证码: x={}, y={}, randomoperands={}", x, y, randomoperands);
        
        if (randomoperands == 0)
        {
            result = x * y;
            suChinese.append(CNUMBERS[x]);
            suChinese.append("*");
            suChinese.append(CNUMBERS[y]);
            log.debug("生成乘法运算: {}*{}={}", x, y, result);
        }
        else if (randomoperands == 1)
        {
            // 确保除法运算满足条件：除数不为0，能整除，结果在有效范围内
            if (x != 0 && y % x == 0 && y / x >= 0 && y / x <= 10)
            {
                result = y / x;
                suChinese.append(CNUMBERS[y]);
                suChinese.append("/");
                suChinese.append(CNUMBERS[x]);
                log.debug("生成除法运算: {}/{}={}", y, x, result);
            }
            else
            {
                // 不满足除法条件时改为加法
                result = x + y;
                suChinese.append(CNUMBERS[x]);
                suChinese.append("+");
                suChinese.append(CNUMBERS[y]);
                log.debug("改为加法运算: {}+{}={}", x, y, result);
            }
        }
        else
        {
            // 减法运算确保结果非负
            if (x >= y)
            {
                result = x - y;
                suChinese.append(CNUMBERS[x]);
                suChinese.append("-");
                suChinese.append(CNUMBERS[y]);
                log.debug("生成减法运算: {}-{}={}", x, y, result);
            }
            else
            {
                result = y - x;
                suChinese.append(CNUMBERS[y]);
                suChinese.append("-");
                suChinese.append(CNUMBERS[x]);
                log.debug("生成减法运算: {}-{}={}", y, x, result);
            }
        }
        
        suChinese.append("=?@" + result);
        String captchaText = suChinese.toString();
        log.info("生成的验证码文本: {}", captchaText);
        return captchaText;
    }
}