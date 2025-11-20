package com.rfidhy.customer.service.impl;

import java.util.List;
import com.rfidhy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.rfidhy.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.rfidhy.customer.domain.MkCustomerContact;
import com.rfidhy.customer.mapper.MkCustomersMapper;
import com.rfidhy.customer.domain.MkCustomers;
import com.rfidhy.customer.service.IMkCustomersService;

/**
 * 客户列表Service业务层处理
 * 
 * @author rooney
 * @date 2025-11-20
 */
@Service
public class MkCustomersServiceImpl implements IMkCustomersService 
{
    @Autowired
    private MkCustomersMapper mkCustomersMapper;

    /**
     * 查询客户列表
     * 
     * @param customerId 客户列表主键
     * @return 客户列表
     */
    @Override
    public MkCustomers selectMkCustomersByCustomerId(Long customerId)
    {
        return mkCustomersMapper.selectMkCustomersByCustomerId(customerId);
    }

    /**
     * 查询客户列表列表
     * 
     * @param mkCustomers 客户列表
     * @return 客户列表
     */
    @Override
    public List<MkCustomers> selectMkCustomersList(MkCustomers mkCustomers)
    {
        return mkCustomersMapper.selectMkCustomersList(mkCustomers);
    }

    /**
     * 新增客户列表
     * 
     * @param mkCustomers 客户列表
     * @return 结果
     */
    @Transactional
    @Override
    public int insertMkCustomers(MkCustomers mkCustomers)
    {
        mkCustomers.setCreateTime(DateUtils.getNowDate());
        int rows = mkCustomersMapper.insertMkCustomers(mkCustomers);
        insertMkCustomerContact(mkCustomers);
        return rows;
    }

    /**
     * 修改客户列表
     * 
     * @param mkCustomers 客户列表
     * @return 结果
     */
    @Transactional
    @Override
    public int updateMkCustomers(MkCustomers mkCustomers)
    {
        mkCustomers.setUpdateTime(DateUtils.getNowDate());
        mkCustomersMapper.deleteMkCustomerContactByCustomerId(mkCustomers.getCustomerId());
        insertMkCustomerContact(mkCustomers);
        return mkCustomersMapper.updateMkCustomers(mkCustomers);
    }

    /**
     * 批量删除客户列表
     * 
     * @param customerIds 需要删除的客户列表主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMkCustomersByCustomerIds(Long[] customerIds)
    {
        mkCustomersMapper.deleteMkCustomerContactByCustomerIds(customerIds);
        return mkCustomersMapper.deleteMkCustomersByCustomerIds(customerIds);
    }

    /**
     * 删除客户列表信息
     * 
     * @param customerId 客户列表主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMkCustomersByCustomerId(Long customerId)
    {
        mkCustomersMapper.deleteMkCustomerContactByCustomerId(customerId);
        return mkCustomersMapper.deleteMkCustomersByCustomerId(customerId);
    }

    /**
     * 新增客户联系人信息
     * 
     * @param mkCustomers 客户列表对象
     */
    public void insertMkCustomerContact(MkCustomers mkCustomers)
    {
        List<MkCustomerContact> mkCustomerContactList = mkCustomers.getMkCustomerContactList();
        Long customerId = mkCustomers.getCustomerId();
        if (StringUtils.isNotNull(mkCustomerContactList))
        {
            List<MkCustomerContact> list = new ArrayList<MkCustomerContact>();
            for (MkCustomerContact mkCustomerContact : mkCustomerContactList)
            {
                mkCustomerContact.setCustomerId(customerId);
                list.add(mkCustomerContact);
            }
            if (list.size() > 0)
            {
                mkCustomersMapper.batchMkCustomerContact(list);
            }
        }
    }
}
