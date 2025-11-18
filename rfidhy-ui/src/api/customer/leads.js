import request from '@/utils/request'

// 查询已分线索列表
export function listLeads(query) {
  return request({
    url: '/customer/leads/list',
    method: 'get',
    params: query
  })
}

// 查询已分线索详细
export function getLeads(leadId) {
  return request({
    url: '/customer/leads/' + leadId,
    method: 'get'
  })
}

// 新增已分线索
export function addLeads(data) {
  return request({
    url: '/customer/leads',
    method: 'post',
    data: data
  })
}

// 修改已分线索
export function updateLeads(data) {
  return request({
    url: '/customer/leads',
    method: 'put',
    data: data
  })
}

// 删除已分线索
export function delLeads(leadId) {
  return request({
    url: '/customer/leads/' + leadId,
    method: 'delete'
  })
}
