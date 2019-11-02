const settingBlock = {
  type: 'form',
  ctx: 'edit',
  data: {
    // ldapUrl: 'ldap://0.0.0.0',
    // ldapSearchDN: 'cn=domain,dc=example,dc=com',
    // ldapSearchPassword: '',
    // ldapBaseDN: 'dc=example,dc=com',
    // ldapFilter: '',
    // ldapUID: 'cn',
    // ldapGroupBaseDN: 'ou=groups,dc=example,dc=com',
    // ldapGroupFilter: 'objectclass=groupOfNames',
    // ldapGroupGID: 'cn',
    // ldapGroupAdminDN: 'ou=groups,dc=example,dc=com'
  },
  props: {
    labelWidth: '200px'
  },
  resource: {
    api: {
      prefix: process.env['ZEUS_ADMIN_URL'] || '/',
      contentType: 'form',
      create: 'v1/setting/ldap',
      read: 'v1/setting/ldap'
    },
    fields: {
      ldapUrl: {
        type: 'text',
        label: 'LDAP URL',
        rules: [{ require: true }]
      },
      ldapSearchDN: {
        type: 'text',
        label: 'LDAP Search DN'
      },
      ldapSearchPassword: {
        type: 'password',
        label: 'LDAP Search Password'
      },
      ldapBaseDN: {
        type: 'text',
        label: 'LDAP Base DN',
        rules: [{ require: true }]
      },
      ldapFilter: {
        type: 'text',
        label: 'LDAP Filter'
      },
      ldapUID: {
        type: 'text',
        label: 'LDAP UID'
      },
      ldapScope: {
        type: 'select',
        label: 'LDAP Scope',
        default: 'subtree',
        props: {
          multiple: false,
          options: {
            subtree: 'Subtree'
          }
        }
      },
      ldapGroupBaseDN: {
        type: 'text',
        label: 'LDAP Group Base DN'
      },
      ldapGroupFilter: {
        type: 'text',
        label: 'LDAP Group Filter'
      },
      ldapGroupGID: {
        type: 'text',
        label: 'LDAP Group GID'
      },
      ldapGroupAdminDN: {
        type: 'text',
        label: 'LDAP Group Admin DN'
      },
      ldapGroupScope: {
        type: 'text',
        label: 'LDAP Group Scope',
        options: {
          subtree: 'Subtree'
        }
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

