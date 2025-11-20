package com.rfidhy.customer.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.rfidhy.common.annotation.Log;
import com.rfidhy.common.annotation.DataScope;
import com.rfidhy.common.core.controller.BaseController;
import com.rfidhy.common.core.domain.AjaxResult;
import com.rfidhy.common.enums.BusinessType;
import com.rfidhy.customer.domain.MkLeads;
import com.rfidhy.customer.service.IMkLeadsService;
import com.rfidhy.common.utils.poi.ExcelUtil;
import com.rfidhy.common.core.page.TableDataInfo;

/**
 * 已分线索Controller
 * 
 * @author rooney
 * @date 2025-11-18
 */
@RestController
@RequestMapping("/customer/leads")
public class MkLeadsController extends BaseController
{
    @Autowired
    private IMkLeadsService mkLeadsService;

    /**
     * 查询已分线索列表
     */
    @PreAuthorize("@ss.hasPermi('customer:leads:list')")
    @DataScope(userAlias = "ml")
    @GetMapping("/list")
    public TableDataInfo list(MkLeads mkLeads)
    {
        startPage();
        List<MkLeads> list = mkLeadsService.selectMkLeadsList(mkLeads);
        return getDataTable(list);
    }

    /**
     * 导出已分线索列表
     */
    @PreAuthorize("@ss.hasPermi('customer:leads:export')")
    @Log(title = "已分线索", businessType = BusinessType.EXPORT)
    @DataScope(userAlias = "ml")
    @PostMapping("/export")
    public void export(HttpServletResponse response, MkLeads mkLeads)
    {
        List<MkLeads> list = mkLeadsService.selectMkLeadsList(mkLeads);
        ExcelUtil<MkLeads> util = new ExcelUtil<MkLeads>(MkLeads.class);
        util.exportExcel(response, list, "已分线索数据");
    }

    /**
     * 获取已分线索详细信息
     */
    @PreAuthorize("@ss.hasPermi('customer:leads:query')")
    @GetMapping(value = "/{leadId}")
    public AjaxResult getInfo(@PathVariable("leadId") Long leadId)
    {
        return success(mkLeadsService.selectMkLeadsByLeadId(leadId));
    }

    /**
     * 新增已分线索
     */
    @PreAuthorize("@ss.hasPermi('customer:leads:add')")
    @Log(title = "已分线索", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MkLeads mkLeads)
    {
        return toAjax(mkLeadsService.insertMkLeads(mkLeads));
    }

    /**
     * 修改已分线索
     */
    @PreAuthorize("@ss.hasPermi('customer:leads:edit')")
    @Log(title = "已分线索", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MkLeads mkLeads)
    {
        return toAjax(mkLeadsService.updateMkLeads(mkLeads));
    }

    /**
     * 删除已分线索
     */
    @PreAuthorize("@ss.hasPermi('customer:leads:remove')")
    @Log(title = "已分线索", businessType = BusinessType.DELETE)
	@DeleteMapping("/{leadIds}")
    public AjaxResult remove(@PathVariable Long[] leadIds)
    {
        return toAjax(mkLeadsService.deleteMkLeadsByLeadIds(leadIds));
    }
}