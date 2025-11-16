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
          v-hasPermi="['market:lead:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['market:lead:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['market:lead:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['market:lead:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="leadList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="线索ID" align="center" prop="leadId" />
      <el-table-column label="联系人" align="center" prop="leadName" />
      <el-table-column label="联系电话" align="center" prop="phone" />
      <el-table-column label="线索来源" align="center" prop="sourceId" />
      <el-table-column label="线索状态" align="center" prop="leadStatus">
        <template #default="scope">
          <dict-tag :options="mk_assign_type" :value="scope.row.leadStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="负责人ID" align="center" prop="assignTo" />
      <el-table-column label="线索等级" align="center" prop="level">
        <template #default="scope">
          <dict-tag :options="mk_lead_level" :value="scope.row.level"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['market:lead:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['market:lead:remove']">删除</el-button>
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

    <!-- 添加或修改线索表对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="leadRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="联系人" prop="leadName">
          <el-input v-model="form.leadName" placeholder="请输入联系人" />
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="电子邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入电子邮箱" />
        </el-form-item>
        <el-form-item label="线索状态" prop="leadStatus">
          <el-radio-group v-model="form.leadStatus">
            <el-radio
              v-for="dict in mk_assign_type"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="线索等级" prop="level">
          <el-radio-group v-model="form.level">
            <el-radio
              v-for="dict in mk_lead_level"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入地址" />
        </el-form-item>
        <el-form-item label="线索描述" prop="description">
          <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="删除标志" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入删除标志" />
        </el-form-item>
        <el-divider content-position="center">线索分配信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="Plus" @click="handleAddMkLeadAssign">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="Delete" @click="handleDeleteMkLeadAssign">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="mkLeadAssignList" :row-class-name="rowMkLeadAssignIndex" @selection-change="handleMkLeadAssignSelectionChange" ref="mkLeadAssign">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="原负责人ID" prop="oldUserId" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.oldUserId" placeholder="请输入原负责人ID" />
            </template>
          </el-table-column>
          <el-table-column label="新负责人ID" prop="newUserId" width="150">
            <template #default="scope">
              <el-select v-model="scope.row.newUserId" placeholder="请选择新负责人ID">
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="分配类型：0-自动分配 1-手动分配 2-转交 3-收回" prop="assignType" width="150">
            <template #default="scope">
              <el-select v-model="scope.row.assignType" placeholder="请选择分配类型：0-自动分配 1-手动分配 2-转交 3-收回">
                <el-option
                  v-for="dict in mk_assign_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="分配原因" prop="assignReason" width="150">
            <template #default="scope">
              <el-input v-model="scope.row.assignReason" placeholder="请输入分配原因" />
            </template>
          </el-table-column>
          <el-table-column label="分配时间" prop="assignTime" width="240">
            <template #default="scope">
              <el-date-picker clearable
                v-model="scope.row.assignTime"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="请选择分配时间">
              </el-date-picker>
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

<script setup name="Lead">
import { listLead, getLead, delLead, addLead, updateLead } from "@/api/market/lead"

const { proxy } = getCurrentInstance()
const { mk_assign_type, mk_lead_level } = proxy.useDict('mk_assign_type', 'mk_lead_level')

const leadList = ref([])
const mkLeadAssignList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const checkedMkLeadAssign = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")

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
    assignTo: null,
    level: null,
    description: null,
  },
  rules: {
    leadName: [
      { required: true, message: "联系人不能为空", trigger: "blur" }
    ],
    phone: [
      { required: true, message: "联系电话不能为空", trigger: "blur" }
    ],
    sourceId: [
      { required: true, message: "线索来源不能为空", trigger: "change" }
    ],
    leadStatus: [
      { required: true, message: "线索状态不能为空", trigger: "change" }
    ],
    createBy: [
      { required: true, message: "创建者不能为空", trigger: "blur" }
    ],
    createTime: [
      { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询线索表列表 */
function getList() {
  loading.value = true
  listLead(queryParams.value).then(response => {
    leadList.value = response.rows
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
  mkLeadAssignList.value = []
  proxy.resetForm("leadRef")
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
  title.value = "添加线索表"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _leadId = row.leadId || ids.value
  getLead(_leadId).then(response => {
    form.value = response.data
    mkLeadAssignList.value = response.data.mkLeadAssignList
    open.value = true
    title.value = "修改线索表"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["leadRef"].validate(valid => {
    if (valid) {
      form.value.mkLeadAssignList = mkLeadAssignList.value
      if (form.value.leadId != null) {
        updateLead(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addLead(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除线索表编号为"' + _leadIds + '"的数据项？').then(function() {
    return delLead(_leadIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 线索分配序号 */
function rowMkLeadAssignIndex({ row, rowIndex }) {
  row.index = rowIndex + 1
}

/** 线索分配添加按钮操作 */
function handleAddMkLeadAssign() {
  let obj = {}
  obj.oldUserId = ""
  obj.newUserId = ""
  obj.assignType = ""
  obj.assignReason = ""
  obj.assignTime = ""
  obj.remark = ""
  mkLeadAssignList.value.push(obj)
}

/** 线索分配删除按钮操作 */
function handleDeleteMkLeadAssign() {
  if (checkedMkLeadAssign.value.length == 0) {
    proxy.$modal.msgError("请先选择要删除的线索分配数据")
  } else {
    const mkLeadAssigns = mkLeadAssignList.value
    const checkedMkLeadAssigns = checkedMkLeadAssign.value
    mkLeadAssignList.value = mkLeadAssigns.filter(function(item) {
      return checkedMkLeadAssigns.indexOf(item.index) == -1
    })
  }
}

/** 复选框选中数据 */
function handleMkLeadAssignSelectionChange(selection) {
  checkedMkLeadAssign.value = selection.map(item => item.index)
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('market/lead/export', {
    ...queryParams.value
  }, `lead_${new Date().getTime()}.xlsx`)
}

getList()
</script>
