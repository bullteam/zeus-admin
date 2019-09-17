import request from '@/utils/request'
import qs from 'qs'

export function fetchDomainList(query) {
  return request({
    url: 'domain/list',
    method: 'get',
    params: query
  })
}

export function fetchDomain(id) {
  return request({
    url: 'domain/show',
    method: 'get',
    params: {
      id
    }
  })
}

export function createDomain(data) {
  return request({
    url: 'domain/add',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateDomain(data) {
  return request({
    url: 'domain/edit',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function deleteDomain(data) {
  return request({
    url: 'domain/del',
    method: 'post',
    data: qs.stringify(data)
  })
}
