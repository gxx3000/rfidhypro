package com.rfidhy.customer.service;

import java.util.List;
import com.rfidhy.customer.domain.MkCustomers;

/**
 * 客户列表Service接口
 * 
 * @author rooney
 * @date 2025-11-20
 */
public interface IMkCustomersService 
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
     * 批量删除客户列表
     * 
     * @param customerIds 需要删除的客户列表主键集合
     * @return 结果
     */
    public int deleteMkCustomersByCustomerIds(Long[] customerIds);

    /**
     * 删除客户列表信息
     * 
     * @param customerId 客户列表主键
     * @return 结果
     */
    public int deleteMkCustomersByCustomerId(Long customerId);
}
