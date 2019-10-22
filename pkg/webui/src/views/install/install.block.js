const installBlock = {
  type: 'form',
  ctx: 'edit',
  data: {
    sqlType: 'sqlite',
    dataPath: '/data/zeus.db',
    siteName: 'Zeus 宙斯权限后台管理系统',
    port: '8082',
    baseUrl: 'http://localhost:8082/',
    logPath: '/data/log',
    hideEmail: 'noreply.example.org'
  },
  props: {
    labelWidth: '350px'
  },
  resource: {
    api: {
      prefix: '/',
      create: 'install'
    },
    fields: {
      sqlType: {
        type: 'select',
        props: {
          multiple: false,
          options: {
            sqlite: 'SQLite3',
            mysql: 'MySQL',
            postgresql: 'PostgreSQL',
            mssql: 'MSSQL'
          }
        },
        label: '数据库类型',
        desc: 'Zeus 需要 MySQL、PostgreSQL、MSSQL 或 SQLite3。',
        rules: [{ require: true }]
      },
      dataPath: {
        type: 'text',
        label: '数据库文件路径',
        desc: 'SQLite3 数据库的文件路径。如果以服务的方式运行 Zeus，请输入绝对路径。',
        rules: [{ require: true }],
        show: {
          name: 'sqlType',
          value: 'sqlite'
        }
      },
      sqlHost: {
        default: 'localhost:3306',
        type: 'text',
        label: '数据库主机',
        rules: [{ require: true }],
        show(data) {
          return data.sqlType === 'mysql' || data.sqlType === 'postgresql' || data.sqlType === 'mssql'
        }
      },
      sqlUser: {
        default: 'root',
        type: 'text',
        label: '用户名',
        rules: [{ require: true }],
        show(data) {
          return data.sqlType === 'mysql' || data.sqlType === 'postgresql' || data.sqlType === 'mssql'
        }
      },
      sqlPassword: {
        type: 'text',
        label: '数据库用户密码',
        rules: [{ require: true }],
        show(data) {
          return data.sqlType === 'mysql' || data.sqlType === 'postgresql' || data.sqlType === 'mssql'
        }
      },
      sqlName: {
        default: 'zeus',
        type: 'text',
        label: '数据库名称',
        rules: [{ require: true }],
        show(data) {
          return data.sqlType === 'mysql' || data.sqlType === 'postgresql' || data.sqlType === 'mssql'
        }
      },
      sqlChatset: {
        type: 'select',
        label: '字符集',
        default: 'utf8',
        rules: [{ require: true }],
        props: {
          multiple: false,
          options: {
            utf8: 'utf8',
            utf8mb4: 'utf8mb4'
          }
        },
        show: {
          name: 'sqlType',
          value: 'mysql'
        }
      },
      sqlSSL: {
        default: '0',
        type: 'select',
        label: 'SSl',
        rules: [{ require: true }],
        props: {
          multiple: false,
          options: {
            0: 'Disable',
            1: 'Require',
            2: 'Verify Full'
          }
        },
        show: {
          name: 'sqlType',
          value: 'postgresql'
        }
      },
      _: {
        type: 'text',
        show: false
      },
      siteName: {
        type: 'text',
        label: 'Zeus: 宙斯权限管理系统',
        desc: '您可以在此输入您公司的名称。',
        rules: [{ require: true }]
      },
      userName: {
        type: 'text',
        label: '以用户名运行',
        desc: '输入 Zeus 运行的操作系统用户名。请注意, 此用户必须具有对存储库根路径的访问权限。',
        rules: [{ require: true }]
      },
      port: {
        type: 'text',
        label: 'HTTP 服务端口',
        desc: 'Zeus web 服务器将侦听的端口号。'
      },
      baseUrl: {
        type: 'text',
        label: 'Zeus 基本 URL',
        desc: '用于 HTTP (S) 访问的基本地址。'
      },
      logPath: {
        type: 'text',
        label: '日志路径',
        desc: '日志文件将写入此目录'
      },
      isShowMailSetting: {
        type: 'switch',
        label: '电子邮箱设置（可选）'
      },
      smtpServer: {
        type: 'text',
        label: 'SMTP主机',
        show: 'isShowMailSetting'
      },
      smtpAddress: {
        type: 'text',
        label: '电子邮件发件人',
        show: 'isShowMailSetting'
      },
      smtpUser: {
        type: 'text',
        label: 'SMTP 用户名',
        show: 'isShowMailSetting'
      },
      smtpPassword: {
        type: 'text',
        label: 'SMTP 密码',
        show: 'isShowMailSetting'
      },
      isEmailConfirm: {
        type: 'switch',
        label: '需要发电子邮件确认注册',
        show: 'isShowMailSetting'
      },
      isEmailNotify: {
        type: 'switch',
        label: '启用邮件通知提醒',
        show: 'isShowMailSetting'
      },
      isShowServerSetting: {
        type: 'switch',
        label: '服务器和第三方设置（可选）'
      },
      isLocal: {
        type: 'switch',
        label: '启用本地模式',
        show: 'isShowServerSetting'
      },
      isDisableGravatar: {
        type: 'switch',
        label: '禁用 Gravatar 头像',
        show: 'isShowServerSetting'
      },
      isEnableFederated: {
        type: 'switch',
        label: '启用 Federated 头像',
        show: 'isShowServerSetting'
      },
      isOpenID: {
        type: 'switch',
        label: '启用 OpenID 登录',
        show: 'isShowServerSetting'
      },
      isDisableAutoReg: {
        type: 'switch',
        label: '禁止用户自助注册',
        show: 'isShowServerSetting'
      },
      isOnlyOutReg: {
        type: 'switch',
        label: '仅允许通过外部服务注册',
        show: 'isShowServerSetting'
      },
      isEnableCode: {
        type: 'switch',
        label: '启用验证码',
        show: 'isShowServerSetting'
      },
      isEnableAccess: {
        type: 'switch',
        label: '启用页面访问限制',
        show: 'isShowServerSetting'
      },
      isDefaultHideEmail: {
        type: 'switch',
        label: '默认情况下隐藏电子邮件地址',
        show: 'isShowServerSetting'
      },
      isDefaultAllowCreateGroup: {
        type: 'switch',
        label: '默认情况下允许创建组织',
        show: 'isShowServerSetting'
      },
      isDefaultEnableTimeFollow: {
        type: 'switch',
        label: '默认情况下启用时间跟踪',
        show: 'isShowServerSetting'
      },
      hideEmail: {
        type: 'text',
        label: '隐藏电子邮件',
        show: 'isShowServerSetting',
        desc: '具有隐藏电子邮件地址的用户的域名。例如, 用户名 "joe" 将以 "joe@noreply.example.org" 的身份登录到 Git 中. 如果隐藏的电子邮件域设置为 "noreply.example.org"。'
      },
      isShowAdminSetting: {
        type: 'switch',
        label: '管理员帐号设置（可选）'
      },
      adminUser: {
        type: 'text',
        label: '管理员用户名',
        show: 'isShowAdminSetting'
      },
      adminPassword: {
        type: 'text',
        label: '管理员密码',
        show: 'isShowAdminSetting'
      },
      adminConfirmPassword: {
        type: 'text',
        label: '确认密码',
        show: 'isShowAdminSetting'
      },
      adminEmail: {
        type: 'text',
        label: '电子邮件地址',
        show: 'isShowAdminSetting'
      }
    }
  },
  actions: {
    install() {
      // todo: 调用install接口
      console.log(this.data)
    }
  },
  operations: {
    install: {
      type: 'button',
      label: '立即安装',
      event: 'create',
      // event: 'install',
      props: {
        type: 'primary'
      }
    }
  },
  blocks: {
    sqlTitle: {
      type: 'title',
      options: {
        title: '数据库设置'
      },
      style: {
        marginLeft: '350px',
        marginBottom: '10px'
      },
      slot: 'top'
    },
    commonTitle: {
      type: 'title',
      options: {
        title: '一般设置'
      },
      style: {
        marginLeft: '350px',
        marginBottom: '10px'
      },
      slot: 'field:_'
    },
    operaTitle: {
      type: 'title',
      options: {
        title: '可选设置'
      },
      style: {
        marginLeft: '350px',
        marginBottom: '10px'
      },
      slot: 'field:logPath'
    }
  }
}

export default installBlock

