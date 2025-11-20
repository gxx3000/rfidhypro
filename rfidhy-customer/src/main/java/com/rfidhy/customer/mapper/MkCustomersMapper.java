package com.rfidhy.customer.mapper;

import java.util.List;
import com.rfidhy.customer.domain.MkCustomers;
import com.rfidhy.customer.domain.MkCustomerContact;

/**
 * 客户列表Mapper接口
 * 
 * @author rooney
 * @date 2025-11-20
 */
public interface MkCustomersMapper 
{
    /**
     * 查询客户列表
     * 
     * @param customerId 客户列表主键
     * @return 客户列表
     */
    public MkCustomers selectMkCustomersByCustomerId(Long customerId);

    /**
     * 查询客户列表列表
     * 
     * @param mkCustomers 客户列表
     * @return 客户列表集合
     */
    public List<MkCustomers> selectMkCustomersList(MkCustomers mkCustomers);

    /**
     * 新增客户列表
     * 
     * @param mkCustomers 客户列表
     * @return 结果
     */
    public int insertMkCustomers(MkCustomers mkCustomers);

    /**
     * 修改客户列表
     * 
     * @param mkCustomers 客户列表
     * @return 结果
     */
    public int updateMkCustomers(MkCustomers mkCustomers);

    /**
     * 删除客户列表
     * 
     * @param customerId 客户列表主键
     * @return 结果
     */
    public int deleteMkCustomersByCustomerId(Long customerId);

    /**
     * 批量删除客户列表
     * 
     * @param customerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMkCustomersByCustomerIds(Long[] customerIds);

    /**
     * 批量删除客户联系人
     * 
     * @param customerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMkCustomerContactByCustomerIds(Long[] customerIds);
    
    /**
     * 批量新增客户联系人
     * 
     * @param mkCustomerContactList 客户联系人列表
     * @return 结果
     */
    public int batchMkCustomerContact(List<MkCustomerContact> mkCustomerContactList);
    

    /**
     * 通过客户列表主键删除客户联系人信息
     * 
     * @param customerId 客户列表ID
     * @return 结果
     */
    public int deleteMkCustomerContactByCustomerId(Long customerId);
}
