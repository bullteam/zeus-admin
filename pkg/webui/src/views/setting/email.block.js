const settingBlock = {
  type: 'form',
  ctx: 'edit',
  data: {
  },
  props: {
    labelWidth: '200px'
  },
  resource: {
    api: {
      prefix: process.env['ZEUS_ADMIN_URL'],
      contentType: 'form',
      create: '/v1/setting/email',
      read: '/v1/setting/email'
    },
    fields: {
      smtpServer: {
        type: 'text',
        label: 'SMTP主机'
      },
      smtpAddress: {
        type: 'text',
        label: '电子邮件发件人'
      },
      smtpUser: {
        type: 'text',
        label: 'SMTP 用户名'
      },
      smtpPassword: {
        type: 'text',
        label: 'SMTP 密码'
      },
      adminEmail: {
        type: 'text',
        label: '电子邮件地址'
      }
    }
  },
  events: {
    init: '@read'
  },
  style: {
    width: '60%'
  },
  operations: {
    install: {
      type: 'button',
      label: '保存',
      event: 'update',
      // event: 'install',
      props: {
        type: 'primary'
      }
    }
  },
  blocks: {
  }
}

export default settingBlock

