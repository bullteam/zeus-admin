import request from '@/utils/request'
import qs from 'qs'

export function fetchMenuList(query) {
  return request({
    url: 'menu',
    method: 'get',
    params: query
  })
}

export function fetchMenu(id) {
  return request({
    url: 'menu/show',
    method: 'get',
    params: {
      id
    }
  })
}

export function createMenu(data) {
  return request({
    url: 'menu/add',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateMenu(data) {
  return request({
    url: 'menu/edit',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function deleteMenu(data) {
  return request({
    url: 'menu/del',
    method: 'post',
    data: qs.stringify(data)
  })
}

