import request from '@/utils/request'
import qs from 'qs'

// 获取数据权限列表
export function dataPermList(data) {
  return request({
    url: 'v1/datas',
    method: 'get',
    params: data
  })
}
// 删除数据权限
export function dataPermDel(data) {
  return request({
    url: 'v1/datas/' + data.id,
    method: 'delete',
    params: data
  })
}
// 添加数据权限
export function dataPermAdd(data) {
  return request({
    url: 'v1/datas',
    method: 'post',
    data: qs.stringify(data)
  })
}
// 修改数据权限
export function dataPermEdit(data) {
  return request({
    url: 'v1/datas/' + data.id,
    method: 'put',
    data: qs.stringify(data)
  })
}
