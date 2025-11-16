package com.rfidhy.market.controller;

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
import com.rfidhy.common.core.controller.BaseController;
import com.rfidhy.common.core.domain.AjaxResult;
import com.rfidhy.common.enums.BusinessType;
import com.rfidhy.market.domain.MkLead;
import com.rfidhy.market.service.IMkLeadService;
import com.rfidhy.common.utils.poi.ExcelUtil;
import com.rfidhy.common.core.page.TableDataInfo;

/**
 * 线索表Controller
 * 
 * @author rooney
 * @date 2025-11-16
 */
@RestController
@RequestMapping("/market/lead")
public class MkLeadController extends BaseController
{
    @Autowired
    private IMkLeadService mkLeadService;

    /**
     * 查询线索表列表
     */
    @PreAuthorize("@ss.hasPermi('market:lead:list')")
    @GetMapping("/list")
    public TableDataInfo list(MkLead mkLead)
    {
        startPage();
        List<MkLead> list = mkLeadService.selectMkLeadList(mkLead);
        return getDataTable(list);
    }

    /**
     * 导出线索表列表
     */
    @PreAuthorize("@ss.hasPermi('market:lead:export')")
    @Log(title = "线索表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MkLead mkLead)
    {
        List<MkLead> list = mkLeadService.selectMkLeadList(mkLead);
        ExcelUtil<MkLead> util = new ExcelUtil<MkLead>(MkLead.class);
        util.exportExcel(response, list, "线索表数据");
    }

    /**
     * 获取线索表详细信息
     */
    @PreAuthorize("@ss.hasPermi('market:lead:query')")
    @GetMapping(value = "/{leadId}")
    public AjaxResult getInfo(@PathVariable("leadId") Long leadId)
    {
        return success(mkLeadService.selectMkLeadByLeadId(leadId));
    }

    /**
     * 新增线索表
     */
    @PreAuthorize("@ss.hasPermi('market:lead:add')")
    @Log(title = "线索表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MkLead mkLead)
    {
        return toAjax(mkLeadService.insertMkLead(mkLead));
    }

    /**
     * 修改线索表
     */
    @PreAuthorize("@ss.hasPermi('market:lead:edit')")
    @Log(title = "线索表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MkLead mkLead)
    {
        return toAjax(mkLeadService.updateMkLead(mkLead));
    }

    /**
     * 删除线索表
     */
    @PreAuthorize("@ss.hasPermi('market:lead:remove')")
    @Log(title = "线索表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{leadIds}")
    public AjaxResult remove(@PathVariable Long[] leadIds)
    {
        return toAjax(mkLeadService.deleteMkLeadByLeadIds(leadIds));
    }
}
