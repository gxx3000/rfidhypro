package com.rfidhy.market.service.impl;

import java.util.List;
import com.rfidhy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.rfidhy.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.rfidhy.market.domain.MkLeadAssign;
import com.rfidhy.market.mapper.MkLeadMapper;
import com.rfidhy.market.domain.MkLead;
import com.rfidhy.market.service.IMkLeadService;

/**
 * 线索表Service业务层处理
 * 
 * @author rooney
 * @date 2025-11-16
 */
@Service
public class MkLeadServiceImpl implements IMkLeadService 
{
    @Autowired
    private MkLeadMapper mkLeadMapper;

    /**
     * 查询线索表
     * 
     * @param leadId 线索表主键
     * @return 线索表
     */
    @Override
    public MkLead selectMkLeadByLeadId(Long leadId)
    {
        return mkLeadMapper.selectMkLeadByLeadId(leadId);
    }

    /**
     * 查询线索表列表
     * 
     * @param mkLead 线索表
     * @return 线索表
     */
    @Override
    public List<MkLead> selectMkLeadList(MkLead mkLead)
    {
        return mkLeadMapper.selectMkLeadList(mkLead);
    }

    /**
     * 新增线索表
     * 
     * @param mkLead 线索表
     * @return 结果
     */
    @Transactional
    @Override
    public int insertMkLead(MkLead mkLead)
    {
        mkLead.setCreateTime(DateUtils.getNowDate());
        int rows = mkLeadMapper.insertMkLead(mkLead);
        insertMkLeadAssign(mkLead);
        return rows;
    }

    /**
     * 修改线索表
     * 
     * @param mkLead 线索表
     * @return 结果
     */
    @Transactional
    @Override
    public int updateMkLead(MkLead mkLead)
    {
        mkLead.setUpdateTime(DateUtils.getNowDate());
        mkLeadMapper.deleteMkLeadAssignByLeadId(mkLead.getLeadId());
        insertMkLeadAssign(mkLead);
        return mkLeadMapper.updateMkLead(mkLead);
    }

    /**
     * 批量删除线索表
     * 
     * @param leadIds 需要删除的线索表主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMkLeadByLeadIds(Long[] leadIds)
    {
        mkLeadMapper.deleteMkLeadAssignByLeadIds(leadIds);
        return mkLeadMapper.deleteMkLeadByLeadIds(leadIds);
    }

    /**
     * 删除线索表信息
     * 
     * @param leadId 线索表主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMkLeadByLeadId(Long leadId)
    {
        mkLeadMapper.deleteMkLeadAssignByLeadId(leadId);
        return mkLeadMapper.deleteMkLeadByLeadId(leadId);
    }

    /**
     * 新增线索分配信息
     * 
     * @param mkLead 线索表对象
     */
    public void insertMkLeadAssign(MkLead mkLead)
    {
        List<MkLeadAssign> mkLeadAssignList = mkLead.getMkLeadAssignList();
        Long leadId = mkLead.getLeadId();
        if (StringUtils.isNotNull(mkLeadAssignList))
        {
            List<MkLeadAssign> list = new ArrayList<MkLeadAssign>();
            for (MkLeadAssign mkLeadAssign : mkLeadAssignList)
            {
                mkLeadAssign.setLeadId(leadId);
                list.add(mkLeadAssign);
            }
            if (list.size() > 0)
            {
                mkLeadMapper.batchMkLeadAssign(list);
            }
        }
    }
}
