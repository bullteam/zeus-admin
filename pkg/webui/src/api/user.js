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
    method: 'POST',
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

// 两步验证-用户信息
export function security() {
  return request({
    url: 'v1/account/security',
    method: 'get'
  })
}

// 两步验证-绑定
export function bindcode(data) {
  return request({
    url: 'v1/account/bindcode',
    method: 'post',
    data: qs.stringify(data)
  })
}

// 两步验证-关闭
export function close2fa(data) {
  return request({
    url: 'v1/account/close2fa',
    method: 'post',
    data: qs.stringify(data)
  })
}

// 两步验证-校验code
export function checkGoogle2faCode(data) {
  return request({
    url: 'v1/account/check-google-2fa-code',
    method: 'post',
    data: qs.stringify(data)
  })
}

// 两步验证-判断是否校验Google 2fa code
export function FindCodeOpen() {
  return request({
    url: 'v1/account/find-code-open',
    method: 'get'
  })
}
