<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" v-show="showSearch" label-width="68px" class="search-form two-column-form">
      <!-- 第一行：来源名称和来源类型 -->
      <div class="form-row">
        <el-form-item label="来源名称" prop="sourceName" class="form-col">
          <el-input
            v-model="queryParams.sourceName"
            placeholder="请输入来源名称"
            clearable
            @keyup.enter="handleQuery"
            @input="debouncedQuery"
            show-word-limit
            maxlength="50"
            prefix-icon="Search"
          />
        </el-form-item>
        <el-form-item label="来源类型" prop="sourceType" class="form-col">
          <el-select v-model="queryParams.sourceType" placeholder="请选择来源类型" clearable filterable collapse-tags>
            <el-option
              v-for="dict in mk_source_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
      </div>
      
      <!-- 第二行：状态和操作按钮 -->
      <div class="form-row">
        <el-form-item label="状态" prop="status" class="form-col">
          <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
            <el-option
              v-for="dict in sys_job_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item class="form-col form-buttons">
          <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
          <el-button icon="Refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </div>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['base:source:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['base:source:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="() => handleDelete()"
          v-hasPermi="['base:source:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['base:source:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sourceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="来源ID" align="center" prop="sourceId" /> -->
      <el-table-column label="来源名称" align="center" prop="sourceName" />
      <el-table-column label="来源类型" align="center" prop="sourceType">
        <template #default="scope">
          <dict-tag :options="mk_source_type" :value="scope.row.sourceType"/>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="sys_job_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['base:source:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['base:source:remove']">删除</el-button>
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

    <!-- 添加或修改线索来源对话框 -->
    <el-dialog :title="title" v-model="open" width="700px" append-to-body>
      <el-form ref="sourceRef" :model="form" :rules="rules" label-width="80px" class="two-column-form">
          <!-- 第一行：来源名称和来源类型 -->
          <div class="form-row">
            <el-form-item label="来源名称" prop="sourceName" class="form-col">
              <el-input 
                v-model="form.sourceName" 
                placeholder="请输入来源名称" 
                show-word-limit
                maxlength="50"
                prefix-icon="Document"
                :validate-event="true"
              />
            </el-form-item>
            <el-form-item label="来源类型" prop="sourceType" class="form-col">
              <el-select 
                v-model="form.sourceType" 
                placeholder="请选择来源类型"
                filterable
                :validate-event="true"
              >
                <el-option
                  v-for="dict in mk_source_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </div>
          
          <!-- 来源描述单独一行（多行文本） -->
          <el-form-item label="来源描述" prop="sourceDesc">
            <el-input 
              v-model="form.sourceDesc" 
              type="textarea" 
              placeholder="请输入详细描述"
              :rows="3"
              show-word-limit
              maxlength="200"
              resize="vertical"
            />
          </el-form-item>
          
          <!-- 第二行：渠道成本和排序号 -->
          <div class="form-row">
            <el-form-item label="渠道成本" prop="sourceCost" class="form-col">
              <el-input 
                v-model="form.sourceCost" 
                placeholder="请输入渠道成本（元）"
                prefix-icon="Money"
                type="number"
                :min="0"
                :step="0.01"
                :validate-event="true"
              />
            </el-form-item>
            <el-form-item label="排序号" prop="sort" class="form-col">
              <el-input 
                v-model="form.sort" 
                placeholder="请输入排序号"
                prefix-icon="Rank"
                type="number"
                :min="0"
                :max="9999"
                :step="1"
                :validate-event="true"
              />
            </el-form-item>
          </div>
          
          <!-- 状态单独一行 -->
          <el-form-item label="状态" prop="status">
            <el-radio-group v-model="form.status" size="large">
              <el-radio
                v-for="dict in sys_job_status"
                :key="dict.value"
                :label="parseInt(dict.value)"
                :validate-event="true"
              >{{dict.label}}</el-radio>
            </el-radio-group>
          </el-form-item>
        <!-- <el-form-item label="删除标记" prop="delFlag">
          <el-radio-group v-model="form.delFlag">
            <el-radio
              v-for="dict in sys_yes_no"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item> -->
        <!-- <el-form-item label="预留字段1" prop="reserved1">
          <el-input v-model="form.reserved1" placeholder="请输入预留字段1" />
        </el-form-item>
        <el-form-item label="预留字段2" prop="reserved2">
          <el-input v-model="form.reserved2" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="预留字段3" prop="reserved3">
          <el-input v-model="form.reserved3" placeholder="请输入预留字段3" />
        </el-form-item> -->
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

