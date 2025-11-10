import request from '@/utils/request'

// 查询线索来源列表
export function listSource(query) {
  return request({
    url: '/base/source/list',
    method: 'get',
    params: query
  })
}

// 查询线索来源详细
export function getSource(sourceId) {
  return request({
    url: '/base/source/' + sourceId,
    method: 'get'
  })
}

// 新增线索来源
export function addSource(data) {
  return request({
    url: '/base/source',
    method: 'post',
    data: data
  })
}

// 修改线索来源
export function updateSource(data) {
  return request({
    url: '/base/source',
    method: 'put',
    data: data
  })
}

// 删除线索来源
export function delSource(sourceId) {
  return request({
    url: '/base/source/' + sourceId,
    method: 'delete'
  })
}
