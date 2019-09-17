import {
  loginByUsername,
  // logout,
  getUserPrem
} from '@/api/login'
import {
  getToken,
  setToken,
  removeToken
} from '@/utils/auth'
import { setTagNavListInLocalstorage } from '@/utils'
import { loginDingtalk } from '@/api/user'

const user = {
  state: {
    user: '',
    status: '',
    code: '',
    token: getToken(),
    name: '',
    avatar: '',
    introduction: '',
    roles: [],
    auth: [],
    setting: {
      articlePlatform: []
    }
  },

  mutations: {
    SET_CODE: (state, code) => {
      state.code = code
    },
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_INTRODUCTION: (state, introduction) => {
      state.introduction = introduction
    },
    SET_SETTING: (state, setting) => {
      state.setting = setting
    },
    SET_STATUS: (state, status) => {
      state.status = status
    },
    SET_NAME: (state, name) => {
      state.name = name
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    SET_AUTH: (state, roles) => {
      state.auth = roles
    }
  },

  actions: {
    // 用户名登录
    LoginByUsername({ commit }, userInfo) {
      // const username = userInfo.username.trim()
      return new Promise((resolve, reject) => {
        loginByUsername(userInfo)
          .then(response => {
            const data = response.data
            commit('SET_TOKEN', data.access_token)
            setToken(data.access_token)
            resolve()
          })
          .catch(error => {
            reject(error)
          })
        // const response = {
        //   data: {
        //     roles: ['admin', 'permission', 'user', 'dept', 'role', 'system', 'menu', 'logs', 'log_login', 'log_operation', 'log_error'],
        //     token: 'admin',
        //     introduction: '我是超级管理员',
        //     avatar: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
        //     name: 'Super Admin'
        //   }
        // }
        // const data = response.data
        // commit('SET_TOKEN', data.token)
        // setToken(response.data.token)
        // resolve()
      })
    },

    // 第三方登录
    LoginByThird({ commit }, data) {
      return new Promise((resolve, reject) => {
        loginDingtalk(data)
          .then(response => {
            const data = response.data
            commit('SET_TOKEN', data.access_token)
            setToken(data.access_token)
            resolve()
          })
          .catch(error => {
            reject(error)
          })
      })
    },

    // 获取用户信息
    GetUserInfo({ commit, state }) {
      return new Promise((resolve, reject) => {
        getUserPrem()
          .then(response => {
            if (!response.data) {
              // 由于mockjs 不支持自定义状态码只能这样hack
              reject('error')
            }
            const data = response.data
            const roles = []
            const auth = []
            data.result.forEach(o => {
              var p = o.obj.split(':')
              roles.push(p[0])
              auth.push(o.obj)
            })
            // console.log(Array.from(new Set(roles)))
            // roles.push('/permission/user')
            // roles.push('/permission')

            if (roles && roles.length > 0) {
              // 验证返回的roles是否是一个非空数组
              commit('SET_ROLES', Array.from(new Set(roles)))
            } else {
              reject('getInfo: roles must be a non-null array !')
            }
            if (auth && auth.length > 0) {
              // 验证返回的roles是否是一个非空数组
              commit('SET_AUTH', Array.from(new Set(auth)))
            } else {
              reject('getInfo: auth must be a non-null array !')
            }
            const res_data = {
              data: {
                roles: Array.from(new Set(roles)),
                auth: Array.from(new Set(auth)),
                token: 'admin',
                introduction: '我是超级管理员',
                avatar:
                  'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
                name: data.info.username || ''
              }
            }

            commit('SET_NAME', res_data.data.name)
            commit('SET_AVATAR', res_data.data.avatar)
            commit('SET_INTRODUCTION', res_data.data.introduction)
            resolve(res_data)
          })
          .catch(error => {
            reject(error)
          })
        //   const response = {
        //     data: {
        //       roles: ['admin', 'permission', 'user', 'dept', 'role', 'system', 'menu', 'logs', 'log_login', 'log_operation', 'log_error'],
        //       auth: ['user_add', 'user_show'],
        //       token: 'admin',
        //       introduction: '我是超级管理员',
        //       avatar: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
        //       name: 'Super Admin'
        //     }
        //   }
        //   if (!response.data) { // 由于mockjs 不支持自定义状态码只能这样hack
        //     reject('error')
        //   }
        //   const data = response.data
        //
        //   if (data.roles && data.roles.length > 0) { // 验证返回的roles是否是一个非空数组
        //     commit('SET_ROLES', data.roles)
        //   } else {
        //     reject('getInfo: roles must be a non-null array !')
        //   }
        //
        //   commit('SET_NAME', data.name)
        //   commit('SET_AVATAR', data.avatar)
        //   commit('SET_INTRODUCTION', data.introduction)
        //   resolve(response)
      })
    },

    // 第三方验证登录
    // LoginByThirdparty({ commit, state }, code) {
    //   return new Promise((resolve, reject) => {
    //     commit('SET_CODE', code)
    //     loginByThirdparty(state.status, state.email, state.code).then(response => {
    //       commit('SET_TOKEN', response.data.token)
    //       setToken(response.data.token)
    //       resolve()
    //     }).catch(error => {
    //       reject(error)
    //     })
    //   })
    // },

    // 登出
    LogOut({ commit, state }) {
      return new Promise((resolve, reject) => {
        // logout(state.token).then(() => {
        //   commit('SET_TOKEN', '')
        //   commit('SET_ROLES', [])
        //   removeToken()
        //   resolve()
        // }).catch(error => {
        //   reject(error)
        // })
        commit('SET_TOKEN', '')
        // setTagNavListInLocalstorage([])
        commit('DEL_ALL_VISITED_VIEWS')
        removeToken()
        resolve()
      })
    },

    // 前端 登出
    FedLogOut({ commit }) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        setTagNavListInLocalstorage([])
        removeToken()
        resolve()
      })
    },

    // 动态修改权限
    ChangeRoles({ commit, dispatch }, role) {
      return new Promise(resolve => {
        commit('SET_TOKEN', role)
        setToken(role)
        getUserPrem(role).then(response => {
          const data = response.data
          commit('SET_ROLES', data.roles)
          commit('SET_NAME', data.name)
          commit('SET_AVATAR', data.avatar)
          commit('SET_INTRODUCTION', data.introduction)
          dispatch('GenerateRoutes', data) // 动态修改权限后 重绘侧边菜单
          resolve()
        })
      })
    }
  }
}

export default user
