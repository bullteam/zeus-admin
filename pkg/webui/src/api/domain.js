import request from '@/utils/request'
import qs from 'qs'

export function fetchDomainList(query) {
  return request({
    url: 'v1/domains',
    method: 'get',
    params: query
  })
}

export function fetchDomain(id) {
  return request({
    url: 'v1/domains' + id,
    method: 'get'
  })
}

export function createDomain(data) {
  return request({
    url: 'v1/domains',
    method: 'post',
    data: qs.stringify(data)
  })
}

export function updateDomain(id, data) {
  return request({
    url: 'v1/domains/' + id,
    method: 'put',
    data: qs.stringify(data)
  })
}

export function deleteDomain(id, data) {
  return request({
    url: 'v1/domains/' + id,
    method: 'delete',
    data: qs.stringify(data)
  })
}
