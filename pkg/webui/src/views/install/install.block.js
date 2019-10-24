const installBlock = {
  type: 'form',
  ctx: 'edit',
  data: {
    sqlType: 'sqlite',
    dataPath: '/data/zeus.db',
    siteName: 'Zeus 宙斯权限后台管理系统',
    port: '8082',
    baseUrl: 'http://localhost:8082/',
    logPath: '/data/log'
  },
  props: {
    labelWidth: '350px'
  },
  resource: {
    api: {
      prefix: '',
      contentType: 'form',
      create: 'http://api.auth.bullteam.local/v1/install'
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
      isShowServerSetting: {
        type: 'switch',
        label: '服务器和第三方设置（可选）'
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

