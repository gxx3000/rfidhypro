package com.rfidhy.market.mapper;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.rfidhy.market.domain.MkLead;
import com.rfidhy.market.domain.MkLeadAssign;

/**
 * 线索表Mapper接口
 * 
 * @author rooney
 * @date 2025-11-16
 */
public interface MkLeadMapper 
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
     * 根据联系人姓名和电话查询线索
     * 
     * @param leadName 联系人姓名
     * @param phone 电话
     * @return 线索
     */
    public MkLead selectMkLeadByNameAndPhone(@Param("leadName") String leadName, @Param("phone") String phone);

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
     * 删除线索表
     * 
     * @param mkLead 线索表对象，包含leadId和delFlag
     * @return 结果
     */
    public int deleteMkLeadByLeadId(MkLead mkLead);

    /**
     * 批量删除线索表
     * 
     * @param leadIds 需要删除的数据主键集合
     * @param delFlag 删除标记
     * @param updateTime 更新时间
     * @return 结果
     */
    public int deleteMkLeadByLeadIds(@Param("array") Long[] leadIds, @Param("delFlag") String delFlag, @Param("updateTime") Date updateTime);

    /**
     * 批量删除线索分配
     * 
     * @param leadIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMkLeadAssignByLeadIds(Long[] leadIds);
    
    /**
     * 批量新增线索分配
     * 
     * @param mkLeadAssignList 线索分配列表
     * @return 结果
     */
    public int batchMkLeadAssign(List<MkLeadAssign> mkLeadAssignList);
    

    /**
     * 通过线索表主键删除线索分配信息
     * 
     * @param leadId 线索表ID
     * @return 结果
     */
    public int deleteMkLeadAssignByLeadId(Long leadId);
}
