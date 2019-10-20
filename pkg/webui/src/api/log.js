import request from '@/utils/request'

export function fetchLoginLogList(query) {
  return request({
    url: 'v1/log/logins',
    method: 'get',
    params: query
  })
}

export function fetchOperationLogList(query) {
  return request({
    url: 'v1/log/operations',
    method: 'get',
    params: query
  })
}
