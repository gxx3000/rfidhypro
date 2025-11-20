import request from '@/utils/request'

// 查询客户列表列表
export function listCustomers(query) {
  return request({
    url: '/customer/customers/list',
    method: 'get',
    params: query
  })
}

// 查询客户列表详细
export function getCustomers(customerId) {
  return request({
    url: '/customer/customers/' + customerId,
    method: 'get'
  })
}

// 新增客户列表
export function addCustomers(data) {
  return request({
    url: '/customer/customers',
    method: 'post',
    data: data
  })
}

// 修改客户列表
export function updateCustomers(data) {
  return request({
    url: '/customer/customers',
    method: 'put',
    data: data
  })
}

// 删除客户列表
export function delCustomers(customerId) {
  return request({
    url: '/customer/customers/' + customerId,
    method: 'delete'
  })
}
