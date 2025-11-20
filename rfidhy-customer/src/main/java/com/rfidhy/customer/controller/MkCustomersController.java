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
import com.rfidhy.common.core.controller.BaseController;
import com.rfidhy.common.core.domain.AjaxResult;
import com.rfidhy.common.enums.BusinessType;
import com.rfidhy.customer.domain.MkCustomers;
import com.rfidhy.customer.service.IMkCustomersService;
import com.rfidhy.common.utils.poi.ExcelUtil;
import com.rfidhy.common.core.page.TableDataInfo;

/**
 * 客户列表Controller
 * 
 * @author rooney
 * @date 2025-11-20
 */
@RestController
@RequestMapping("/customer/customers")
public class MkCustomersController extends BaseController
{
    @Autowired
    private IMkCustomersService mkCustomersService;

    /**
     * 查询客户列表列表
     */
    @PreAuthorize("@ss.hasPermi('customer:customers:list')")
    @GetMapping("/list")
    public TableDataInfo list(MkCustomers mkCustomers)
    {
        startPage();
        List<MkCustomers> list = mkCustomersService.selectMkCustomersList(mkCustomers);
        return getDataTable(list);
    }

    /**
     * 导出客户列表列表
     */
    @PreAuthorize("@ss.hasPermi('customer:customers:export')")
    @Log(title = "客户列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MkCustomers mkCustomers)
    {
        List<MkCustomers> list = mkCustomersService.selectMkCustomersList(mkCustomers);
        ExcelUtil<MkCustomers> util = new ExcelUtil<MkCustomers>(MkCustomers.class);
        util.exportExcel(response, list, "客户列表数据");
    }

    /**
     * 获取客户列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('customer:customers:query')")
    @GetMapping(value = "/{customerId}")
    public AjaxResult getInfo(@PathVariable("customerId") Long customerId)
    {
        return success(mkCustomersService.selectMkCustomersByCustomerId(customerId));
    }

    /**
     * 新增客户列表
     */
    @PreAuthorize("@ss.hasPermi('customer:customers:add')")
    @Log(title = "客户列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MkCustomers mkCustomers)
    {
        return toAjax(mkCustomersService.insertMkCustomers(mkCustomers));
    }

    /**
     * 修改客户列表
     */
    @PreAuthorize("@ss.hasPermi('customer:customers:edit')")
    @Log(title = "客户列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MkCustomers mkCustomers)
    {
        return toAjax(mkCustomersService.updateMkCustomers(mkCustomers));
    }

    /**
     * 删除客户列表
     */
    @PreAuthorize("@ss.hasPermi('customer:customers:remove')")
    @Log(title = "客户列表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{customerIds}")
    public AjaxResult remove(@PathVariable Long[] customerIds)
    {
        return toAjax(mkCustomersService.deleteMkCustomersByCustomerIds(customerIds));
    }
}