<script setup name="Source">
import { listSource, getSource, delSource, addSource, updateSource } from "@/api/base/source"

const { proxy } = getCurrentInstance()
const { sys_job_status, sys_yes_no, mk_source_type } = proxy.useDict('sys_job_status', 'sys_yes_no', 'mk_source_type')

// 添加防抖函数用于搜索输入
function debounce(func, wait) {
  let timeout
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout)
      func(...args)
    }
    clearTimeout(timeout)
    timeout = setTimeout(later, wait)
  }
}

// 防抖搜索处理
const debouncedQuery = debounce(handleQuery, 300)

const sourceList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")

const data = reactive({
  form: {},
  queryParams: {
      pageNum: 1,
      pageSize: 10,
      sourceName: null,
      sourceType: null,
      status: null,
      delFlag: 0, // 只查询未删除的数据（delFlag=0）
      // 添加排序参数，按sort字段升序排列
      orderByColumn: 'sort',
      isAsc: 'asc'
    },
  rules: {
      sourceName: [
        { required: true, message: "来源名称不能为空", trigger: "blur" },
        { min: 1, max: 50, message: "来源名称长度应在 1 到 50 个字符之间", trigger: "blur" }
      ],
      sourceType: [
        { required: true, message: "来源类型不能为空", trigger: "change" }
      ],
      sourceDesc: [
        { max: 200, message: "来源描述不能超过 200 个字符", trigger: "blur" }
      ],
      sourceCost: [
        { type: 'number', min: 0, message: "渠道成本不能为负数", trigger: "blur" },
        { pattern: /^\d+(\.\d{1,2})?$/, message: "请输入有效的金额，最多两位小数", trigger: "blur" }
      ],
      sort: [
        { required: true, message: "排序号不能为空", trigger: "blur" },
        { 
          validator: (rule, value, callback) => {
            // 转换为数字进行验证
            const numValue = Number(value);
            if (isNaN(numValue)) {
              callback(new Error('请输入有效的数字'));
            } else if (numValue < 0 || numValue > 9999) {
              callback(new Error('排序号应在 0 到 9999 之间'));
            } else {
              callback();
            }
          }, 
          trigger: "blur"
        }
      ],
      status: [
        { required: true, message: "状态不能为空", trigger: "change" }
      ]
    }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询线索来源列表 */
function getList() {
  loading.value = true
  // 简化查询参数，只保留必要的分页和排序参数
  const queryData = {
    pageNum: queryParams.value.pageNum || 1,
    pageSize: queryParams.value.pageSize || 10,
    orderByColumn: queryParams.value.orderByColumn || 'sort',
    isAsc: queryParams.value.isAsc || 'asc'
  }
  console.log('Query data:', queryData);
  
  try {
    listSource(queryData).then(response => {
      console.log('API response received:', response);
      if (response && response.rows) {
        sourceList.value = response.rows;
        total.value = response.total || 0;
      } else {
        console.warn('Invalid response format:', response);
        sourceList.value = [];
        total.value = 0;
      }
      loading.value = false;
    }).catch(error => {
      console.error('API call failed:', error);
      sourceList.value = [];
      total.value = 0;
      loading.value = false;
      ElMessage.error('获取数据失败，请检查后端服务是否运行');
    })
  } catch (e) {
    console.error('Unexpected error:', e);
    sourceList.value = [];
    total.value = 0;
    loading.value = false;
    ElMessage.error('发生未知错误');
  }
}

// 取消按钮
function cancel() {
  open.value = false
  reset()
}

// 表单重置
function reset() {
  form.value = {
    sourceName: null,
    sourceType: null,
    sourceDesc: null,
    sourceCost: null,
    sort: 0, // 默认排序号为0
    status: 0 // 默认启用状态
  }
  if (proxy.$refs["sourceRef"]) {
    proxy.resetForm("sourceRef")
  }
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  // 保存排序参数和删除标记，避免重置后丢失
  const orderByColumn = queryParams.value.orderByColumn
  const isAsc = queryParams.value.isAsc
  const delFlag = queryParams.value.delFlag || 0
  
  proxy.resetForm("queryRef")
  
  // 恢复排序参数和删除标记
  queryParams.value.orderByColumn = orderByColumn
  queryParams.value.isAsc = isAsc
  queryParams.value.delFlag = delFlag // 确保保留delFlag=0的条件
  
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.sourceId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加线索来源"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  
  // 优化sourceId获取逻辑，确保能正确处理所有情况
  let _sourceId = null
  
  // 情况1: 行内修改按钮调用 - 从row对象中获取sourceId
  // 使用hasOwnProperty检查属性是否存在，避免因sourceId为0等falsy值导致判断失败
  if (row && typeof row === 'object' && Object.prototype.hasOwnProperty.call(row, 'sourceId')) {
    _sourceId = row.sourceId
  }
  // 情况2: 顶部修改按钮调用 - 从选中项中获取第一个sourceId
  else if (ids.value && ids.value.length > 0) {
    _sourceId = ids.value[0]
  }
  
  // 验证sourceId是否存在（即使是0这样的falsy值也应该允许）
  if (_sourceId === undefined || _sourceId === null) {
    proxy.$modal.msgError("请选择需要修改的数据项")
    return
  }
  
  // 验证sourceId类型
  if (typeof _sourceId !== 'string' && typeof _sourceId !== 'number') {
    proxy.$modal.msgError("无效的数据源ID")
    return
  }
  
  getSource(_sourceId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改线索来源"
  }).catch(error => {
    console.error("获取数据源详情失败:", error)
    proxy.$modal.msgError("获取数据源详情失败，请重试")
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["sourceRef"].validate(valid => {
    if (valid) {
      const now = new Date().toISOString().slice(0, 19).replace('T', ' ')
      if (form.value.sourceId != null) {
        // 修改操作
        const updateData = {
          sourceId: form.value.sourceId,
          sourceName: form.value.sourceName,
          sourceType: form.value.sourceType,
          sourceDesc: form.value.sourceDesc,
          sourceCost: form.value.sourceCost,
          sort: form.value.sort,
          status: form.value.status
        }
        updateSource(updateData).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        }).catch(error => {
          console.error("修改数据源失败:", error)
          proxy.$modal.msgError("修改失败，请重试")
        })
      } else {
        // 新增操作，为sourceId生成一个唯一值
        const timestamp = new Date().getTime()
        const submitData = {
          sourceId: timestamp, // 使用时间戳作为唯一ID
          sourceName: form.value.sourceName,
          sourceType: form.value.sourceType,
          sourceDesc: form.value.sourceDesc,
          sourceCost: form.value.sourceCost,
          sort: form.value.sort,
          status: form.value.status
        }
        addSource(submitData).then(response => {
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
  // 获取要删除的记录信息
  let sourceId, sourceName;
  
  // 单行删除情况（行内删除按钮调用）
  if (row && typeof row === 'object') {
    // 确保即使sourceId为0也能正确处理
    sourceId = row.sourceId;
    sourceName = row.sourceName || '未知名称';
    
    // 特殊处理单行删除的有效性验证
    // 只有当sourceId为undefined、null或空字符串时才认为无效
    if (sourceId === undefined || sourceId === null || sourceId === '') {
      proxy.$modal.msgError("无效的数据源ID");
      return;
    }
    
    // 单行删除确认
    proxy.$modal.confirm(`是否删除 "${sourceName}" 的线索来源？`).then(function() {
      // 使用updateSource进行软删除，设置delFlag=1
      const updateData = {
        sourceId: sourceId,
        delFlag: '1' // 设置删除标记为1
      };
      return updateSource(updateData);
    }).then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    }).catch((error) => {
      // 排除用户取消操作的情况
      if (error !== 'cancel') {
        console.error("删除失败:", error);
        proxy.$modal.msgError("删除失败，请重试");
      }
    });
  } 
  // 批量删除情况（顶部删除按钮调用）
  else if (ids.value && Array.isArray(ids.value) && ids.value.length > 0) {
    sourceId = ids.value;
    
    // 尝试获取选中的第一个记录的名称
    const firstSelected = sourceList.value.find(item => item.sourceId === sourceId[0]);
    sourceName = firstSelected ? firstSelected.sourceName || '选中项' : '选中项';
    
    // 批量删除确认
    proxy.$modal.confirm(`是否删除选中的 ${sourceId.length} 条线索来源？`).then(function() {
      // 批量删除需要逐个处理
      const deletePromises = sourceId.map(id => {
        const updateData = {
          sourceId: id,
          delFlag: '1' // 设置删除标记为1
        };
        return updateSource(updateData);
      });
      
      // 等待所有删除操作完成
      return Promise.all(deletePromises);
    }).then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
      // 清空选中状态
      ids.value = [];
      single.value = true;
      multiple.value = true;
    }).catch((error) => {
      // 排除用户取消操作的情况
      if (error !== 'cancel') {
        console.error("删除失败:", error);
        proxy.$modal.msgError("删除失败，请重试");
      }
    });
  }
  else {
    proxy.$modal.msgError("请选择需要删除的数据项");
    return;
  }
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('base/source/export', {
    ...queryParams.value
  }, `source_${new Date().getTime()}.xlsx`)
}

getList()
</script>

<style scoped>
/* 搜索表单样式 */
.search-form {
  background-color: #f5f7fa;
  padding: 15px;
  border-radius: 8px;
  margin-bottom: 15px;
}

/* 两列表单布局 - 基础样式 */
.two-column-form {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

/* 表单行样式 */
.form-row {
  display: flex;
  gap: 20px;
  margin-bottom: 0;
}

/* 表单项列样式 */
.form-col {
  flex: 1;
  margin-bottom: 0;
}

/* 确保表单项内容区域宽度适应 */
.form-col .el-form-item__content {
  width: 100%;
}

/* 来源名称输入框样式 */
.form-col .el-form-item__content:has(.el-input[placeholder="请输入来源名称"]) {
  width: 100%;
  max-width: none;
}

/* 搜索表单专用样式 - 确保所有搜索项在同一行显示 */
.search-form {
  /* 横向布局，不换行 */
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  align-items: center;
  gap: 15px;
  width: 100%;
  overflow-x: auto; /* 确保内容过多时可以横向滚动 */
}

/* 关键修改：让两个form-row容器内部的元素直接在父容器中显示 */
.search-form .form-row {
  /* 使用contents让子元素直接暴露给父容器 */
  display: contents;
  margin-bottom: 0;
}

/* 确保所有表单项都在一行 */
.search-form .el-form-item {
  margin-bottom: 0;
  flex-shrink: 0;
}

/* 调整搜索表单中各表单项的宽度比例 */
.search-form .el-form-item[prop="sourceName"] {
  flex: 2; /* 来源名称占较大比例 */
}

.search-form .el-form-item[prop="sourceType"] {
  flex: 1.2; /* 来源类型占中等比例 */
}

.search-form .el-form-item[prop="status"] {
  flex: 1; /* 状态占较小比例 */
}

.search-form .form-buttons {
  flex: 1; /* 按钮组占较小比例 */
  justify-content: flex-start;
}

/* 调整搜索表单中输入框宽度 */
.search-form .el-form-item__content .el-input,
.search-form .el-form-item__content .el-select {
  width: 100%;
  min-width: auto; /* 移除最小宽度限制 */
}

/* 确保搜索表单的按钮组正确显示 */
.search-form .form-buttons .el-form-item__content {
  gap: 8px;
}

/* 对话框中的来源类型输入框 - 进一步缩小尺寸 */
:deep(.el-dialog .el-form-item[prop="sourceType"] .el-form-item__content .el-input) {
  width: 15%; /* 更小宽度 */
}

/* 对话框中的来源名称输入框 - 进一步增加长度 */
:deep(.el-dialog .el-form-item[prop="sourceName"] .el-form-item__content .el-input) {
  width: 60%; /* 更长宽度 */
}

/* 操作按钮容器样式 */
.form-buttons {
  display: flex;
  align-items: flex-end;
  gap: 10px;
}

/* 按钮组内按钮间距 */
.form-buttons .el-form-item__content {
  display: flex;
  gap: 10px;
}

/* 对话框内样式优化 */
:deep(.el-dialog__body) {
  padding-top: 20px;
}

/* 确保对话框内的两列布局正常工作 */
:deep(.el-dialog .two-column-form) {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

/* 确保对话框内的行和列样式正确应用 */
:deep(.el-dialog .form-row) {
  display: flex;
  gap: 20px;
  margin-bottom: 0;
}

:deep(.el-dialog .form-col) {
  flex: 1;
  margin-bottom: 0;
}

/* 确保输入控件宽度适应两列布局 */
:deep(.el-input),
:deep(.el-select),
:deep(.el-textarea) {
  width: 100%;
}

/* 单选按钮组布局优化 */
.el-radio-group {
  display: flex;
  gap: 20px;
  align-items: center;
}

/* 表单项基础样式 */
.el-form-item {
  margin-bottom: 15px;
}

/* 输入框和下拉框的聚焦和悬停样式 */
.el-input__inner:focus,
.el-select__input.is-focus,
.el-textarea__inner:focus,
.el-input__inner:hover,
.el-select__input:hover,
.el-textarea__inner:hover {
  border-color: #409eff !important;
  box-shadow: 0 0 0 2px rgba(64, 158, 255, 0.2) !important;
}

/* 按钮样式优化 */
.el-button {
  padding: 9px 20px;
  font-size: 14px;
}

/* 表格样式优化 */
.el-table {
  margin-top: 10px;
  border-radius: 6px;
  overflow: hidden;
}

/* 分页组件样式 */
.el-pagination {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}

/* 表单标签样式 */
.el-form-item__label {
  font-weight: 500;
}

/* 多选下拉框样式优化 */
:deep(.el-select__tags) {
  flex-wrap: wrap;
}

/* 表单验证错误提示样式 */
:deep(.el-form-item__error) {
  font-size: 12px;
  padding-top: 4px;
}

/* 字数限制提示样式 */
:deep(.el-input__count) {
  color: #909399;
  font-size: 12px;
}

/* 响应式设计 */
@media screen and (max-width: 768px) {
  /* 表单行改为单列 */
  .form-row,
  :deep(.el-dialog .form-row) {
    flex-direction: column;
    gap: 15px;
  }
  
  /* 确保列占据整个宽度 */
  .form-col,
  :deep(.el-dialog .form-col) {
    width: 100%;
  }
  
  /* 搜索表单内边距调整 */
  .search-form {
    padding: 10px;
  }
  
  /* 内联表单适配移动端 */
  .el-form--inline .el-form-item {
    width: 100%;
    margin-right: 0;
    margin-bottom: 10px;
  }
  
  /* 对话框宽度适配 */
  .el-dialog {
    width: 90% !important;
  }
  
  /* 单选按钮组垂直排列 */
  .el-radio-group {
    flex-direction: column;
    gap: 10px;
    align-items: flex-start;
  }
  
  /* 按钮组垂直排列 */
  .form-buttons .el-form-item__content {
    flex-direction: column;
    gap: 8px;
  }
  
  /* 按钮宽度适配 */
  .form-buttons .el-button {
    width: 100%;
  }
}

/* 平板设备适配 */
@media screen and (min-width: 769px) and (max-width: 1024px) {
  .form-row,
  :deep(.el-dialog .form-row) {
    gap: 15px;
  }
  
  .search-form {
    padding: 12px;
  }
  
  .el-dialog {
    width: 80% !important;
  }
}
</style>
