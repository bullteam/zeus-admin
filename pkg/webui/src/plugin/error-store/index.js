import store from '@/store'

export default {
  install(Vue, options) {
    // you can set only in production env show the error-log
    if (options.developmentOff && process.env.NODE_ENV === 'development') return
    Vue.config.errorHandler = function(err, vm, info, a) {
      // Don't ask me why I use Vue.nextTick, it just a hack.
      // detail see https://forum.vuejs.org/t/dispatch-in-vue-config-errorhandler-has-some-problem/23500
      Vue.nextTick(() => {
        store.dispatch('addErrorLog', {
          err,
          vm,
          info,
          url: window.location.href
        })
        console.error(err, info)
      })
    }
    // window error捕获的错误
    window.onerror = (msg, url, line, col, error) => {
      // Vue.nextTick(() => {
      //   store.dispatch('addErrorLog', {
      //     error,
      //     line,
      //     msg,
      //     url: window.location.href
      //   })
      // })
      return true // error不会以error形式打印到控制台
    }

    // promise rejecttion 错误捕获，promise错误需要单独捕获
    window.addEventListener('unhandledrejection', e => {
      // const error = e.reason
      // const line = e.reason
      // const msg = e.reason
      // console.log(e)
      // Vue.nextTick(() => {
      //   store.dispatch('addErrorLog', {
      //     error,
      //     line,
      //     msg,
      //     url: window.location.href
      //   })
      // })
      return true
    })
  }
}
