import request from '@/utils/request'
import qs from 'qs'

export function fetchDeptList(query) {
  return request({
    url: 'v1/depts',
    method: 'get',
    params: query
  })
}

export function fetchDept(id) {
  return request({
    url: 'v1/depts',
    method: 'get',
    params: {
      id
    }
  })
}

export function createDept(data) {
  return request({
    url: 'v1/depts',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateDept(id, data) {
  return request({
    url: 'v1/depts/' + id,
    method: 'put',
    data: qs.stringify(data)
  })
}

export function rebuildDept(data) {
  return request({
    url: 'v1/depts/' + data.id + '/rebuild',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function checkMemberDept(data) {
  return request({
    url: 'v1/depts/' + data.id + '/check-no-member',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function deleteDept(data) {
  return request({
    url: 'v1/depts/' + data.id,
    method: 'delete',
    data: qs.stringify(data)
  })
}
