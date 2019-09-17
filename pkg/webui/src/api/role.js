import request from '@/utils/request'
import qs from 'qs'

export function fetchRoleList(query) {
  return request({
    url: 'role/list',
    method: 'get',
    params: query
  })
}

export function fetchRole(id) {
  return request({
    url: 'role/show',
    method: 'get',
    params: {
      id
    }
  })
}

export function createRole(data) {
  return request({
    url: 'role/add',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateRole(data) {
  return request({
    url: 'role/edit',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function deleteRole(data) {
  return request({
    url: 'role/del',
    method: 'post',
    data: qs.stringify(data)
  })
}

