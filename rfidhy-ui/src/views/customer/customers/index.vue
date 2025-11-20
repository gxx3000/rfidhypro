<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="false" v-show="showSearch" label-width="100px" class="search-form">
      <el-row :gutter="20">
        <el-col :span="6">
          <el-form-item label="客户企业名称" prop="customerName">
            <el-input
              v-model="queryParams.customerName"
              placeholder="请输入客户企业名称"
              clearable
              @keyup.enter="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="客户简称" prop="customerShortName">
            <el-input
              v-model="queryParams.customerShortName"
              placeholder="请输入客户简称"
              clearable
              @keyup.enter="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="客户来源" prop="sourceType">
            <el-select v-model="queryParams.sourceType" placeholder="请选择客户来源" clearable>
              <el-option
                v-for="source in sourceList"
                :key="source.value"
                :label="source.label"
                :value="source.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="所属行业" prop="industryType">
            <el-select v-model="queryParams.industryType" placeholder="请选择所属行业" clearable>
              <el-option
                v-for="dict in dictData.sys_company_industry"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6">
          <el-form-item label="客户等级" prop="customerLevel">
            <el-select v-model="queryParams.customerLevel" placeholder="请选择客户等级" clearable>
              <el-option
                v-for="dict in dictData.mk_customer_level"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="合作状态" prop="cooperationStatus">
            <el-select v-model="queryParams.cooperationStatus" placeholder="请选择合作状态" clearable>
              <el-option
                v-for="dict in dictData.mk_cooperation_status"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="所属区域" prop="region">
            <el-cascader
              v-model="queryParams.region"
              :options="regionOptions"
              :props="regionProps"
              placeholder="请选择所属区域"
              clearable
              filterable
              style="width: 100%"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="负责人ID" prop="assignUserId">
            <el-input
              v-model="queryParams.assignUserId"
              placeholder="请输入负责人ID"
              clearable
              @keyup.enter="handleQuery"
            />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6">
          <el-form-item label="所属部门ID" prop="assignDeptId">
            <el-input
              v-model="queryParams.assignDeptId"
              placeholder="请输入所属部门ID"
              clearable
              @keyup.enter="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="创建时间" prop="createTime">
            <el-date-picker clearable
              v-model="queryParams.createTime"
              type="date"
              value-format="YYYY-MM-DD"
              placeholder="请选择创建时间"
              style="width: 100%;"
            >
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="更新时间" prop="updateTime">
            <el-date-picker clearable
              v-model="queryParams.updateTime"
              type="date"
              value-format="YYYY-MM-DD"
              placeholder="请选择更新时间"
              style="width: 100%;"
            >
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="6" class="search-buttons">
          <div style="display: flex; align-items: center; height: 100%; padding-top: 5px;">
            <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
            <el-button icon="Refresh" @click="resetQuery">重置</el-button>
          </div>
        </el-col>
      </el-row>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['customer:customers:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['customer:customers:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['customer:customers:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['customer:customers:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="customersList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="客户ID" align="center" prop="customerId" />-->
      <el-table-column label="客户简称" align="center" prop="customerShortName" />
<!--      <el-table-column label="来源线索ID" align="center" prop="leadId" />-->
      <el-table-column label="客户来源" align="center" prop="sourceType">
        <template #default="scope">
          {{ getSourceName(scope.row.sourceType) }}
        </template>
      </el-table-column>
      <el-table-column label="所属行业" align="center" prop="industryType">
        <template #default="scope">
          <dict-tag :options="dictData.sys_company_industry" :value="scope.row.industryType"/>
        </template>
      </el-table-column>
      <el-table-column label="客户等级" align="center" prop="customerLevel">
        <template #default="scope">
          <dict-tag :options="dictData.mk_customer_level" :value="scope.row.customerLevel"/>
        </template>
      </el-table-column>
      <el-table-column label="合作状态" align="center" prop="cooperationStatus">
        <template #default="scope">
          <dict-tag :options="dictData.mk_cooperation_status" :value="scope.row.cooperationStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="所属区域" align="center" prop="region">
        <template #default="scope">
          <dict-tag :options="dictData.sys_region_full" :value="scope.row.region"/>
        </template>
      </el-table-column>
      <el-table-column label="负责人ID" align="center" prop="assignUserId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['customer:customers:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['customer:customers:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改客户列表对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="customersRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="客户企业名称" prop="customerName">
          <el-input v-model="form.customerName" placeholder="请输入客户企业名称" />
        </el-form-item>
        <el-form-item label="客户简称" prop="customerShortName">
          <el-input v-model="form.customerShortName" placeholder="请输入客户简称" />
        </el-form-item>
        <el-form-item label="客户来源" prop="sourceType">
          <el-select v-model="form.sourceType" placeholder="请选择客户来源">
            <el-option
              v-for="source in sourceList"
              :key="source.value"
              :label="source.label"
              :value="source.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所属行业" prop="industryType">
          <el-select v-model="form.industryType" placeholder="请选择所属行业">
            <el-option
              v-for="dict in dictData.sys_company_industry"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="客户等级" prop="customerLevel">
          <el-select v-model="form.customerLevel" placeholder="请选择客户等级">
            <el-option
              v-for="dict in dictData.mk_customer_level"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="合作状态" prop="cooperationStatus">
          <el-select v-model="form.cooperationStatus" placeholder="请选择合作状态">
            <el-option
              v-for="dict in dictData.mk_cooperation_status"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所属区域" prop="region">
          <el-cascader
            v-model="form.region"
            :options="regionOptions"
            :props="regionProps"
            placeholder="请选择所属区域"
            clearable
            filterable
            style="width: 100%"
          />
        </el-form-item>
        <el-form-item label="详细地址" prop="address">
          <el-input v-model="form.address" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="法定代表人" prop="legalPerson">
          <el-input v-model="form.legalPerson" placeholder="请输入法定代表人" />
        </el-form-item>
        <el-form-item label="注册资本" prop="registeredCapital">
          <el-input v-model="form.registeredCapital" placeholder="请输入注册资本" />
        </el-form-item>
        <el-form-item label="成立日期" prop="establishDate">
          <el-date-picker clearable
            v-model="form.establishDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择成立日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="企业官网" prop="website">
          <el-input v-model="form.website" placeholder="请输入企业官网" />
        </el-form-item>
        <el-form-item label="企业电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入企业电话" />
        </el-form-item>
        <el-form-item label="企业邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入企业邮箱" />
        </el-form-item>
        <el-form-item label="纳税人识别号" prop="taxNo">
          <el-input v-model="form.taxNo" placeholder="请输入纳税人识别号" />
        </el-form-item>
        <el-form-item label="客户描述" prop="description">
          <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="负责人ID" prop="assignUserId">
          <el-input v-model="form.assignUserId" placeholder="请输入负责人ID" />
        </el-form-item>
        <el-form-item label="所属部门ID" prop="assignDeptId">
          <el-input v-model="form.assignDeptId" placeholder="请输入所属部门ID" />
        </el-form-item>
        <el-form-item label="附件IDs" prop="attachmentIds">
          <el-input v-model="form.attachmentIds" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="删除标记" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入删除标记" />
        </el-form-item>
        <el-form-item label="预留字段1" prop="reserved1">
          <el-input v-model="form.reserved1" placeholder="请输入预留字段1" />
        </el-form-item>
        <el-form-item label="预留字段2" prop="reserved2">
          <el-input v-model="form.reserved2" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="预留字段3" prop="reserved3">
          <el-input v-model="form.reserved3" placeholder="请输入预留字段3" />
        </el-form-item>
        <el-divider content-position="center">客户联系人信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="Plus" @click="handleAddMkCustomerContact">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="Delete" @click="handleDeleteMkCustomerContact">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="mkCustomerContactList" :row-class-name="rowMkCustomerContactIndex" @selection-change="handleMkCustomerContactSelectionChange" ref="mkCustomerContact">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="联系人姓名" prop="contactName" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.contactName" placeholder="请输入联系人姓名" />
            </template>
          </el-table-column>
          <el-table-column label="职位" prop="position" width="150">
            <template #default="scope">
              <el-select v-model="scope.row.position" placeholder="请选择职位">
                  <el-option
                    v-for="dict in dictData.sys_customer_job"
                    :key="dict.value"
                    :label="dict.label"
                    :value="dict.value"
                  ></el-option>
                </el-select>
            </template>
          </el-table-column>
          <el-table-column label="手机号" prop="phone" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.phone" placeholder="请输入手机号" />
            </template>
          </el-table-column>
          <el-table-column label="是否主联系人" prop="isPrimary" width="150">
            <template #default="scope">
              <el-select v-model="scope.row.isPrimary" placeholder="请选择是否主联系人">
                  <el-option
                    v-for="dict in dictData.sys_yes_no"
                    :key="dict.value"
                    :label="dict.label"
                    :value="dict.value"
                  ></el-option>
                </el-select>
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Customers">
import { listCustomers, getCustomers, delCustomers, addCustomers, updateCustomers } from "@/api/customer/customers"
import { listSource } from "@/api/base/source"
import { ref, reactive, toRefs, onBeforeUnmount, watchEffect, nextTick, onMounted } from 'vue'

const { proxy } = getCurrentInstance()
// 使用reactive对象管理字典数据
const dictData = reactive({
  mk_customer_level: [],
  sys_company_industry: [],
  sys_region_full: [],
  sys_yes_no: [],
  sys_user_sex: [],
  mk_cooperation_status: [],
  sys_customer_job: []
})

// 定义区域级联选择相关变量
const regionOptions = ref([])
const regionProps = {
  value: 'value',
  label: 'label',
  children: 'children',
  checkStrictly: true // 支持选择任意一级
}

// 加载字典数据
const { mk_customer_level, sys_company_industry, sys_region_full, sys_yes_no, sys_user_sex, mk_cooperation_status, sys_customer_job } = proxy.useDict('mk_customer_level', 'sys_company_industry', 'sys_region_full', 'sys_yes_no', 'sys_user_sex', 'mk_cooperation_status', 'sys_customer_job')

// 将获取到的字典数据赋值给reactive对象
watchEffect(() => {
  dictData.mk_customer_level = mk_customer_level.value || []
  dictData.sys_company_industry = sys_company_industry.value || []
  dictData.sys_region_full = sys_region_full.value || []
  dictData.sys_yes_no = sys_yes_no.value || []
  dictData.sys_user_sex = sys_user_sex.value || []
  dictData.mk_cooperation_status = mk_cooperation_status.value || []
  dictData.sys_customer_job = sys_customer_job.value || []
})

const customersList = ref([])
const mkCustomerContactList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const checkedMkCustomerContact = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")
const sourceList = ref([])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    customerName: null,
    customerShortName: null,
    sourceType: null,
    industryType: null,
    customerLevel: null,
    cooperationStatus: null,
    region: null,
    description: null,
    assignUserId: null,
    assignDeptId: null,
    attachmentIds: null,
    createTime: null,
    updateTime: null,
  },
  rules: {
    customerShortName: [
      { required: true, message: "客户简称不能为空", trigger: "blur" }
    ],
    cooperationStatus: [
      { required: true, message: "合作状态不能为空", trigger: "change" }
    ],
    delFlag: [
      { required: true, message: "删除标记不能为空", trigger: "blur" }
    ],
    createBy: [
      { required: true, message: "创建人不能为空", trigger: "blur" }
    ],
    createTime: [
      { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
    updateTime: [
      { required: true, message: "更新时间不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 获取线索来源列表 */
function getSourceList() {
  listSource().then(response => {
    sourceList.value = response.rows.map(item => ({
      label: item.sourceName,
      value: item.sourceId
    }))
  })
}

/** 根据sourceType获取来源名称 */
function getSourceName(sourceType) {
  const source = sourceList.value.find(item => item.value === sourceType);
  return source ? source.label : '-';
}

/** 根据region编码查找级联路径 */
function findRegionPath(regionCode) {
  if (!regionCode) return null;
  
  // 确保regionCode是6位编码
  if (regionCode.length !== 6) {
    return [regionCode];
  }
  
  // 省级编码（以0000结尾）
  if (regionCode.endsWith('0000')) {
    return [regionCode];
  } 
  // 市级编码（以00结尾但不以0000结尾）
  else if (regionCode.endsWith('00')) {
    const provinceCode = regionCode.substring(0, 2) + '0000';
    return [provinceCode, regionCode];
  } 
  // 区县级编码（不以00结尾）
  else {
    const provinceCode = regionCode.substring(0, 2) + '0000';
    const cityCode = regionCode.substring(0, 4) + '00';
    // 检查是否存在对应的市级单位
    const cityExists = dictData.sys_region_full.find(item => item.value === cityCode);
    if (cityExists) {
      return [provinceCode, cityCode, regionCode];
    } else {
      // 如果没有对应的市级单位，直接关联到省级
      return [provinceCode, regionCode];
    }
  }
}

/** 根据region编码获取区域标签 */
function getRegionLabel(regionCode) {
  if (!regionCode) return '-';
  
  // 查找区域标签
  const region = dictData.sys_region_full.find(item => item.value === regionCode);
  return region ? region.label : regionCode;
}

/** 查询客户列表列表 */
function getList() {
  loading.value = true
  listCustomers(queryParams.value).then(response => {
    customersList.value = response.rows
    total.value = response.total
    loading.value = false
  })
}

// 取消按钮
function cancel() {
  open.value = false
  reset()
}

// 表单重置
function reset() {
  form.value = {
    customerId: null,
    customerName: null,
    customerShortName: null,
    sourceType: null,
    industryType: null,
    customerLevel: null,
    cooperationStatus: null,
    scaleType: null,
    region: null,
    address: null,
    legalPerson: null,
    registeredCapital: null,
    establishDate: null,
    website: null,
    phone: null,
    email: null,
    taxNo: null,
    description: null,
    assignUserId: null,
    assignDeptId: null,
    attachmentIds: null,
    delFlag: null,
    createBy: null,
    createTime: null,
    updateTime: null,
    reserved1: null,
    reserved2: null,
    reserved3: null
  }
  mkCustomerContactList.value = []
  proxy.resetForm("customersRef")
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  // 处理级联选择器的值
  if (Array.isArray(queryParams.value.region)) {
    // 如果是数组，取最后一个值（可能是省、市或区县编码）
    queryParams.value.region = queryParams.value.region[queryParams.value.region.length - 1] || null
  }
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef")
  // 确保region字段重置为null
  if (queryParams.value.region) {
    queryParams.value.region = null
  }
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.customerId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加客户列表"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _customerId = row.customerId || ids.value
  getCustomers(_customerId).then(response => {
    form.value = response.data
    // 处理区域回显
    if (form.value.region) {
      form.value.region = findRegionPath(form.value.region);
    }
    mkCustomerContactList.value = response.data.mkCustomerContactList
    open.value = true
    title.value = "修改客户列表"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["customersRef"].validate(valid => {
    if (valid) {
      // 处理表单中的级联选择器值
      const formCopy = {...form.value};
      if (Array.isArray(formCopy.region)) {
        // 如果是数组，取最后一个值（可能是省、市或区县编码）
        formCopy.region = formCopy.region[formCopy.region.length - 1] || null;
      }
      
      formCopy.mkCustomerContactList = mkCustomerContactList.value
      if (formCopy.customerId != null) {
        updateCustomers(formCopy).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addCustomers(formCopy).then(response => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _customerIds = row.customerId || ids.value
  proxy.$modal.confirm('是否确认删除客户列表编号为"' + _customerIds + '"的数据项？').then(function() {
    return delCustomers(_customerIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 客户联系人序号 */
function rowMkCustomerContactIndex({ row, rowIndex }) {
  row.index = rowIndex + 1
}

/** 客户联系人添加按钮操作 */
function handleAddMkCustomerContact() {
  let obj = {}
  obj.contactName = ""
  obj.position = ""
  obj.phone = ""
  obj.isPrimary = ""
  obj.remark = ""
  mkCustomerContactList.value.push(obj)
}

/** 客户联系人删除按钮操作 */
function handleDeleteMkCustomerContact() {
  if (checkedMkCustomerContact.value.length == 0) {
    proxy.$modal.msgError("请先选择要删除的客户联系人数据")
  } else {
    const mkCustomerContacts = mkCustomerContactList.value
    const checkedMkCustomerContacts = checkedMkCustomerContact.value
    mkCustomerContactList.value = mkCustomerContacts.filter(function(item) {
      return checkedMkCustomerContacts.indexOf(item.index) == -1
    })
  }
}

/** 复选框选中数据 */
function handleMkCustomerContactSelectionChange(selection) {
  checkedMkCustomerContact.value = selection.map(item => item.index)
}

/** 构建区域级联数据 */
function buildRegionTree() {
  // 先检查 sys_region_full 数据是否存在
  if (!dictData.sys_region_full || dictData.sys_region_full.length === 0) {
    return;
  }
  
  // 使用所有有效的数据（有编码和标签）
  const validRegions = dictData.sys_region_full.filter(item => 
    item.value && item.label
  );
  
  // 创建所有区域的映射表
  const regionMap = {};
  validRegions.forEach(item => {
    regionMap[item.value] = {...item, children: []};
  });
  
  // 分离不同层级的数据
  const provinces = [];  // 省级
  const cities = [];     // 市级
  const counties = [];   // 区县级
  
  validRegions.forEach(item => {
    const code = item.value;
    // 确保是6位编码
    if (code.length === 6) {
      if (code.endsWith('0000')) {
        // 省级编码（以0000结尾）
        provinces.push(regionMap[code]);
      } else if (code.endsWith('00')) {
        // 市级编码（以00结尾但不以0000结尾）
        cities.push(regionMap[code]);
      } else {
        // 区县级编码（不以00结尾）
        counties.push(regionMap[code]);
      }
    }
  });
  
  // 按编码排序，确保数据顺序正确
  provinces.sort((a, b) => a.value.localeCompare(b.value));
  cities.sort((a, b) => a.value.localeCompare(b.value));
  counties.sort((a, b) => a.value.localeCompare(b.value));
  
  // 构建树形结构
  // 市级关联到省级
  cities.forEach(city => {
    const cityCode = city.value;
    // 市级编码前两位对应省级编码
    const provinceCode = cityCode.substring(0, 2) + '0000';
    const province = regionMap[provinceCode];
    if (province) {
      province.children.push(city);
    }
  });
  
  // 区县级关联到市级
  counties.forEach(county => {
    const countyCode = county.value;
    // 区县级编码前四位对应市级编码
    const cityCode = countyCode.substring(0, 4) + '00';
    const city = regionMap[cityCode];
    
    if (city) {
      // 找到对应的市级单位
      city.children.push(county);
    } else {
      // 找不到对应的市级单位，尝试关联到省级单位
      const provinceCode = countyCode.substring(0, 2) + '0000';
      const province = regionMap[provinceCode];
      if (province) {
        province.children.push(county);
      }
    }
  });
  
  // 对子级进行排序
  provinces.forEach(province => {
    province.children.sort((a, b) => a.value.localeCompare(b.value));
    province.children.forEach(city => {
      if (city.children) {
        city.children.sort((a, b) => a.value.localeCompare(b.value));
      }
    });
  });
  
  // 筛选出顶级节点（省级）
  const tree = provinces;
  
  regionOptions.value = tree;
}

/** 监听区域数据变化，构建级联数据 */
watchEffect(() => {
  if (dictData.sys_region_full && dictData.sys_region_full.length > 0) {
    nextTick(() => {
      buildRegionTree();
    })
  }
})

// 添加一个新的监听器，确保在组件挂载后也能正确构建级联数据
onMounted(() => {
  // 如果数据已经存在，则立即构建级联数据
  if (dictData.sys_region_full && dictData.sys_region_full.length > 0) {
    buildRegionTree();
  }
})

/** 导出按钮操作 */
function handleExport() {
  proxy.download('customer/customers/export', {
    ...queryParams.value
  }, `customers_${new Date().getTime()}.xlsx`)
}

// 获取来源列表
getSourceList()
getList()

// 添加窗口焦点事件监听，确保页面刷新或切换回来时数据正常
window.addEventListener('focus', handleWindowFocus)
// 添加 visibilitychange 事件监听，处理标签页切换
document.addEventListener('visibilitychange', handleVisibilityChange)

// 组件卸载时移除事件监听
onBeforeUnmount(() => {
  window.removeEventListener('focus', handleWindowFocus)
  document.removeEventListener('visibilitychange', handleVisibilityChange)
})

// 处理窗口获得焦点事件
function handleWindowFocus() {
  // 检查是否需要重新加载字典数据
  const isAnyDictEmpty = Object.values(dictData).some(list => !list || list.length === 0)
  if (isAnyDictEmpty || (!regionOptions.value || regionOptions.value.length === 0)) {
    console.log('检测到数据不完整，重新构建级联数据...')
    buildRegionTree()
  }
}

// 处理页面可见性变化事件
function handleVisibilityChange() {
  if (!document.hidden) {
    // 页面变为可见时检查数据
    const isAnyDictEmpty = Object.values(dictData).some(list => !list || list.length === 0)
    if (isAnyDictEmpty || (!regionOptions.value || regionOptions.value.length === 0)) {
      console.log('页面可见性改变，重新构建级联数据...')
      buildRegionTree()
    }
  }
}
</script>

<style lang="scss" scoped>
.search-form {
  margin-bottom: 20px;
  padding: 20px 15px 5px;
  background-color: #f8f9fa;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.search-buttons {
  display: flex;
  align-items: flex-end;
  justify-content: flex-start;
  height: 100%;
}
</style>
