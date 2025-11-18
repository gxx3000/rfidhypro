package com.rfidhy.customer.mapper;

import java.util.List;
import com.rfidhy.customer.domain.MkLeads;

/**
 * 已分线索Mapper接口
 * 
 * @author rooney
 * @date 2025-11-18
 */
public interface MkLeadsMapper 
{
    /**
     * 查询已分线索
     * 
     * @param leadId 已分线索主键
     * @return 已分线索
     */
    public MkLeads selectMkLeadsByLeadId(Long leadId);

    /**
     * 查询已分线索列表
     * 
     * @param mkLeads 已分线索
     * @return 已分线索集合
     */
    public List<MkLeads> selectMkLeadsList(MkLeads mkLeads);

    /**
     * 新增已分线索
     * 
     * @param mkLeads 已分线索
     * @return 结果
     */
    public int insertMkLeads(MkLeads mkLeads);

    /**
     * 修改已分线索
     * 
     * @param mkLeads 已分线索
     * @return 结果
     */
    public int updateMkLeads(MkLeads mkLeads);

    /**
     * 删除已分线索
     * 
     * @param leadId 已分线索主键
     * @return 结果
     */
    public int deleteMkLeadsByLeadId(Long leadId);

    /**
     * 批量删除已分线索
     * 
     * @param leadIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMkLeadsByLeadIds(Long[] leadIds);
}
