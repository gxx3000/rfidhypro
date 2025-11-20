package com.rfidhy.customer.domain;

import java.math.BigDecimal;
import java.util.List;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rfidhy.common.annotation.Excel;
import com.rfidhy.common.core.domain.BaseEntity;

/**
 * 客户列表对象 mk_customer
 * 
 * @author rooney
 * @date 2025-11-20
 */
public class MkCustomers extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 客户ID */
    private Long customerId;

    /** 客户企业名称（如“XX科技有限公司”） */
    private String customerName;

    /** 客户简称 */
    @Excel(name = "客户简称")
    private String customerShortName;

    /** 来源线索ID（关联mk_lead.lead_id，线索转化时填充） */
    @Excel(name = "来源线索ID", readConverterExp = "关=联mk_lead.lead_id，线索转化时填充")
    private Long leadId;

    /** 客户来源 */
    @Excel(name = "客户来源")
    private String sourceType;

    /** 所属行业 */
    @Excel(name = "所属行业")
    private String industryType;

    /** 客户等级 */
    @Excel(name = "客户等级")
    private String customerLevel;

    /** 合作状态 */
    @Excel(name = "合作状态")
    private Integer cooperationStatus;

    /** 企业规模 */
    private String scaleType;

    /** 所属区域 */
    @Excel(name = "所属区域")
    private String region;

    /** 详细地址 */
    private String address;

    /** 法定代表人 */
    private String legalPerson;

    /** 注册资本（万元） */
    private BigDecimal registeredCapital;

    /** 成立日期 */
    private Date establishDate;

    /** 企业官网 */
    private String website;

    /** 企业电话 */
    private String phone;

    /** 企业邮箱 */
    private String email;

    /** 纳税人识别号 */
    private String taxNo;

    /** 客户描述 */
    private String description;

    /** 负责人ID */
    @Excel(name = "负责人ID")
    private Long assignUserId;

    /** 所属部门ID */
    private Long assignDeptId;

    /** 附件IDs */
    private String attachmentIds;

    /** 删除标记 */
    private String delFlag;

    /** 预留字段1（如“客户编码”） */
    private String reserved1;

    /** 预留字段2（如“特殊合作条款”） */
    private String reserved2;

    /** 预留字段3（如“关联母公司ID”） */
    private Long reserved3;

    /** 客户联系人信息 */
    private List<MkCustomerContact> mkCustomerContactList;

    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }

    public void setCustomerName(String customerName) 
    {
        this.customerName = customerName;
    }

    public String getCustomerName() 
    {
        return customerName;
    }

    public void setCustomerShortName(String customerShortName) 
    {
        this.customerShortName = customerShortName;
    }

    public String getCustomerShortName() 
    {
        return customerShortName;
    }

    public void setLeadId(Long leadId) 
    {
        this.leadId = leadId;
    }

    public Long getLeadId() 
    {
        return leadId;
    }

    public void setSourceType(String sourceType) 
    {
        this.sourceType = sourceType;
    }

    public String getSourceType() 
    {
        return sourceType;
    }

    public void setIndustryType(String industryType) 
    {
        this.industryType = industryType;
    }

    public String getIndustryType() 
    {
        return industryType;
    }

    public void setCustomerLevel(String customerLevel) 
    {
        this.customerLevel = customerLevel;
    }

    public String getCustomerLevel() 
    {
        return customerLevel;
    }

    public void setCooperationStatus(Integer cooperationStatus) 
    {
        this.cooperationStatus = cooperationStatus;
    }

    public Integer getCooperationStatus() 
    {
        return cooperationStatus;
    }

    public void setScaleType(String scaleType) 
    {
        this.scaleType = scaleType;
    }

    public String getScaleType() 
    {
        return scaleType;
    }

    public void setRegion(String region) 
    {
        this.region = region;
    }

    public String getRegion() 
    {
        return region;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setLegalPerson(String legalPerson) 
    {
        this.legalPerson = legalPerson;
    }

    public String getLegalPerson() 
    {
        return legalPerson;
    }

    public void setRegisteredCapital(BigDecimal registeredCapital) 
    {
        this.registeredCapital = registeredCapital;
    }

    public BigDecimal getRegisteredCapital() 
    {
        return registeredCapital;
    }

    public void setEstablishDate(Date establishDate) 
    {
        this.establishDate = establishDate;
    }

    public Date getEstablishDate() 
    {
        return establishDate;
    }

    public void setWebsite(String website) 
    {
        this.website = website;
    }

    public String getWebsite() 
    {
        return website;
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

    public void setTaxNo(String taxNo) 
    {
        this.taxNo = taxNo;
    }

    public String getTaxNo() 
    {
        return taxNo;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }

    public void setAssignUserId(Long assignUserId) 
    {
        this.assignUserId = assignUserId;
    }

    public Long getAssignUserId() 
    {
        return assignUserId;
    }

    public void setAssignDeptId(Long assignDeptId) 
    {
        this.assignDeptId = assignDeptId;
    }

    public Long getAssignDeptId() 
    {
        return assignDeptId;
    }

    public void setAttachmentIds(String attachmentIds) 
    {
        this.attachmentIds = attachmentIds;
    }

    public String getAttachmentIds() 
    {
        return attachmentIds;
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

    public List<MkCustomerContact> getMkCustomerContactList()
    {
        return mkCustomerContactList;
    }

    public void setMkCustomerContactList(List<MkCustomerContact> mkCustomerContactList)
    {
        this.mkCustomerContactList = mkCustomerContactList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("customerId", getCustomerId())
            .append("customerName", getCustomerName())
            .append("customerShortName", getCustomerShortName())
            .append("leadId", getLeadId())
            .append("sourceType", getSourceType())
            .append("industryType", getIndustryType())
            .append("customerLevel", getCustomerLevel())
            .append("cooperationStatus", getCooperationStatus())
            .append("scaleType", getScaleType())
            .append("region", getRegion())
            .append("address", getAddress())
            .append("legalPerson", getLegalPerson())
            .append("registeredCapital", getRegisteredCapital())
            .append("establishDate", getEstablishDate())
            .append("website", getWebsite())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("taxNo", getTaxNo())
            .append("description", getDescription())
            .append("assignUserId", getAssignUserId())
            .append("assignDeptId", getAssignDeptId())
            .append("attachmentIds", getAttachmentIds())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("reserved1", getReserved1())
            .append("reserved2", getReserved2())
            .append("reserved3", getReserved3())
            .append("mkCustomerContactList", getMkCustomerContactList())
            .toString();
    }
}
