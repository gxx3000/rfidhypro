package com.rfidhy.base.service.impl;

import java.util.List;
import com.rfidhy.common.utils.DateUtils;
import com.rfidhy.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rfidhy.base.mapper.MkLeadSourceMapper;
import com.rfidhy.base.domain.MkLeadSource;
import com.rfidhy.base.service.IMkLeadSourceService;

/**
 * 线索来源Service业务层处理
 * 
 * @author rooney
 * @date 2025-11-09
 */
@Service
public class MkLeadSourceServiceImpl implements IMkLeadSourceService 
{
    @Autowired
    private MkLeadSourceMapper mkLeadSourceMapper;

    /**
     * 查询线索来源
     * 
     * @param sourceId 线索来源主键
     * @return 线索来源
     */
    @Override
    public MkLeadSource selectMkLeadSourceBySourceId(Long sourceId)
    {
        return mkLeadSourceMapper.selectMkLeadSourceBySourceId(sourceId);
    }

    /**
     * 查询线索来源列表
     * 
     * @param mkLeadSource 线索来源
     * @return 线索来源
     */
    @Override
    public List<MkLeadSource> selectMkLeadSourceList(MkLeadSource mkLeadSource)
    {
        return mkLeadSourceMapper.selectMkLeadSourceList(mkLeadSource);
    }

    /**
     * 新增线索来源
     * 
     * @param mkLeadSource 线索来源
     * @return 结果
     */
    @Override
    public int insertMkLeadSource(MkLeadSource mkLeadSource)
    {
        mkLeadSource.setCreateTime(DateUtils.getNowDate());
        return mkLeadSourceMapper.insertMkLeadSource(mkLeadSource);
    }

    /**
     * 修改线索来源
     * 
     * @param mkLeadSource 线索来源
     * @return 结果
     */
    @Override
    public int updateMkLeadSource(MkLeadSource mkLeadSource)
    {
        mkLeadSource.setUpdateTime(DateUtils.getNowDate());
        return mkLeadSourceMapper.updateMkLeadSource(mkLeadSource);
    }

    /**
     * 批量删除线索来源
     * 
     * @param sourceIds 需要删除的线索来源主键
     * @return 结果
     */
    @Override
    public int deleteMkLeadSourceBySourceIds(Long[] sourceIds)
    {
        return mkLeadSourceMapper.deleteMkLeadSourceBySourceIds(sourceIds);
    }

    /**
     * 删除线索来源信息
     * 
     * @param sourceId 线索来源主键
     * @return 结果
     */
    @Override
    public int deleteMkLeadSourceBySourceId(Long sourceId)
    {
        return mkLeadSourceMapper.deleteMkLeadSourceBySourceId(sourceId);
    }
    
    /**
     * 导入线索来源数据
     * 
     * @param sourceList 线索来源列表
     * @param updateSupport 是否更新已存在的数据
     * @param operName 操作用户
     * @return 结果
     */
    @Override
    public String importMkLeadSource(List<MkLeadSource> sourceList, Boolean updateSupport, String operName) {
        if (sourceList == null || sourceList.size() == 0) {
            throw new RuntimeException("导入数据不能为空！");
        }
        
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        
        for (MkLeadSource source : sourceList) {
            try {
                // 检查必要字段
                if (source.getSourceName() == null || source.getSourceName().trim().isEmpty()) {
                    failureNum++;
                    failureMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：来源名称不能为空");
                    continue;
                }
                
                // 去除名称前后空格
                source.setSourceName(source.getSourceName().trim());
                
                // 检查是否存在相同名称的记录
                MkLeadSource existingSource = mkLeadSourceMapper.selectMkLeadSourceByName(source.getSourceName());
                if (existingSource == null) {
                    // 新增
                    source.setCreateBy(operName);
                    source.setCreateTime(DateUtils.getNowDate());
                    source.setDelFlag("0");
                    
                    // 设置默认值
                    if (source.getStatus() == null) {
                        source.setStatus(1); // 默认启用
                    }
                    
                    if (source.getSort() == null) {
                        source.setSort(0L); // 默认排序
                    }
                    
                    this.insertMkLeadSource(source);
                    successNum++;
                    successMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：新增成功");
                } else if (updateSupport) {
                    // 更新
                    source.setSourceId(existingSource.getSourceId());
                    source.setUpdateBy(operName);
                    source.setUpdateTime(DateUtils.getNowDate());
                    this.updateMkLeadSource(source);
                    successNum++;
                    successMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：来源名称已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + "第" + (successNum + failureNum) + "行：导入失败";
                failureMsg.append(msg).append(e.getMessage());
            }
        }
        
        StringBuilder resultMsg = new StringBuilder();
        if (failureNum > 0) {
            resultMsg.append("很抱歉，导入失败！共 ").append(failureNum).append(" 条数据格式不正确，错误如下：");
            resultMsg.append(failureMsg);
        } else {
            resultMsg.append("恭喜您，数据已全部导入成功！共 ").append(successNum).append(" 条");
        }
        
        if (successNum > 0) {
            resultMsg.append(successMsg);
        }
        
        return resultMsg.toString();
    }
}