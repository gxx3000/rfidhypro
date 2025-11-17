package com.rfidhy.base.mapper;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.rfidhy.base.domain.MkLeadSource;

/**
 * 线索来源Mapper接口
 * 
 * @author rooney
 * @date 2025-11-09
 */
public interface MkLeadSourceMapper 
{
    /**
     * 查询线索来源
     * 
     * @param sourceId 线索来源主键
     * @return 线索来源
     */
    public MkLeadSource selectMkLeadSourceBySourceId(Long sourceId);

    /**
     * 根据名称查询线索来源
     * 
     * @param sourceName 线索来源名称
     * @return 线索来源
     */
    public MkLeadSource selectMkLeadSourceByName(String sourceName);

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
     * 删除线索来源
     * 
     * @param mkLeadSource 线索来源对象，包含sourceId和delFlag
     * @return 结果
     */
    public int deleteMkLeadSourceBySourceId(MkLeadSource mkLeadSource);

    /**
     * 批量删除线索来源
     * 
     * @param sourceIds 需要删除的数据主键集合
     * @param delFlag 删除标记
     * @param updateTime 更新时间
     * @return 结果
     */
    public int deleteMkLeadSourceBySourceIds(@Param("array") Long[] sourceIds, @Param("delFlag") String delFlag, @Param("updateTime") Date updateTime);
}