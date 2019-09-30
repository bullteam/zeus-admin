import request from '@/utils/request'
import qs from 'qs'

export function fetchMenuList(query) {
  return request({
    url: 'v1/menus',
    method: 'get',
    params: query
  })
}

export function fetchMenu(id) {
  return request({
    url: 'v1/menus',
    method: 'get',
    params: {
      id
    }
  })
}

export function createMenu(data) {
  return request({
    url: 'v1/menus',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateMenu(data) {
  return request({
    url: 'v1/menus/' + data.id,
    method: 'put',
    data: qs.stringify(data)
  })
}

export function deleteMenu(data) {
  return request({
    url: 'v1/menus/' + data.id,
    method: 'delete',
    data: qs.stringify(data)
  })
}

