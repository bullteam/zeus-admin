import { checkIdle } from '../../../api/user'
export default {
  name: 'PreCheck',
  mounted() {
    // todo : check if password not chant for a long time
    // 如果此后台需要过等保3,可以开放下这个定时空闲检查函数
    // this.intervalCheckIdle()
  },
  methods: {
    intervalCheckIdle: function() {
      // eslint-disable-next-line no-unused-vars
      let timer
      checkIdle({}).then(res => {
        if (res.data.idle) {
          clearTimeout(timer)
          const self = this
          // 3 seconds later log out directly
          setTimeout(function() {
            self.$store.dispatch('LogOut').then(() => {
              location.reload() // In order to re-instantiate the vue-router object to avoid bugs
            })
          }, 1500)
          this.$alert('系统检测到您1小时内无操作,请重新登录!', '警告', {
            confirmButtonText: '确定',
            showConfirmButton: false,
            callback: action => {
              // eslint-disable-next-line no-const-assign
              // eslint-disable-next-line no-undef
              // this.$store.dispatch('LogOut').then(() => {
              //   location.reload() // In order to re-instantiate the vue-router object to avoid bugs
              // })
            }
          })
        } else {
          timer = setTimeout(this.intervalCheckIdle, 1000 * 60 * 5)
        }
      })
    }
  }
}
