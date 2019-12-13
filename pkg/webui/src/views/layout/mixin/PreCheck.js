import { checkIdle } from '../../../api/user'
export default {
  name: 'PreCheck',
  mounted() {
    // todo : check if password not chant for a long time
    checkIdle({}).then(res => {
      if (res.data.idle) {
        this.$alert('系统检测到您1小时内无操作,请重新登录!', '警告', {
          confirmButtonText: '确定',
          callback: action => {
            this.$store.dispatch('LogOut').then(() => {
              location.reload() // In order to re-instantiate the vue-router object to avoid bugs
            })
          }
        })
      }
    })
  }
}
