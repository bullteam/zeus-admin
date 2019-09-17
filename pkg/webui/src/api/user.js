import request from '@/utils/request'
import qs from 'qs'

export function fetchUserList(query) {
  return request({
    url: 'user',
    method: 'get',
    params: query
  })
}

export function fetchUser(id) {
  return request({
    url: 'user/show',
    method: 'get',
    params: {
      id
    }
  })
}

export function createUser(data) {
  return request({
    url: 'user/add',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateUser(data) {
  return request({
    url: 'user/edit',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateUserStatus(data) {
  return request({
    url: 'user/updatestatus',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateUserPassWord(data) {
  return request({
    url: 'user/change-password',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateUserDept(data) {
  return request({
    url: 'user/move-department',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function changeUserPassword(data) {
  return request({
    url: 'user/change-user-password',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function deleteUser(data) {
  return request({
    url: 'user/del',
    method: 'post',
    data: qs.stringify(data)
  })
}

// 绑定钉钉
export function bind(data) {
  return request({
    url: '/account/bind',
    method: 'post',
    data: qs.stringify(data)
  })
}

// 第三方绑定账号列表
export function accountThird() {
  return request({
    url: '/account/third',
    method: 'get'
  })
}

// 第三方绑定账号列表
export function unbind(data) {
  return request({
    url: '/account/unbind',
    method: 'post',
    data: qs.stringify(data)
  })
}

// 钉钉登录
export function loginDingtalk(data) {
  return request({
    url: '/user/login-dingtalk',
    method: 'post',
    data: qs.stringify(data)
  })
}
