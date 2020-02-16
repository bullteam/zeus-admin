import request from '@/utils/request'
import qs from 'qs'

export function fetchRoleList(query) {
  return request({
    url: 'v1/roles',
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
    url: 'v1/roles',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateRole(data) {
  return request({
    url: 'v1/roles/' + data.id,
    method: 'put',
    data: qs.stringify(data)
  })
}

export function deleteRole(data) {
  return request({
    url: 'v1/roles/' + data.id,
    method: 'delete',
    data: qs.stringify(data)
  })
}

export function fetchRoleDetail(data) {
  return request({
    url: 'v1/roles/' + data.id,
    method: 'get'
  })
}
