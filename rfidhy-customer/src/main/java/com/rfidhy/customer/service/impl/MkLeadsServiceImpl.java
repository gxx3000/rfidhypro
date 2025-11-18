package com.rfidhy.customer.service.impl;

import java.util.List;
import com.rfidhy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rfidhy.customer.mapper.MkLeadsMapper;
import com.rfidhy.customer.domain.MkLeads;
import com.rfidhy.customer.service.IMkLeadsService;

/**
 * 已分线索Service业务层处理
 * 
 * @author rooney
 * @date 2025-11-18
 */
@Service
public class MkLeadsServiceImpl implements IMkLeadsService 
{
    @Autowired
    private MkLeadsMapper mkLeadsMapper;

    /**
     * 查询已分线索
     * 
     * @param leadId 已分线索主键
     * @return 已分线索
     */
    @Override
    public MkLeads selectMkLeadsByLeadId(Long leadId)
    {
        return mkLeadsMapper.selectMkLeadsByLeadId(leadId);
    }

    /**
     * 查询已分线索列表
     * 
     * @param mkLeads 已分线索
     * @return 已分线索
     */
    @Override
    public List<MkLeads> selectMkLeadsList(MkLeads mkLeads)
    {
        return mkLeadsMapper.selectMkLeadsList(mkLeads);
    }

    /**
     * 新增已分线索
     * 
     * @param mkLeads 已分线索
     * @return 结果
     */
    @Override
    public int insertMkLeads(MkLeads mkLeads)
    {
        mkLeads.setCreateTime(DateUtils.getNowDate());
        return mkLeadsMapper.insertMkLeads(mkLeads);
    }

    /**
     * 修改已分线索
     * 
     * @param mkLeads 已分线索
     * @return 结果
     */
    @Override
    public int updateMkLeads(MkLeads mkLeads)
    {
        mkLeads.setUpdateTime(DateUtils.getNowDate());
        return mkLeadsMapper.updateMkLeads(mkLeads);
    }

    /**
     * 批量删除已分线索
     * 
     * @param leadIds 需要删除的已分线索主键
     * @return 结果
     */
    @Override
    public int deleteMkLeadsByLeadIds(Long[] leadIds)
    {
        return mkLeadsMapper.deleteMkLeadsByLeadIds(leadIds);
    }

    /**
     * 删除已分线索信息
     * 
     * @param leadId 已分线索主键
     * @return 结果
     */
    @Override
    public int deleteMkLeadsByLeadId(Long leadId)
    {
        return mkLeadsMapper.deleteMkLeadsByLeadId(leadId);
    }
}