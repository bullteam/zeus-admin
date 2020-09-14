import { checkChangePwd } from '../../../api/user'
export default {
  name: 'PwdChangeCheck',
  created() {
    // todo : check if password not chant for a long time
    checkChangePwd({}).then(res => {
      if (res.data.needed) {
        if (res.data.days > 0) {
          this.$confirm('密码将于' + res.data.days + '天内过期,请及时更新密码', '警告', {
            confirmButtonText: '立即更换',
            showCancelButton: true,
            cancelButtonText: '稍后更换',
            type: 'warning'
          }).then(() => {
            location.href = '/#/my/psw'
          })
        } else {
          this.$confirm('密码已过期，请联系管理员！', '警告', {
            confirmButtonText: '退出登录',
            showCancelButton: false,
            cancelButtonText: '稍后更换',
            type: 'error'
          }).then(() => {
            this.$store.dispatch('LogOut').then(() => {
              location.reload() // In order to re-instantiate the vue-router object to avoid bugs
            })
          })
          const _this = this
          setTimeout(() => {
            _this.$store.dispatch('LogOut').then(() => {
              location.reload() // In order to re-instantiate the vue-router object to avoid bugs
            })
          }, 3000)
        }
      }
    })
  }
}
