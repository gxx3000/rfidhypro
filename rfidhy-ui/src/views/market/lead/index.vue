<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" v-show="showSearch" label-width="68px" class="search-form">
      <el-row :gutter="20">
        <el-col :span="8">
          <el-form-item label="联系人" prop="leadName">
            <el-input
              v-model="queryParams.leadName"
              placeholder="请输入联系人"
              clearable
              @keyup.enter="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="联系电话" prop="phone">
            <el-input
              v-model="queryParams.phone"
              placeholder="请输入联系电话"
              clearable
              @keyup.enter="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="8">
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
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="8">
          <el-form-item label="线索状态" prop="leadStatus">
            <el-select v-model="queryParams.leadStatus" placeholder="请选择线索状态" clearable>
              <el-option
                v-for="dict in mk_assign_type"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="线索等级" prop="level">
            <el-select v-model="queryParams.level" placeholder="请选择线索等级" clearable>
              <el-option
                v-for="dict in mk_lead_level"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="负责人" prop="assignTo">
            <el-select v-model="queryParams.assignTo" placeholder="请选择负责人" clearable filterable>
              <el-option
                v-for="user in userList"
                :key="user.userId"
                :label="user.nickName || user.userName"
                :value="user.userId">
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="24" class="search-buttons">
          <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
          <el-button icon="Refresh" @click="resetQuery">重置</el-button>
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

      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="View"
          @click="toggleShowDeleted"
        >{{ showDeleted ? '隐藏已删除' : '显示已删除' }}</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="leadList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- 移除线索ID列 -->
      <el-table-column label="联系人" align="center" prop="leadName" />
      <el-table-column label="联系电话" align="center" prop="phone" />
      <el-table-column label="线索来源" align="center" prop="sourceId">
        <template #default="scope">
          {{ getSourceName(scope.row.sourceId) }}
        </template>
      </el-table-column>
      <el-table-column label="线索状态" align="center" prop="leadStatus">
        <template #default="scope">
          {{ getStatusName(scope.row.leadStatus) }}
        </template>
      </el-table-column>
      <el-table-column label="线索等级" align="center" prop="level">
        <template #default="scope">
          <dict-tag :options="mk_lead_level" :value="scope.row.level"/>
        </template>
      </el-table-column>
      <el-table-column label="负责人名" align="center">
        <template #default="scope">
          {{ getUserName(scope.row.assignTo) }}
        </template>
      </el-table-column>
      
      <el-table-column label="创建者" align="center">
        <template #default="scope">
          {{ getUserName(scope.row.createBy) }}
        </template>
      </el-table-column>
      
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template #default="scope">
              <el-button link type="primary" icon="User" @click="handleAssign(scope.row)" v-hasPermi="['market:lead:assign']" />
              <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['market:lead:edit']" />
              <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['market:lead:remove']" />
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
    <el-dialog :title="title" v-model="open" width="900px" append-to-body>
      <el-form ref="leadRef" :model="form" :rules="rules" label-width="80px">
      
        <!-- 第一行：联系人与线索来源 -->
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="联系人" prop="leadName">
              <el-input v-model="form.leadName" placeholder="请输入联系人" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="线索来源" prop="sourceId">
              <el-select v-model="form.sourceId" placeholder="请选择线索来源">
                <el-option
                  v-for="source in sourceList"
                  :key="source.value"
                  :label="source.label"
                  :value="source.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <!-- 第二行：联系电话与电子邮箱 -->
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="联系电话" prop="phone">
              <el-input v-model="form.phone" placeholder="请输入联系电话" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="电子邮箱" prop="email">
              <el-input v-model="form.email" placeholder="请输入电子邮箱" />
            </el-form-item>
          </el-col>
        </el-row>
        
        <!-- 第三行：线索状态（已隐藏）与线索等级 -->
        <el-row :gutter="20">
          <el-col :span="12" v-show="false">
            <el-form-item label="线索状态" prop="leadStatus">
              <el-radio-group v-model="form.leadStatus">
                <el-radio
                  v-for="dict in mk_assign_type"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="线索等级" prop="level">
              <el-radio-group v-model="form.level">
                <el-radio
                  v-for="dict in mk_lead_level"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入地址" />
        </el-form-item>
        <el-form-item label="线索描述" prop="description">
          <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <!-- 删除标志已隐藏 -->
        <el-form-item label="删除标志" prop="delFlag" v-show="false">
          <el-input v-model="form.delFlag" placeholder="请输入删除标志" />
        </el-form-item>
        <el-divider content-position="center">线索分配信息</el-divider>
