export default {
  type: 'form',
  ctx: 'edit',
  data: {
  },
  // props: {
  //   labelWidth: '200px'
  // },
  resource: {
    api: {
      prefix: process.env['ZEUS_ADMIN_URL'] || '/',
      contentType: 'form',
      update: '/v1/user'
    },
    fields: {
      avatar: {
        type: 'image',
        label: 'avatar'
      },
      name: {
        type: 'text',
        label: 'name',
        style: {
          width: '200px'
        }
      },
      introduction: {
        type: 'text',
        label: 'introduction'
      }
    }
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
  }
}
