package com.rfidhy.customer.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rfidhy.common.annotation.Excel;
import com.rfidhy.common.core.domain.BaseEntity;

/**
 * 客户联系人对象 mk_customer_contact
 * 
 * @author rooney
 * @date 2025-11-20
 */
public class MkCustomerContact extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 联系人ID */
    private Long contactId;

    /** 客户ID */
    @Excel(name = "客户ID")
    private Long customerId;

    /** 联系人姓名 */
    @Excel(name = "联系人姓名")
    private String contactName;

    /** 职位 */
    @Excel(name = "职位")
    private String position;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phone;

    /** 邮箱 */
    private String email;

    /** 是否主联系人 */
    @Excel(name = "是否主联系人")
    private Integer isPrimary;

    /** 性别 */
    private String gender;

    /** 生日 */
    private Date birthday;

    /** 微信号 */
    private String wechat;

    /** 删除标记（0-正常/1-删除） */
    private String delFlag;

    public void setContactId(Long contactId) 
    {
        this.contactId = contactId;
    }

    public Long getContactId() 
    {
        return contactId;
    }
    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }
    public void setContactName(String contactName) 
    {
        this.contactName = contactName;
    }

    public String getContactName() 
    {
        return contactName;
    }
    public void setPosition(String position) 
    {
        this.position = position;
    }

    public String getPosition() 
    {
        return position;
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
    public void setIsPrimary(Integer isPrimary) 
    {
        this.isPrimary = isPrimary;
    }

    public Integer getIsPrimary() 
    {
        return isPrimary;
    }
    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }
    public void setBirthday(Date birthday) 
    {
        this.birthday = birthday;
    }

    public Date getBirthday() 
    {
        return birthday;
    }
    public void setWechat(String wechat) 
    {
        this.wechat = wechat;
    }

    public String getWechat() 
    {
        return wechat;
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
            .append("contactId", getContactId())
            .append("customerId", getCustomerId())
            .append("contactName", getContactName())
            .append("position", getPosition())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("isPrimary", getIsPrimary())
            .append("gender", getGender())
            .append("birthday", getBirthday())
            .append("wechat", getWechat())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
