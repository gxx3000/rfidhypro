package com.rfidhy.base.controller;

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
import com.rfidhy.base.domain.MkLeadSource;
import com.rfidhy.base.service.IMkLeadSourceService;
import com.rfidhy.common.utils.poi.ExcelUtil;
import com.rfidhy.common.core.page.TableDataInfo;

/**
 * 线索来源Controller
 * 
 * @author rooney
 * @date 2025-11-09
 */
@RestController
@RequestMapping("/base/source")
public class MkLeadSourceController extends BaseController
{
    @Autowired
    private IMkLeadSourceService mkLeadSourceService;

    /**
     * 查询线索来源列表
     */
    @PreAuthorize("@ss.hasPermi('base:source:list')")
    @GetMapping("/list")
    public TableDataInfo list(MkLeadSource mkLeadSource)
    {
        startPage();
        List<MkLeadSource> list = mkLeadSourceService.selectMkLeadSourceList(mkLeadSource);
        return getDataTable(list);
    }

    /**
     * 导出线索来源列表
     */
    @PreAuthorize("@ss.hasPermi('base:source:export')")
    @Log(title = "线索来源", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MkLeadSource mkLeadSource)
    {
        List<MkLeadSource> list = mkLeadSourceService.selectMkLeadSourceList(mkLeadSource);
        ExcelUtil<MkLeadSource> util = new ExcelUtil<MkLeadSource>(MkLeadSource.class);
        util.exportExcel(response, list, "线索来源数据");
    }

    /**
     * 获取线索来源详细信息
     */
    @PreAuthorize("@ss.hasPermi('base:source:query')")
    @GetMapping(value = "/{sourceId}")
    public AjaxResult getInfo(@PathVariable("sourceId") Long sourceId)
    {
        return success(mkLeadSourceService.selectMkLeadSourceBySourceId(sourceId));
    }

    /**
     * 新增线索来源
     */
    @PreAuthorize("@ss.hasPermi('base:source:add')")
    @Log(title = "线索来源", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MkLeadSource mkLeadSource)
    {
        return toAjax(mkLeadSourceService.insertMkLeadSource(mkLeadSource));
    }

    /**
     * 修改线索来源
     */
    @PreAuthorize("@ss.hasPermi('base:source:edit')")
    @Log(title = "线索来源", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MkLeadSource mkLeadSource)
    {
        return toAjax(mkLeadSourceService.updateMkLeadSource(mkLeadSource));
    }

    /**
     * 删除线索来源
     */
    @PreAuthorize("@ss.hasPermi('base:source:remove')")
    @Log(title = "线索来源", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sourceIds}")
    public AjaxResult remove(@PathVariable Long[] sourceIds)
    {
        return toAjax(mkLeadSourceService.deleteMkLeadSourceBySourceIds(sourceIds));
    }
}
