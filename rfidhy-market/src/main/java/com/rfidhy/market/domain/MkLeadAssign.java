package com.rfidhy.market.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rfidhy.common.annotation.Excel;
import com.rfidhy.common.core.domain.BaseEntity;

/**
 * 线索分配对象 mk_lead_assign
 * 
 * @author rooney
 * @date 2025-11-16
 */
public class MkLeadAssign extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 分配记录ID */
    private Long assignId;

    /** 线索ID */
    @Excel(name = "线索ID")
    private Long leadId;

    /** 原负责人ID */
    @Excel(name = "原负责人ID")
    private Long oldUserId;

    /** 新负责人ID */
    @Excel(name = "新负责人ID")
    private Long newUserId;

    /** 分配类型：0-自动分配 1-手动分配 2-转交 3-收回 */
    @Excel(name = "分配类型：0-自动分配 1-手动分配 2-转交 3-收回")
    private String assignType;

    /** 分配原因 */
    @Excel(name = "分配原因")
    private String assignReason;

    /** 分配时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "分配时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date assignTime;

    public void setAssignId(Long assignId) 
    {
        this.assignId = assignId;
    }

    public Long getAssignId() 
    {
        return assignId;
    }
    public void setLeadId(Long leadId) 
    {
        this.leadId = leadId;
    }

    public Long getLeadId() 
    {
        return leadId;
    }
    public void setOldUserId(Long oldUserId) 
    {
        this.oldUserId = oldUserId;
    }

    public Long getOldUserId() 
    {
        return oldUserId;
    }
    public void setNewUserId(Long newUserId) 
    {
        this.newUserId = newUserId;
    }

    public Long getNewUserId() 
    {
        return newUserId;
    }
    public void setAssignType(String assignType) 
    {
        this.assignType = assignType;
    }

    public String getAssignType() 
    {
        return assignType;
    }
    public void setAssignReason(String assignReason) 
    {
        this.assignReason = assignReason;
    }

    public String getAssignReason() 
    {
        return assignReason;
    }
    public void setAssignTime(Date assignTime) 
    {
        this.assignTime = assignTime;
    }

    public Date getAssignTime() 
    {
        return assignTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("assignId", getAssignId())
            .append("leadId", getLeadId())
            .append("oldUserId", getOldUserId())
            .append("newUserId", getNewUserId())
            .append("assignType", getAssignType())
            .append("assignReason", getAssignReason())
            .append("assignTime", getAssignTime())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("remark", getRemark())
            .toString();
    }
}
