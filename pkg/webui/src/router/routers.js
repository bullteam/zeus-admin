/* Layout */
import Layout from '@/views/layout/Layout'

/** note: Submenu only appear when children.length>=1
 *  detail see  https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 **/

/**
 * hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
 *                                if not set alwaysShow, only more than one route under the children
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noredirect           if `redirect:noredirect` will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']     will control the page roles (you can set multiple roles)
    title: 'title'               the name show in submenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar,
    noCache: true                if true ,the page will no be cached(default is false)
  }
 **/
export const constantRouterMap = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path*',
        component: () => import('@/views/redirect/index')
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('@/views/login/index'),
    hidden: true
  },
  {
    path: '/third-login',
    name: 'thirdLogin',
    hidden: true
  },
  {
    path: '/auth-redirect',
    component: () => import('@/views/login/authredirect'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/errorPage/404'),
    hidden: true
  },
  {
    path: '/401',
    component: () => import('@/views/errorPage/401'),
    hidden: true
  },
  {
    path: '',
    component: Layout,
    redirect: 'dashboard',
    hidden: true,
    children: [
      {
        path: 'dashboard',
        component: () => import('@/views/dashboard/index'),
        name: 'Dashboard',
        meta: {
          title: 'dashboard',
          icon: 'dashboard',
          noCache: true,
          affix: true
        }
      },
      {
        path: 'my',
        component: () => import('@/views/my'),
        hidden: true,
        redirect: 'my/personal',
        children: [
          {
            path: 'personal',
            name: 'personal',
            meta: {
              title: 'personal'
            },
            component: () => import('@/views/my/personal')
          },
          {
            path: 'psw',
            name: 'psw',
            meta: {
              title: 'psw'
            },
            component: () => import('@/views/my/psw')
          },
          {
            path: 'third',
            name: 'third',
            meta: {
              title: 'third'
            },
            children: [
              {
                path: 'from/:from',
                name: 'thirdFrom',
                redirect: to => {
                  const { params, query } = to
                  return {
                    path: '/my/third',
                    query: { ...params, ...query }
                  }
                }
              }
            ],
            component: () => import('@/views/my/third')
          }
        ]
      }
    ]
  }
]

// export default constantRouterMap

