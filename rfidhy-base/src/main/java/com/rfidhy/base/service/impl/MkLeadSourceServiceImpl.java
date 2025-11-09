package com.rfidhy.base.service.impl;

import java.util.List;
import com.rfidhy.common.utils.DateUtils;
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
}
