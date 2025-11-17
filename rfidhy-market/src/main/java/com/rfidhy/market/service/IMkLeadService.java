package com.rfidhy.market.service;

import java.util.List;
import com.rfidhy.market.domain.MkLead;

/**
 * 线索表Service接口
 * 
 * @author rooney
 * @date 2025-11-16
 */
public interface IMkLeadService 
{
    /**
     * 查询线索表
     * 
     * @param leadId 线索表主键
     * @return 线索表
     */
    public MkLead selectMkLeadByLeadId(Long leadId);

    /**
     * 查询线索表列表
     * 
     * @param mkLead 线索表
     * @return 线索表集合
     */
    public List<MkLead> selectMkLeadList(MkLead mkLead);

    /**
     * 导入线索数据
     * 
     * @param leadList 线索数据列表
     * @param updateSupport 是否更新已存在的数据
     * @param operName 操作用户
     * @return 结果
     */
    public String importMkLead(List<MkLead> leadList, Boolean updateSupport, String operName);

    /**
     * 新增线索表
     * 
     * @param mkLead 线索表
     * @return 结果
     */
    public int insertMkLead(MkLead mkLead);

    /**
     * 修改线索表
     * 
     * @param mkLead 线索表
     * @return 结果
     */
    public int updateMkLead(MkLead mkLead);

    /**
     * 批量删除线索表
     * 
     * @param leadIds 需要删除的线索表主键集合
     * @return 结果
     */
    public int deleteMkLeadByLeadIds(Long[] leadIds);

    /**
     * 删除线索表信息
     * 
     * @param leadId 线索表主键
     * @return 结果
     */
    public int deleteMkLeadByLeadId(Long leadId);
}
