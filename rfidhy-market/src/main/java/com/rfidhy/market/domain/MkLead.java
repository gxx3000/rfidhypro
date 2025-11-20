package com.rfidhy.market.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rfidhy.common.annotation.Excel;
import com.rfidhy.common.core.domain.BaseEntity;

/**
 * 线索表对象 mk_lead
 * 
 * @author rooney
 * @date 2025-11-16
 */
public class MkLead extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 线索ID */
    private Long leadId;

    /** 联系人 */
    @Excel(name = "联系人")
    private String leadName;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 电子邮箱 */
    @Excel(name = "电子邮箱")
    private String email;

    /** 线索来源 */
    @Excel(name = "线索来源")
    private Long sourceId;

    /** 线索状态 */
    @Excel(name = "线索状态", dictType = "mk_assign_type")
    private String leadStatus;

    /** 负责人ID */
    @Excel(name = "负责人ID")
    private Long assignTo;

    /** 线索等级 */
    @Excel(name = "线索等级", dictType = "mk_lead_level")
    private String level;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 线索描述 */
    @Excel(name = "线索描述")
    private String description;

    /** 删除标志 */
    private String delFlag;

    // 添加开始时间和结束时间字段用于查询条件
    /** 创建时间开始 */
    private String createTimeStart;
    
    /** 创建时间结束 */
    private String createTimeEnd;
    
    /** 更新时间开始 */
    private String updateTimeStart;
    
    /** 更新时间结束 */
    private String updateTimeEnd;

    /** 线索分配信息 */
    private List<MkLeadAssign> mkLeadAssignList;

    public void setLeadId(Long leadId) 
    {
        this.leadId = leadId;
    }

    public Long getLeadId() 
    {
        return leadId;
    }

    public void setLeadName(String leadName) 
    {
        this.leadName = leadName;
    }

    public String getLeadName() 
    {
        return leadName;
    }

    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }

    public void setSourceId(Long sourceId) 
    {
        this.sourceId = sourceId;
    }

    public Long getSourceId() 
    {
        return sourceId;
    }

    public void setLeadStatus(String leadStatus) 
    {
        this.leadStatus = leadStatus;
    }

    public String getLeadStatus() 
    {
        return leadStatus;
    }

    public void setAssignTo(Long assignTo) 
    {
        this.assignTo = assignTo;
    }

    public Long getAssignTo() 
    {
        return assignTo;
    }

    public void setLevel(String level) 
    {
        this.level = level;
    }

    public String getLevel() 
    {
        return level;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }

    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    public String getCreateTimeStart() {
        return createTimeStart;
    }

    public void setCreateTimeStart(String createTimeStart) {
        this.createTimeStart = createTimeStart;
    }

    public String getCreateTimeEnd() {
        return createTimeEnd;
    }

    public void setCreateTimeEnd(String createTimeEnd) {
        this.createTimeEnd = createTimeEnd;
    }

    public String getUpdateTimeStart() {
        return updateTimeStart;
    }

    public void setUpdateTimeStart(String updateTimeStart) {
        this.updateTimeStart = updateTimeStart;
    }

    public String getUpdateTimeEnd() {
        return updateTimeEnd;
    }

    public void setUpdateTimeEnd(String updateTimeEnd) {
        this.updateTimeEnd = updateTimeEnd;
    }

    public List<MkLeadAssign> getMkLeadAssignList()
    {
        return mkLeadAssignList;
    }

    public void setMkLeadAssignList(List<MkLeadAssign> mkLeadAssignList)
    {
        this.mkLeadAssignList = mkLeadAssignList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("leadId", getLeadId())
            .append("leadName", getLeadName())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("sourceId", getSourceId())
            .append("leadStatus", getLeadStatus())
            .append("assignTo", getAssignTo())
            .append("level", getLevel())
            .append("address", getAddress())
            .append("description", getDescription())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("mkLeadAssignList", getMkLeadAssignList())
            .toString();
    }
}
