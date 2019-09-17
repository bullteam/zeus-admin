import request from '@/utils/request'
import qs from 'qs'

export function fetchDeptList(query) {
  return request({
    url: 'dept/list',
    method: 'get',
    params: query
  })
}

export function fetchDept(id) {
  return request({
    url: 'dept/show',
    method: 'get',
    params: {
      id
    }
  })
}

export function createDept(data) {
  return request({
    url: 'dept/add',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateDept(data) {
  return request({
    url: 'dept/edit',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function checkMemberDept(data) {
  return request({
    url: 'dept/check-no-member',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function deleteDept(data) {
  return request({
    url: 'dept/del',
    method: 'post',
    data: qs.stringify(data)
  })
}
