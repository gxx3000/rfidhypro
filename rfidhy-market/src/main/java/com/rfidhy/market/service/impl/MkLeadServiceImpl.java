package com.rfidhy.market.service.impl;

import java.util.List;
import com.rfidhy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.rfidhy.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.rfidhy.market.domain.MkLeadAssign;
import com.rfidhy.market.mapper.MkLeadMapper;
import com.rfidhy.market.domain.MkLead;
import com.rfidhy.market.service.IMkLeadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 线索表Service业务层处理
 * 
 * @author rooney
 * @date 2025-11-16
 */
@Service
public class MkLeadServiceImpl implements IMkLeadService 
{
    private static final Logger log = LoggerFactory.getLogger(MkLeadServiceImpl.class);
    
    @Autowired
    private MkLeadMapper mkLeadMapper;

    /**
     * 查询线索表
     * 
     * @param leadId 线索表主键
     * @return 线索表
     */
    @Override
    public MkLead selectMkLeadByLeadId(Long leadId)
    {
        return mkLeadMapper.selectMkLeadByLeadId(leadId);
    }

    /**
     * 查询线索表列表
     * 
     * @param mkLead 线索表
     * @return 线索表
     */
    @Override
    public List<MkLead> selectMkLeadList(MkLead mkLead)
    {
        return mkLeadMapper.selectMkLeadList(mkLead);
    }

    /**
     * 导入线索数据
     * 
     * @param leadList 线索数据列表
     * @param updateSupport 是否更新已存在的数据
     * @param operName 操作用户
     * @return 结果
     */
    @Override
    public String importMkLead(List<MkLead> leadList, Boolean updateSupport, String operName) {
        if (leadList == null || leadList.size() == 0) {
            throw new RuntimeException("导入数据不能为空！");
        }
        
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        
        for (MkLead lead : leadList) {
            try {
                // 检查必要字段
                if (lead.getLeadName() == null || lead.getLeadName().trim().isEmpty()) {
                    failureNum++;
                    failureMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：联系人不能为空");
                    continue;
                }
                
                if (lead.getPhone() == null || lead.getPhone().trim().isEmpty()) {
                    failureNum++;
                    failureMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：联系电话不能为空");
                    continue;
                }
                
                // 去除名称前后空格
                lead.setLeadName(lead.getLeadName().trim());
                lead.setPhone(lead.getPhone().trim());
                
                // 检查是否存在相同联系人和电话的记录
                MkLead existingLead = mkLeadMapper.selectMkLeadByNameAndPhone(lead.getLeadName(), lead.getPhone());
                if (existingLead == null) {
                    // 新增
                    lead.setCreateBy(operName);
                    lead.setCreateTime(DateUtils.getNowDate());
                    lead.setDelFlag("0");
                    
                    // 设置默认值
                    if (lead.getLeadStatus() == null) {
                        lead.setLeadStatus("0"); // 默认未分配
                    }
                    
                    this.insertMkLead(lead);
                    successNum++;
                    successMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：新增成功");
                } else if (updateSupport) {
                    // 更新
                    lead.setLeadId(existingLead.getLeadId());
                    lead.setUpdateBy(operName);
                    lead.setUpdateTime(DateUtils.getNowDate());
                    this.updateMkLead(lead);
                    successNum++;
                    successMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>").append("第").append(successNum + failureNum).append("行：联系人和电话已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + "第" + (successNum + failureNum) + "行：导入失败";
                failureMsg.append(msg).append(e.getMessage());
            }
        }
        
        StringBuilder resultMsg = new StringBuilder();
        if (failureNum > 0) {
            resultMsg.append("很抱歉，导入失败！共 ").append(failureNum).append(" 条数据格式不正确，错误如下：");
            resultMsg.append(failureMsg);
        } else {
            resultMsg.append("恭喜您，数据已全部导入成功！共 ").append(successNum).append(" 条");
        }
        
        if (successNum > 0) {
            resultMsg.append(successMsg);
        }
        
        return resultMsg.toString();
    }

    /**
     * 新增线索表
     * 
     * @param mkLead 线索表
     * @return 结果
     */
    @Transactional
    @Override
    public int insertMkLead(MkLead mkLead)
    {
        mkLead.setCreateTime(DateUtils.getNowDate());
        int rows = mkLeadMapper.insertMkLead(mkLead);
        insertMkLeadAssign(mkLead);
        return rows;
    }

    /**
     * 修改线索表
     * 
     * @param mkLead 线索表
     * @return 结果
     */
    @Transactional
    @Override
    public int updateMkLead(MkLead mkLead)
    {
        mkLead.setUpdateTime(DateUtils.getNowDate());
        mkLeadMapper.deleteMkLeadAssignByLeadId(mkLead.getLeadId());
        insertMkLeadAssign(mkLead);
        return mkLeadMapper.updateMkLead(mkLead);
    }

    /**
     * 批量删除线索表
     * 
     * @param leadIds 需要删除的线索表主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMkLeadByLeadIds(Long[] leadIds)
    {
        mkLeadMapper.deleteMkLeadAssignByLeadIds(leadIds);
        return mkLeadMapper.deleteMkLeadByLeadIds(leadIds, "1", DateUtils.getNowDate());
    }

    /**
     * 删除线索表信息
     * 
     * @param leadId 线索表主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMkLeadByLeadId(Long leadId)
    {
        mkLeadMapper.deleteMkLeadAssignByLeadId(leadId);
        MkLead lead = new MkLead();
        lead.setLeadId(leadId);
        lead.setDelFlag("1");
        lead.setUpdateTime(DateUtils.getNowDate());
        return mkLeadMapper.deleteMkLeadByLeadId(lead);
    }

    /**
     * 新增线索分配信息
     * 
     * @param mkLead 线索表对象
     */
    public void insertMkLeadAssign(MkLead mkLead)
    {
        List<MkLeadAssign> mkLeadAssignList = mkLead.getMkLeadAssignList();
        Long leadId = mkLead.getLeadId();
        if (StringUtils.isNotNull(mkLeadAssignList))
        {
            List<MkLeadAssign> list = new ArrayList<MkLeadAssign>();
            for (MkLeadAssign mkLeadAssign : mkLeadAssignList)
            {
                mkLeadAssign.setLeadId(leadId);
                mkLeadAssign.setCreateBy(mkLead.getCreateBy());
                mkLeadAssign.setCreateTime(DateUtils.getNowDate());
                list.add(mkLeadAssign);
            }
            if (list.size() > 0)
            {
                log.info("开始批量插入线索分配记录，数量: {}", list.size());
                mkLeadMapper.batchMkLeadAssign(list);
                log.info("完成批量插入线索分配记录");
                
                // 如果有分配记录，则更新线索状态为已分配
                MkLead updateLead = new MkLead();
                updateLead.setLeadId(leadId);
                updateLead.setLeadStatus("1"); // 1表示已分配
                updateLead.setAssignTo(list.get(0).getNewUserId()); // 设置负责人为新分配的用户
                updateLead.setUpdateBy(mkLead.getUpdateBy() != null ? mkLead.getUpdateBy() : mkLead.getCreateBy());
                updateLead.setUpdateTime(DateUtils.getNowDate());
                
                log.info("准备更新线索状态，leadId={}, leadStatus={}, assignTo={}, updateBy={}", 
                         leadId, "1", list.get(0).getNewUserId(), updateLead.getUpdateBy());
                         
                int result = mkLeadMapper.updateMkLead(updateLead);
                log.info("更新线索状态结果: {}", result);
            }
        }
    }
}
