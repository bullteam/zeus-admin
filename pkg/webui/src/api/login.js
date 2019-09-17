import request from '@/utils/request'
import qs from 'qs'

export function loginByUsername(data) {
  return request({
    url: 'user/login',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function logout() {
  return request({
    url: 'login/logout',
    method: 'post'
  })
}

export function getUserPrem(token) {
  return request({
    url: 'user/perm/list?domain=root',
    method: 'get'
  })
}

export function getUserDomain(token) {
  return request({
    url: 'user/domain',
    method: 'get'
  })
}

export function getUserCaptcha(token) {
  return request({
    url: 'captcha/request',
    method: 'get',
    params: {
      token
    }
  })
}