<!--        <el-row :gutter="10" class="mb8">-->
<!--          <el-col :span="1.5">-->
<!--            <el-button type="primary" icon="Plus" @click="handleAddMkLeadAssign">添加</el-button>-->
<!--          </el-col>-->
<!--          <el-col :span="1.5">-->
<!--            <el-button type="danger" icon="Delete" @click="handleDeleteMkLeadAssign">删除</el-button>-->
<!--          </el-col>-->
<!--        </el-row>-->
        <el-table :data="mkLeadAssignList" :row-class-name="rowMkLeadAssignIndex" ref="mkLeadAssign" >
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="原负责人" width="150" align="center">
            <template #default="scope">
              {{ getUserName(scope.row.oldUserId) }}
            </template>
          </el-table-column>
          <el-table-column label="新负责人" width="150" align="center">
            <template #default="scope">
              {{ getUserName(scope.row.newUserId) }}
            </template>
          </el-table-column>
          <el-table-column label="分配类型" prop="assignType" width="150" align="center">
            <template #default="scope">
              {{ getAssignTypeName(scope.row.assignType) }}
            </template>
          </el-table-column>
          <el-table-column label="分配原因" prop="assignReason" width="150" align="center">
            <template #default="scope">
              {{ scope.row.assignReason || '-' }}
            </template>
          </el-table-column>
          <el-table-column label="分配时间" prop="assignTime" width="240" align="center">
            <template #default="scope">
              {{ scope.row.assignTime || '-' }}
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

    <!-- 分配线索对话框 -->
    <el-dialog :title="'分配线索给业务员'" v-model="assignDialogVisible" width="500px" append-to-body>
      <el-form ref="assignRef" :model="assignForm" :rules="assignRules" label-width="100px">
        <el-form-item label="联系人" prop="leadName">
          <el-input v-model="assignForm.leadName" disabled />
        </el-form-item>
        <el-form-item label="当前负责人" prop="currentAssignTo">
          <el-input v-model="assignForm.currentAssignTo" disabled />
        </el-form-item>
        <el-form-item label="新负责人" prop="newAssignTo" required>
          <el-select v-model="assignForm.newAssignTo" placeholder="请选择新负责人" filterable>
            <el-option
              v-for="user in userList"
              :key="user.userId"
              :label="user.nickName || user.userName"
              :value="user.userId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="分配原因" prop="assignReason">
          <el-input v-model="assignForm.assignReason" type="textarea" placeholder="请输入分配原因" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitAssignForm">确 定</el-button>
          <el-button @click="cancelAssign">取 消</el-button>
        </div>
      </template>
    </el-dialog>


  </div>
</template>

<script setup name="Lead">
import { listLead, getLead, delLead, addLead, updateLead } from "@/api/market/lead"
import { listSource } from "@/api/base/source"
import { listUser } from "@/api/system/user"

const { proxy } = getCurrentInstance()
const { mk_assign_type, mk_lead_level } = proxy.useDict('mk_assign_type', 'mk_lead_level')
const sourceList = ref([])

// 调试日志，查看mk_assign_type的结构和内容
console.log('mk_assign_type:', mk_assign_type)

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

// 是否显示已删除的数据
const showDeleted = ref(false)

