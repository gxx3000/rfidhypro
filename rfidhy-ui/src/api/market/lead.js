import request from '@/utils/request'

// 查询线索表列表
export function listLead(query) {
  return request({
    url: '/market/lead/list',
    method: 'get',
    params: query
  })
}

// 查询线索表详细
export function getLead(leadId) {
  return request({
    url: '/market/lead/' + leadId,
    method: 'get'
  })
}

// 新增线索表
export function addLead(data) {
  return request({
    url: '/market/lead',
    method: 'post',
    data: data
  })
}

// 修改线索表
export function updateLead(data) {
  return request({
    url: '/market/lead',
    method: 'put',
    data: data
  })
}

// 删除线索表
export function delLead(leadId) {
  return request({
    url: '/market/lead/' + leadId,
    method: 'delete'
  })
}
