import Cookies from 'js-cookie'
import {
  getDomainHost
} from '@/utils'

const TokenKey = 'Admin-Token'
export function getToken() {
  return Cookies.get(TokenKey) || ''
}

export function setToken(token) {
  if (!token) {
    console.warn('设置 cookies token 失败 token：' + token)
    return false
  }

  // 打包的环境
  if (process.env.NODE_ENV === 'production') {
    /**
     * @description 设置主域 .bullteam.xxx
     * 1. 获取当前域名对应的环境
     * 2. 设置当前环境的主域名
     */
    const domainHost = getDomainHost()
    Cookies.set(TokenKey, token, {
      domain: domainHost.domain
    })
  } else {
    // 设置 localhost:8080 | 127.0.0.1:8080
    Cookies.set(TokenKey, token)
  }
}

export function removeToken() {
  // 打包的环境
  if (process.env.NODE_ENV === 'production') {
    /**
     * @description 设置主域 .bullteam.xxx
     * 1. 获取当前域名对应的环境
     * 2. 设置当前环境的主域名
     */
    const domainHost = getDomainHost()
    Cookies.remove(TokenKey, {
      domain: domainHost.domain
    })
  } else {
    // 设置 localhost:8080 | 127.0.0.1:8080
    Cookies.remove(TokenKey)
  }
}
