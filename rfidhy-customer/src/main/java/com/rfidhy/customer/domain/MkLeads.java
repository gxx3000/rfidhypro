package com.rfidhy.customer.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rfidhy.common.annotation.Excel;
import com.rfidhy.common.core.domain.BaseEntity;

/**
 * 已分线索对象 mk_lead
 * 
 * @author rooney
 * @date 2025-11-18
 */
public class MkLeads extends BaseEntity
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
    private String email;

    /** 线索来源 */
    @Excel(name = "线索来源")
    private Long sourceId;
    
    /** 线索来源名称 */
    private String sourceName;

    /** 线索状态 */
    @Excel(name = "线索状态")
    private String leadStatus;

    /** 负责人ID */
    private Long assignTo;

    /** 线索等级 */
    @Excel(name = "线索等级")
    private String level;

    /** 地址 */
    private String address;

    /** 线索描述 */
    private String description;

    /** 删除标志 */
    private String delFlag;

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
    
    public String getSourceName() 
    {
        return sourceName;
    }

    public void setSourceName(String sourceName) 
    {
        this.sourceName = sourceName;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("leadId", getLeadId())
            .append("leadName", getLeadName())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("sourceId", getSourceId())
            .append("sourceName", getSourceName())
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
            .toString();
    }
}