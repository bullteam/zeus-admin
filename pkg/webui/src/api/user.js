import request from '@/utils/request'
import qs from 'qs'

export function fetchUserList(query) {
  return request({
    url: 'v1/users',
    method: 'get',
    params: query
  })
}

export function fetchUser(id) {
  return request({
    url: 'v1/users',
    method: 'get',
    params: {
      id
    }
  })
}

export function fetchUserRoles(id) {
  return request({
    url: 'v1/users/' + id + '/roles',
    method: 'get'
  })
}

export function createUser(data) {
  return request({
    url: 'v1/users',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateUser(id, data) {
  return request({
    url: 'v1/users/' + id,
    method: 'put',
    data: qs.stringify(data)
  })
}

export function updateUserStatus(data) {
  return request({
    url: 'v1/users/' + data.id + '/status',
    method: 'put',
    data: qs.stringify(data)
  })
}

export function updateUserPassWord(data) {
  return request({
    url: 'v1/users/' + data.id + '/password',
    method: 'put',
    data: qs.stringify(data)
  })
}

export function updateUserDept(data) {
  return request({
    url: 'v1/users/department/move',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function changeUserPassword(data) {
  return request({
    url: 'v1/users/' + data.id + '/password',
    method: 'put',
    data: qs.stringify(data)
  })
}

export function deleteUser(data) {
  return request({
    url: 'v1/users/' + data.id,
    method: 'delete',
    data: qs.stringify(data)
  })
}

// 绑定钉钉
export function bind(data) {
  return request({
    url: 'v1/account/third-bind',
    method: 'post',
    data: qs.stringify(data)
  })
}

// 第三方绑定账号列表
export function accountThird() {
  return request({
    url: 'v1/account/thirds',
    method: 'get'
  })
}

// 第三方绑定账号列表
export function unbind(data) {
  return request({
    url: 'v1/account/third-unbind',
    method: 'post',
    data: qs.stringify(data)
  })
}

// 钉钉登录
export function loginDingtalk(data) {
  return request({
    url: 'v1/users/login/oauth',
    method: 'post',
    data: qs.stringify(data)
  })
}
