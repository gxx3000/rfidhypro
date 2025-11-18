<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="联系人" prop="leadName">
        <el-input
          v-model="queryParams.leadName"
          placeholder="请输入联系人"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入联系电话"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="电子邮箱" prop="email">
        <el-input
          v-model="queryParams.email"
          placeholder="请输入电子邮箱"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="线索来源" prop="sourceId">
        <el-select v-model="queryParams.sourceId" placeholder="请选择线索来源" clearable>
          <el-option
            v-for="item in sourceList"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="线索状态" prop="leadStatus">
        <el-select v-model="queryParams.leadStatus" placeholder="请选择线索状态" clearable>
          <el-option
            v-for="dict in mk_assign_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="线索等级" prop="level">
        <el-select v-model="queryParams.level" placeholder="请选择线索等级" clearable>
          <el-option
            v-for="dict in mk_lead_level"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="更新时间" prop="updateTime">
        <el-date-picker clearable
          v-model="queryParams.updateTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择更新时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['customer:leads:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['customer:leads:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['customer:leads:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['customer:leads:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="leadsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="线索ID" align="center" prop="leadId" /> -->
      <el-table-column label="联系人" align="center" prop="leadName" />
      <el-table-column label="联系电话" align="center" prop="phone" />
      <el-table-column label="线索来源" align="center" prop="sourceName" />
      <el-table-column label="线索状态" align="center" prop="leadStatus">
        <template #default="scope">
          <dict-tag :options="mk_assign_type" :value="scope.row.leadStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="线索等级" align="center" prop="level">
        <template #default="scope">
          <dict-tag :options="mk_lead_level" :value="scope.row.level"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['customer:leads:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['customer:leads:remove']">删除</el-button>
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

    <!-- 添加或修改已分线索对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="leadsRef" :model="form" :rules="rules" label-width="80px">
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

<script setup name="Leads">
import { listLeads, getLeads, delLeads, addLeads, updateLeads } from "@/api/customer/leads"
import { listSource } from "@/api/base/source"

const { proxy } = getCurrentInstance()
const { mk_assign_type, mk_lead_level } = proxy.useDict('mk_assign_type', 'mk_lead_level')

const leadsList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
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
    leadName: null,
    phone: null,
    email: null,
    sourceId: null,
    leadStatus: null,
    level: null,
    updateTime: null,
    orderByColumn: "createTime",
    isAsc: "desc"
  },
  rules: {
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询线索来源列表 */
function getSourceList() {
  listSource().then(response => {
    sourceList.value = response.rows.map(item => ({
      label: item.sourceName,
      value: item.sourceId
    }))
  })
}

/** 查询已分线索列表 */
function getList() {
  loading.value = true
  listLeads(queryParams.value).then(response => {
    leadsList.value = response.rows
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
    leadId: null,
    leadName: null,
    phone: null,
    email: null,
    sourceId: null,
    leadStatus: null,
    assignTo: null,
    level: null,
    address: null,
    description: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null,
    delFlag: null
  }
  proxy.resetForm("leadsRef")
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef")
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.leadId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加已分线索"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _leadId = row.leadId || ids.value
  getLeads(_leadId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改已分线索"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["leadsRef"].validate(valid => {
    if (valid) {
      if (form.value.leadId != null) {
        updateLeads(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addLeads(form.value).then(response => {
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
  const _leadIds = row.leadId || ids.value
  proxy.$modal.confirm('是否确认删除已分线索编号为"' + _leadIds + '"的数据项？').then(function() {
    return delLeads(_leadIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('customer/leads/export', {
    ...queryParams.value
  }, `leads_${new Date().getTime()}.xlsx`)
}

getSourceList()
getList()
</script>