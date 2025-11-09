package com.rfidhy.base.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rfidhy.common.annotation.Excel;
import com.rfidhy.common.core.domain.BaseEntity;

/**
 * 线索来源对象 mk_lead_source
 * 
 * @author rooney
 * @date 2025-11-09
 */
public class MkLeadSource extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 来源ID（雪花ID） */
    private Long sourceId;

    /** 来源名称（如“官网表单”“2024上海RFID展会”） */
    @Excel(name = "来源名称", readConverterExp = "如=“官网表单”“2024上海RFID展会”")
    private String sourceName;

    /** 来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道） */
    @Excel(name = "来源类型", readConverterExp = "关=联字典：mk_source_type；0-线上/1-线下/2-合作渠道")
    private String sourceType;

    /** 来源负责人ID（关联sys_user.user_id） */
    private Long sourceOwnerId;

    /** 来源描述（如“官网表单嵌入产品详情页，用户填写后自动生成线索”） */
    private String sourceDesc;

    /** 渠道成本（预留：后期统计ROI用） */
    private BigDecimal sourceCost;

    /** 排序号（前端显示顺序） */
    private Long sort;

    /** 状态（关联字典：sys_normal_status；0-禁用/1-启用） */
    @Excel(name = "状态", readConverterExp = "关=联字典：sys_normal_status；0-禁用/1-启用")
    private Integer status;

    /** 删除标记（0-正常/1-删除） */
    private String delFlag;

    /** 预留字段1（后期扩展用，如“渠道URL”） */
    private String reserved1;

    /** 预留字段2（后期扩展用，如“渠道合作协议内容”） */
    private String reserved2;

    /** 预留字段3（后期扩展用，如“关联合作方ID”） */
    private Long reserved3;

    public void setSourceId(Long sourceId) 
    {
        this.sourceId = sourceId;
    }

    public Long getSourceId() 
    {
        return sourceId;
    }

    public void setSourceName(String sourceName) 
    {
        this.sourceName = sourceName;
    }

    public String getSourceName() 
    {
        return sourceName;
    }

    public void setSourceType(String sourceType) 
    {
        this.sourceType = sourceType;
    }

    public String getSourceType() 
    {
        return sourceType;
    }

    public void setSourceOwnerId(Long sourceOwnerId) 
    {
        this.sourceOwnerId = sourceOwnerId;
    }

    public Long getSourceOwnerId() 
    {
        return sourceOwnerId;
    }

    public void setSourceDesc(String sourceDesc) 
    {
        this.sourceDesc = sourceDesc;
    }

    public String getSourceDesc() 
    {
        return sourceDesc;
    }

    public void setSourceCost(BigDecimal sourceCost) 
    {
        this.sourceCost = sourceCost;
    }

    public BigDecimal getSourceCost() 
    {
        return sourceCost;
    }

    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }

    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    public void setReserved1(String reserved1) 
    {
        this.reserved1 = reserved1;
    }

    public String getReserved1() 
    {
        return reserved1;
    }

    public void setReserved2(String reserved2) 
    {
        this.reserved2 = reserved2;
    }

    public String getReserved2() 
    {
        return reserved2;
    }

    public void setReserved3(Long reserved3) 
    {
        this.reserved3 = reserved3;
    }

    public Long getReserved3() 
    {
        return reserved3;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("sourceId", getSourceId())
            .append("sourceName", getSourceName())
            .append("sourceType", getSourceType())
            .append("sourceOwnerId", getSourceOwnerId())
            .append("sourceDesc", getSourceDesc())
            .append("sourceCost", getSourceCost())
            .append("sort", getSort())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("reserved1", getReserved1())
            .append("reserved2", getReserved2())
            .append("reserved3", getReserved3())
            .toString();
    }
}
