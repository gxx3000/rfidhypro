package com.rfidhy.base.service;

import java.util.List;
import com.rfidhy.base.domain.MkLeadSource;

/**
 * 线索来源Service接口
 * 
 * @author rooney
 * @date 2025-11-09
 */
public interface IMkLeadSourceService 
{
    /**
     * 查询线索来源
     * 
     * @param sourceId 线索来源主键
     * @return 线索来源
     */
    public MkLeadSource selectMkLeadSourceBySourceId(Long sourceId);

    /**
     * 查询线索来源列表
     * 
     * @param mkLeadSource 线索来源
     * @return 线索来源集合
     */
    public List<MkLeadSource> selectMkLeadSourceList(MkLeadSource mkLeadSource);

    /**
     * 新增线索来源
     * 
     * @param mkLeadSource 线索来源
     * @return 结果
     */
    public int insertMkLeadSource(MkLeadSource mkLeadSource);

    /**
     * 修改线索来源
     * 
     * @param mkLeadSource 线索来源
     * @return 结果
     */
    public int updateMkLeadSource(MkLeadSource mkLeadSource);

    /**
     * 批量删除线索来源
     * 
     * @param sourceIds 需要删除的线索来源主键集合
     * @return 结果
     */
    public int deleteMkLeadSourceBySourceIds(Long[] sourceIds);

    /**
     * 删除线索来源信息
     * 
     * @param sourceId 线索来源主键
     * @return 结果
     */
    public int deleteMkLeadSourceBySourceId(Long sourceId);
}