export const asyncRouterMap = [
  {
    path: '/permission',
    component: Layout,
    alwaysShow: true, // will always show the root menu
    meta: {
      title: 'permission',
      icon: 'peoples',
      roles: ['/permission']
    },
    children: [
      {
        path: 'user',
        component: () => import('@/views/permission/user'),
        name: 'user',
        meta: {
          title: 'user',
          icon: 'peoples',
          roles: ['/permission/user']
        },
        auth: [
          {
            name: '浏览',
            code: 'show'
          },
          {
            name: '添加',
            code: 'add'
          },
          {
            name: '修改',
            code: 'edit'
          },
          {
            name: '删除',
            code: 'del'
          }
        ]
      },
      {
        path: 'dept',
        // name: 'dept',
        component: () => import('@/views/permission/deptrw'),
        redirect: '/permission/dept/dept',
        name: 'dept',
        meta: {
          title: 'dept',
          icon: 'peoples',
          roles: ['/permission/dept']
        },
        children: [
          {
            path: 'dept',
            component: () => import('@/views/permission/dept'),
            name: 'dept',
            hidden: true,
            meta: {
              title: 'dept',
              icon: 'peoples',
              roles: ['/permission/dept']
            },
            auth: [
              {
                name: '浏览',
                code: 'show'
              },
              {
                name: '添加',
                code: 'add'
              },
              {
                name: '修改',
                code: 'edit'
              },
              {
                name: '删除',
                code: 'del'
              }
            ]
          },
          {
            path: 'member',
            component: () => import('@/views/permission/member'),
            name: 'member',
            hidden: true,
            meta: {
              title: 'member',
              icon: 'peoples',
              roles: ['/permission/user']
            },
            auth: [
              {
                name: '浏览',
                code: 'show'
              },
              {
                name: '修改',
                code: 'edit'
              }
            ]
          }
        ]
      },
      {
        path: 'role',
        component: () => import('@/views/permission/role'),
        name: 'role',
        meta: {
          title: 'role',
          icon: 'peoples',
          roles: ['/permission/role']
        },
        auth: [
          {
            name: '浏览',
            code: 'show'
          },
          {
            name: '添加',
            code: 'add'
          },
          {
            name: '修改',
            code: 'edit'
          },
          {
            name: '删除',
            code: 'del'
          }
        ]
      }
    ]
  },
  {
    path: '/system',
    component: Layout,
    alwaysShow: true, // will always show the root menu
    meta: {
      title: 'system',
      icon: 'nested',
      roles: ['/auth-system']
    },
    children: [
      {
        path: 'menu',
        component: () => import('@/views/system/menu'),
        name: 'menu',
        meta: {
          title: 'menu',
          icon: 'peoples',
          roles: ['/auth-system/menu']
        },
        auth: [
          {
            name: '浏览',
            code: 'show'
          },
          {
            name: '添加',
            code: 'add'
          },
          {
            name: '修改',
            code: 'edit'
          },
          {
            name: '删除',
            code: 'del'
          }
        ]
      },
      {
        path: 'domain',
        component: () => import('@/views/system/domain'),
        name: 'domain',
        meta: {
          title: 'domain',
          icon: 'peoples',
          roles: ['/auth-system/domain']
        },
        auth: [
          {
            name: '浏览',
            code: 'show'
          },
          {
            name: '添加',
            code: 'add'
          },
          {
            name: '修改',
            code: 'edit'
          },
          {
            name: '删除',
            code: 'del'
          }
        ]
      },
      {
        path: 'dataPerm',
        component: () => import('@/views/system/dataPerm'),
        name: 'dataPerm',
        meta: {
          title: 'dataPerm',
          icon: 'peoples',
          roles: ['/auth-system/dataPerm']
        },
        auth: [
          {
            name: '浏览',
            code: 'show'
          },
          {
            name: '添加',
            code: 'add'
          },
          {
            name: '修改',
            code: 'edit'
          },
          {
            name: '删除',
            code: 'del'
          }
        ]
      }
    ]
  },
  // {
  //   path: '/logs',
  //   component: Layout,
  //   alwaysShow: true, // will always show the root menu
  //   meta: {
  //     title: 'logs',
  //     icon: 'chart',
  //     roles: ['/logs']
  //   },
  //   children: [
  //     {
  //       path: 'log_login',
  //       component: () => import('@/views/logs/login'),
  //       name: 'log_login',
  //       meta: {
  //         title: 'log_login',
  //         icon: 'peoples',
  //         roles: ['/logs/log_login']
  //       },
  //       auth: [
  //         {
  //           name: '浏览',
  //           code: 'show'
  //         }, {
  //           name: '添加',
  //           code: 'add'
  //         }, {
  //           name: '修改',
  //           code: 'edit'
  //         }, {
  //           name: '删除',
  //           code: 'del'
  //         }
  //       ]
  //     },
  //     {
  //       path: 'log_operation',
  //       component: () => import('@/views/logs/operation'),
  //       name: 'log_operation',
  //       meta: {
  //         title: 'log_operation',
  //         icon: 'peoples',
  //         roles: ['/logs/log_operation']
  //       },
  //       auth: [
  //         {
  //           name: '浏览',
  //           code: 'show'
  //         }, {
  //           name: '添加',
  //           code: 'add'
  //         }, {
  //           name: '修改',
  //           code: 'edit'
  //         }, {
  //           name: '删除',
  //           code: 'del'
  //         }
  //       ]
  //     },
  //     {
  //       path: 'log_error',
  //       component: () => import('@/views/logs/error'),
  //       name: 'log_error',
  //       meta: {
  //         title: 'log_error',
  //         icon: 'peoples',
  //         roles: ['/logs/log_error']
  //       },
  //       auth: [
  //         {
  //           name: '浏览',
  //           code: 'show'
  //         }, {
  //           name: '添加',
  //           code: 'add'
  //         }, {
  //           name: '修改',
  //           code: 'edit'
  //         }, {
  //           name: '删除',
  //           code: 'del'
  //         }
  //       ]
  //     }
  //   ]
  // },
  { path: '*', permission: false, redirect: '/404', hidden: true }
]