const data = reactive({
  form: {},
  assignForm: {
    leadId: null,
    leadName: '',
    currentAssignTo: '',
    newAssignTo: '',
    assignReason: ''
  },
  assignRules: {
    newAssignTo: [
      { required: true, message: "请选择新负责人", trigger: "change" }
    ]
  },
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
    delFlag: '0', // 默认只显示未删除的数据
    del_flag: '0', // 兼容后端可能使用的下划线命名
    orderByColumn: 'createTime',
    isAsc: 'desc'
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

const { queryParams, form, rules, assignForm, assignRules } = toRefs(data)

// 分配对话框是否显示
const assignDialogVisible = ref(false)

/** 获取线索来源列表 */
function getSourceList() {
  listSource().then(response => {
    // 将来源数据转换为下拉框需要的格式
    sourceList.value = response.rows.map(item => ({
      label: item.sourceName,
      value: item.sourceId
    }))
  })
}

/** 根据sourceId获取来源名称 */
function getSourceName(sourceId) {
  const source = sourceList.value.find(item => item.value === sourceId);
  return source ? source.label : '-';
}

/** 根据assignType获取分配类型名称 */
function getAssignTypeName(assignType) {
  const type = mk_assign_type.value.find(item => item.value === assignType);
  return type ? type.label : '-';
}

/** 处理线索状态变化事件 */
function handleStatusChange(value) {
  console.log('线索状态值变化为:', value, '类型:', typeof value);
  // 当值为undefined时，设置为空值而不是转换为字符串
  if (value === undefined) {
    queryParams.value.leadStatus = null;
  } else {
    // 其他情况确保存储的是字符串类型
    queryParams.value.leadStatus = String(value);
  }
  console.log('更新后的查询参数状态值:', queryParams.value.leadStatus, '类型:', typeof queryParams.value.leadStatus);
}

/** 根据leadStatus获取状态名称 */
function getStatusName(leadStatus) {
  // 详细调试日志，查看所有相关数据
  console.log('getStatusName调用，leadStatus值:', leadStatus, '类型:', typeof leadStatus);
  
  // 确保mk_assign_type是响应式对象且有value属性
  if (!mk_assign_type || !Array.isArray(mk_assign_type.value)) {
    console.error('mk_assign_type不正确:', mk_assign_type);
    return '-';
  }
  
  // 强制将leadStatus转换为字符串进行匹配
  const statusStr = String(leadStatus);
  
  // 使用字符串匹配，这是最可靠的方式
  let status = mk_assign_type.value.find(item => {
    const itemValueStr = String(item.value);
    console.log('比较状态值:', itemValueStr, '和', statusStr, '是否相等:', itemValueStr === statusStr);
    return itemValueStr === statusStr;
  });
  
  console.log('找到的状态:', status);
  return status ? status.label : '-';
}

// 用户列表缓存
const userList = ref([])
const userListLoaded = ref(false)

/** 加载用户列表数据 */
async function loadUserList() {
  if (!userListLoaded.value) {
    try {
      const response = await listUser()
      if (response && response.rows) {
        userList.value = response.rows
        userListLoaded.value = true
      }
    } catch (error) {
      console.error('加载用户列表失败:', error)
    }
  }
}

/** 根据用户ID获取用户名称 */
function getUserName(userId) {
  if (!userId) {
    return '-';
  }
  
  // 尝试从用户列表中查找对应的用户名
  const user = userList.value.find(u => String(u.userId) === String(userId))
  if (user && user.nickName) {
    return user.nickName
  } else if (user && user.userName) {
    return user.userName
  }
  
  // 如果找不到对应用户，返回默认格式
  // 如果用户ID是数字1，可能是管理员
  if (userId === 1 || userId === '1') {
    return '管理员';
  }
  
  // 对于其他用户ID，返回"用户{ID}"格式
  return `用户${userId}`;
}

/** 切换是否显示已删除的数据 */
function toggleShowDeleted() {
  // 切换showDeleted的值
  showDeleted.value = !showDeleted.value;
  
  // 根据showDeleted的值设置查询参数
  if (showDeleted.value) {
    // 显示已删除数据
    queryParams.value.delFlag = '1'
    queryParams.value.del_flag = '1'
  } else {
    // 隐藏已删除数据（只显示未删除数据）
    queryParams.value.delFlag = '0'
    queryParams.value.del_flag = '0'
  }
  
  console.log('切换显示已删除数据状态:', showDeleted.value)
  console.log('更新后的查询参数:', {
    delFlag: queryParams.value.delFlag,
    del_flag: queryParams.value.del_flag
  })
  
  // 重置页码为1，确保从第一页开始显示
  queryParams.value.pageNum = 1
  getList()
}

  /** 查询线索表列表 */
function getList() {
  loading.value = true
  // 创建查询参数的副本，并处理线索状态值
  const queryData = { ...queryParams.value }
  
  // 确保线索状态值是字符串类型，与后端存储保持一致
  if (queryData.leadStatus !== null && queryData.leadStatus !== undefined) {
    queryData.leadStatus = String(queryData.leadStatus)
    console.log('搜索使用的线索状态值:', queryData.leadStatus, '类型:', typeof queryData.leadStatus)
    // 输出mk_assign_type的值，帮助调试
    console.log('mk_assign_type选项:', mk_assign_type.value)
  }
  
  // 记录查询参数，便于调试
  console.log('查询参数:', queryData)
  
  listLead(queryData).then(response => {
    leadList.value = response.rows
    total.value = response.total
    loading.value = false
    console.log('搜索结果数量:', leadList.value.length)
  }).catch(error => {
    console.error('搜索请求失败:', error)
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
  // 安全地设置创建人信息，避免store未定义的情况
  form.value.createBy = 1 // 使用整数1作为默认管理员ID
  // 默认设置创建时间为当前时间
  const now = new Date()
  const year = now.getFullYear()
  const month = String(now.getMonth() + 1).padStart(2, '0')
  const day = String(now.getDate()).padStart(2, '0')
  const hours = String(now.getHours()).padStart(2, '0')
  const minutes = String(now.getMinutes()).padStart(2, '0')
  const seconds = String(now.getSeconds()).padStart(2, '0')
  form.value.createTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
  // 设置线索状态为新线索（默认值为0）
    form.value.leadStatus = '0'; // 新线索对应的正确数值是0
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

/** 删除按钮操作 - 改为设置线索状态为已失效或执行软删除 */
function handleDelete(row) {
  // 获取线索ID，可以是单个ID或批量ID数组
  let leadIds = []
  let isSingle = false
  let contactName = ''
  
  if (row && row.leadId) {
    // 单行操作
    leadIds = [row.leadId]
    isSingle = true
    contactName = row.leadName || ''
  } else if (ids.value && ids.value.length > 0) {
    // 批量操作，正确处理ids.value数组
    leadIds = Array.isArray(ids.value) ? ids.value : (typeof ids.value === 'string' ? ids.value.split(',').filter(id => id) : [])
  }
  
  // 确保至少有一个ID
  if (leadIds.length === 0) {
    proxy.$modal.msgWarning("请先选择要操作的线索")
    return
  }
  
  // 单行操作逻辑
  if (isSingle && leadIds.length === 1) {
    const leadId = Number(leadIds[0])
    
    // 先获取线索信息以判断状态
    getLead(leadId).then(response => {
      const leadData = response.data
      let confirmMessage = ''
      
      // 根据线索状态设置不同的确认提示
      if (leadData.leadStatus === '4') {
        // 已失效状态，提示是否删除
        confirmMessage = contactName ? 
          '是否确认删除联系人"' + contactName + '"的数据项？' : 
          '是否确认删除该线索？'
      } else {
        // 非已失效状态，提示是否设置为已失效
        confirmMessage = contactName ? 
          '是否确认将联系人"' + contactName + '"的数据项设置为已失效？' : 
          '是否确认将该线索设置为已失效？'
      }
      
      proxy.$modal.confirm(confirmMessage).then(async function() {
        try {
          // 根据线索状态执行不同操作
          if (leadData.leadStatus === '4') {
            // 已失效状态，执行软删除
            // 同时设置两种可能的字段名，确保兼容性
            leadData.del_flag = '1'
            leadData.delFlag = '1' // 可能后端使用驼峰命名
            console.log('执行软删除，更新数据:', leadData)
            await updateLead(leadData)
            proxy.$modal.msgSuccess("删除成功")
          } else {
            // 非已失效状态，设置为已失效
            leadData.leadStatus = '4'
            await updateLead(leadData)
            proxy.$modal.msgSuccess("设置已失效成功")
          }
          
          getList()
        } catch (error) {
          console.error("操作失败:", error)
          proxy.$modal.msgError("操作失败，请重试")
        }
      })
    }).catch(error => {
      console.error("获取线索信息失败:", error)
      proxy.$modal.msgError("获取线索信息失败，请重试")
    })
  } 
  // 批量操作逻辑
  else {
    // 批量操作需要先获取所有选中线索的状态
    // 由于批量操作比较复杂，我们这里采用分别处理的方式
    // 先显示确认对话框，然后根据每个线索的状态执行不同操作
    proxy.$modal.confirm('是否确认处理选中的' + leadIds.length + '条线索？').then(async function() {
      try {
        let hasFailure = false
        let successCount = 0
        
        // 循环处理每个线索ID
        for (const leadIdStr of leadIds) {
          try {
            const leadId = Number(leadIdStr)
            const response = await getLead(leadId)
            const leadData = response.data
            
            // 根据线索状态执行不同操作
            if (leadData.leadStatus === '4') {
              // 已失效状态，执行软删除
              // 同时设置两种可能的字段名，确保兼容性
              leadData.del_flag = '1'
              leadData.delFlag = '1' // 可能后端使用驼峰命名
              console.log(`执行线索ID ${leadId} 的软删除，更新数据:`, leadData)
              await updateLead(leadData)
            } else {
              // 非已失效状态，设置为已失效
              leadData.leadStatus = '4'
              await updateLead(leadData)
            }
            successCount++
          } catch (err) {
            console.error(`处理线索ID ${leadIdStr} 失败:`, err)
            hasFailure = true
          }
        }
        
        getList()
        
        // 根据处理结果显示不同的提示
        if (hasFailure) {
          if (successCount > 0) {
            proxy.$modal.msgWarning(`部分线索处理成功，共${successCount}条`)
          } else {
            proxy.$modal.msgError("所有线索处理失败，请检查后重试")
          }
        } else {
          proxy.$modal.msgSuccess(`所有${leadIds.length}条线索处理成功`)
        }
      } catch (error) {
        console.error("批量操作失败:", error)
        proxy.$modal.msgError("批量操作失败，请重试")
      }
    })
  }
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

/** 处理分配按钮点击事件 */
function handleAssign(row) {
  // 确保加载用户列表
  loadUserList()
  
  // 填充分配表单数据
  assignForm.value.leadId = row.leadId
  assignForm.value.leadName = row.leadName || ''
  
  // 获取当前负责人名称
  if (row.assignTo) {
    const currentUser = userList.value.find(u => String(u.userId) === String(row.assignTo))
    assignForm.value.currentAssignTo = currentUser ? (currentUser.nickName || currentUser.userName) : `用户${row.assignTo}`
  } else {
    assignForm.value.currentAssignTo = '-'
  }
  
  // 重置其他字段
  assignForm.value.newAssignTo = ''
  assignForm.value.assignReason = ''
  
  // 显示分配对话框
  assignDialogVisible.value = true
}

/** 提交分配表单 */
async function submitAssignForm() {
  try {
    // 验证表单
    await proxy.$refs["assignRef"].validate()
    
    console.log("开始分配操作，线索ID:", assignForm.value.leadId)
    
    // 获取线索信息
    const leadResponse = await getLead(assignForm.value.leadId)
    const leadData = leadResponse.data
    
    // 更新负责人信息
    const oldAssignTo = leadData.assignTo || null
    leadData.assignTo = assignForm.value.newAssignTo
    
    // 将线索状态更新为已分配
    const previousStatus = leadData.leadStatus
    leadData.leadStatus = '1' // '1'表示已分配状态
    console.log("线索状态已从", previousStatus, "更新为已分配(1)，当前状态值:", leadData.leadStatus)
    
    // 如果存在线索分配列表，添加新的分配记录
    if (!leadData.mkLeadAssignList) {
      leadData.mkLeadAssignList = []
    }
    
    // 获取当前用户信息，添加安全检查
    const userStore = proxy.userStore || {}
    // 确保create_by字段不为空，使用默认值'1'（管理员ID）作为后备
    const currentUserId = String(userStore.id || '1') // 确保是字符串类型
    console.log("当前用户ID:", currentUserId, "类型:", typeof currentUserId)
    
    // 格式化时间为后端需要的'yyyy-MM-dd HH:mm:ss'格式
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const formattedTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    
    // 同时在主leadData对象上设置create_by字段，确保后端处理时能获取到
    leadData.create_by = currentUserId
    console.log("主线索对象的create_by字段:", leadData.create_by)
    
    // 创建新的分配记录，确保数据类型正确
    const assignRecord = {
      oldUserId: oldAssignTo, // 不转换为空字符串，保留null值
      newUserId: assignForm.value.newAssignTo, // 保持原始类型
      assignType: '1', // 假设1表示手动分配
      assignReason: assignForm.value.assignReason || '',
      assignTime: formattedTime, // 使用格式化的时间字符串
      create_by: currentUserId, // 使用当前用户ID
      createTime: formattedTime, // 使用格式化的时间字符串
      leadId: assignForm.value.leadId // 明确添加线索ID
    }
    
    console.log("创建分配记录:", assignRecord)
    leadData.mkLeadAssignList.push(assignRecord)
    
    // 提交更新前再次确认状态值
    console.log("提交更新的线索数据:", {
      leadId: leadData.leadId,
      assignTo: leadData.assignTo,
      leadStatus: leadData.leadStatus, // 记录状态值
      statusText: '已分配', // 记录状态文本说明
      assignRecordCount: leadData.mkLeadAssignList.length
    })
    
    // 确保状态字段被正确包含在提交数据中
    const leadDataToSubmit = {
      ...leadData,
      leadStatus: leadData.leadStatus || '1' // 确保状态值存在
    }
    
    const updateResponse = await updateLead(leadDataToSubmit)
    console.log("更新响应:", updateResponse)
    
    // 关闭对话框并刷新列表
    proxy.$modal.msgSuccess("分配成功")
    assignDialogVisible.value = false
    getList()
  } catch (error) {
    console.error("分配失败:", error)
    // 显示更具体的错误信息
    const errorMessage = error.response?.data?.msg || error.message || "未知错误"
    proxy.$modal.msgError(`分配失败: ${errorMessage}`)
  }
}

/** 取消分配操作 */
function cancelAssign() {
  assignDialogVisible.value = false
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('market/lead/export', {
    ...queryParams.value
  }, `lead_${new Date().getTime()}.xlsx`)
}

// 初始化数据
getSourceList()
loadUserList() // 加载用户列表以显示真实姓名
getList()
</script>
