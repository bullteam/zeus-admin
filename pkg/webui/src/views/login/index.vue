<template>
  <div class="login-container">

    <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form" auto-complete="on" label-position="left">

      <div class="title-container">
        <h3 class="title">{{ $t('login.title') }}</h3>
        <!--<lang-select class="set-language"/>-->
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          v-model="loginForm.username"
          :placeholder="$t('login.username')"
          name="username"
          type="text"
          auto-complete="on"
        />
      </el-form-item>

      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          :type="passwordType"
          v-model="loginForm.password"
          :placeholder="$t('login.password')"
          name="password"
          auto-complete="on"
          @keyup.enter.native="handleLogin" />
        <span class="show-pwd" @click="showPwd">
          <svg-icon icon-class="eye" />
        </span>
      </el-form-item>
      <el-form-item v-if="captchaUrl!=''">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          v-model="loginForm.captchaval"
          :placeholder="$t('login.captcha')"
          name="captcha"
          auto-complete="on"
          @keyup.enter.native="handleLogin" />
        <span class="show-captcha" @click="showCaptcha">
          <img :src="captchaUrl" alt="">
        </span>
      </el-form-item>

      <el-button :loading="loading" type="primary" style="width:100%;margin-bottom:30px;" @click.native.prevent="handleLogin">{{ $t('login.logIn') }}</el-button>

      <!--<div class="tips">-->
      <!--<span>{{ $t('login.username') }} : admin</span>-->
      <!--<span>{{ $t('login.password') }} : {{ $t('login.any') }}</span>-->
      <!--</div>-->
      <!--<div class="tips">-->
      <!--<span style="margin-right:18px;">{{ $t('login.username') }} : editor</span>-->
      <!--<span>{{ $t('login.password') }} : {{ $t('login.any') }}</span>-->
      <!--</div>-->
      <br>
      <br>
      <br>
      <el-button class="thirdparty-button" type="primary" @click="showDialog=true">{{ $t('login.thirdparty') }}</el-button>
    </el-form>

    <el-dialog :title="$t('login.thirdparty')" :visible.sync="showDialog" append-to-body>
      <social-sign />
    </el-dialog>
    <!--海浪-->
    <div class="wave-wrapper wave-animation">
      <div class="wave-wrapper-inner">
        <div class="wave wave-top" style="background-image: url('/static/images/wave-front.png')"/>
      </div>
      <div class="wave-wrapper-inner">
        <div class="wave wave-middle" style="background-image: url('/static/images/wave-middle.png')"/>
      </div>
      <div class="wave-wrapper-inner">
        <div class="wave wave-back" style="background-image: url('/static/images/wave-back.png')"/>
      </div>
    </div>
  </div>
</template>

<script>
import LangSelect from '@/components/LangSelect'
import SocialSign from './socialsignin'
import { getUserCaptcha } from '@/api/login'
// import { getPrefix } from '@/utils/auth'

export default {
  name: 'Login',
  components: { LangSelect, SocialSign },
  data() {
    const validateUsername = (rule, value, callback) => {
      if (value.length < 1) {
        callback(new Error('Please enter your account'))
      } else {
        callback()
      }
    }
    const validatePassword = (rule, value, callback) => {
      if (value.length < 1) {
        callback(new Error('Please enter your password'))
      } else {
        callback()
      }
    }
    return {
      loginForm: {
        username: '',
        password: '',
        captchaid: '',
        captchaval: ''
      },
      captchaUrl: '',
      loginRules: {
        username: [{ required: true, trigger: 'blur', validator: validateUsername }],
        password: [{ required: true, trigger: 'blur', validator: validatePassword }]
      },
      passwordType: 'password',
      loading: false,
      showDialog: false,
      redirect: undefined,
      // 返回的地址
      redirectURL: undefined
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirectURL = route.query && route.query.redirectURL
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  created() {
    // window.addEventListener('hashchange', this.afterQRScan)
  },
  mounted() {
    const code = this.$route.query.code
    if (code) {
      this.loading = true
      this.$store.dispatch('LoginByThird', { code }).then(() => {
        this.loading = false
        this.$router.push('/dashboard')
      }).catch(res => {
        this.loading = false
        this.$message.error(res.msg)
      })
    }
  },
  destroyed() {
    // window.removeEventListener('hashchange', this.afterQRScan)
  },
  methods: {
    showPwd() {
      if (this.passwordType === 'password') {
        this.passwordType = ''
      } else {
        this.passwordType = 'password'
      }
    },
    showCaptcha() {
      this.loginForm.captchaval = ''
      getUserCaptcha().then((json) => {
        this.loginForm.captchaid = json.data.captcha.Id
        this.captchaUrl = `//api.${location.host}/captcha/${this.loginForm.captchaid}.png`
        // this.captchaUrl = ('http://api-auth{fix}.etcchebao.com/captcha/' + this.loginForm.captchaid + '.png').replace('{fix}', getPrefix())
      })
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          this.$store.dispatch('LoginByUsername', this.loginForm).then(() => {
            // TODO: Wendell Sheh 本项目后台登录完成后，路由到指定页面
            // 其他项目后台根据参数 redirectURL, 跳转到对应的项目上
            // 如果没有此参数，根据 redirect 返回到本项目指定路由
            this.loading = false

            if (this.redirectURL) {
              location.href = decodeURIComponent(this.redirectURL)
              return
            }
            this.$router.push({ path: this.redirect || '/' })
          }).catch((res) => {
            if (res.code === 13001) {
              this.showCaptcha()
              // getUserCaptcha().then((json) => {
              //   this.loginForm.captchaid = json.data.captcha.Id
              //   this.captchaUrl = ('http://api-auth{fix}.etcchebao.com/captcha/' + this.loginForm.captchaid + '.png').replace('{fix}', getPrefix())
              // })
            } else {
              this.$message.error(res.msg)
            }
            this.loading = false
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    afterQRScan() {
      // const hash = window.location.hash.slice(1)
      // const hashObj = getQueryObject(hash)
      // const originUrl = window.location.origin
      // history.replaceState({}, '', originUrl)
      // const codeMap = {
      //   wechat: 'code',
      //   tencent: 'code'
      // }
      // const codeName = hashObj[codeMap[this.auth_type]]
      // if (!codeName) {
      //   alert('第三方登录失败')
      // } else {
      //   this.$store.dispatch('LoginByThirdparty', codeName).then(() => {
      //     this.$router.push({ path: '/' })
      //   })
      // }
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss">
  /* 修复input 背景不协调 和光标变色 */
  /* Detail see https://github.com/PanJiaChen/vue-element-admin/pull/927 */

  $bg:#283443;
  $light_gray:#eee;
  $cursor: #fff;

  @supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
    .login-container .el-input input{
      color: $cursor;
      &::first-line {
        color: $light_gray;
      }
    }
  }

  /* reset element-ui css */
  .login-container {
    .el-input {
      display: inline-block;
      height: 47px;
      width: 85%;
      input {
        background: transparent;
        border: 0px;
        -webkit-appearance: none;
        border-radius: 0px;
        padding: 12px 5px 12px 15px;
        color: $light_gray;
        height: 47px;
        caret-color: $cursor;
        &:-webkit-autofill {
          -webkit-box-shadow: 0 0 0px 1000px $bg inset !important;
          -webkit-text-fill-color: $cursor !important;
        }
      }
    }
    .el-form-item {
      border: 1px solid rgba(255, 255, 255, 0.1);
      background: rgba(0, 0, 0, 0.1);
      border-radius: 5px;
      color: #454545;
    }
  }
</style>

<style rel="stylesheet/scss" lang="scss" scoped>
$bg:#2d3a4b;
$dark_gray:#889aa4;
$light_gray:#eee;

.login-container {
  position: fixed;
  height: 100%;
  width: 100%;
  background-color: $bg;
  .login-form {
    position: absolute;
    left: 0;
    right: 0;
    width: 520px;
    max-width: 100%;
    padding: 35px 35px 15px 35px;
    margin: 120px auto;
  }
  .tips {
    font-size: 14px;
    color: #fff;
    margin-bottom: 10px;
    span {
      &:first-of-type {
        margin-right: 16px;
      }
    }
  }
  .svg-container {
    padding: 6px 5px 6px 15px;
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: inline-block;
  }
  .title-container {
    position: relative;
    .title {
      font-size: 26px;
      color: $light_gray;
      margin: 0px auto 40px auto;
      text-align: center;
      font-weight: bold;
    }
    .set-language {
      color: #fff;
      position: absolute;
      top: 5px;
      right: 0px;
    }
  }
  .show-pwd {
    position: absolute;
    right: 10px;
    top: 7px;
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
  }
  .show-captcha {
    position: absolute;
    top: 0;
    right: 0;
    img{
      height: 47px;
      background: #fff;
    }
  }
  .thirdparty-button {
    position: absolute;
    right: 35px;
    bottom: 28px;
  }

  /*海浪*/
  @keyframes move_wave {
    0% {
      transform: translateX(0) translateZ(0) scaleY(1)
    }
    50% {
      transform: translateX(-25%) translateZ(0) scaleY(0.55)
    }
    100% {
      transform: translateX(-50%) translateZ(0) scaleY(1)
    }
  }
  .wave-wrapper {
    /*overflow: hidden;*/
    position: relative;
    /*left: 0;*/
    /*right: 0;*/
    bottom: 0;
    /*top: 0;*/
    margin: auto;
    height: 100%;
    width: 100%;
    z-index: -1;
  }
  .wave-wrapper-inner {
    position: absolute;
    width: 100%;
    overflow: hidden;
    height: 100%;
    bottom: -1px;
    /*background-image: linear-gradient(to top, #86377b 20%, #27273c 80%);*/
    border-bottom: 50px solid #ffffff;
  }
  .wave {
    position: absolute;
    left: 0;
    width: 200%;
    height: 100%;
    background-repeat: repeat no-repeat;
    background-position: 0 bottom;
    transform-origin: center bottom;
  }
  .wave-top {
    z-index: 15;
    opacity: 0.5;
    background-size: 50% 100px;
    background-image: url('/static/images/wave-front.png');
  }
  .wave-animation .wave-top {
    animation: move-wave 3s;
    -webkit-animation: move-wave 3s;
    -webkit-animation-delay: 1s;
    animation-delay: 1s;
  }
  .wave-middle {
    z-index: 10;
    opacity: 0.75;
    background-size: 50% 120px;
    background-image: url('/static/images/wave-middle.png');
  }
  .wave-animation .wave-middle {
    animation: move_wave 10s linear infinite;
  }
  .wave-back {
    z-index: 5;
    opacity: 0.9;
    background-size: 50% 100px;
    background-image: url('/static/images/wave-back.png');
  }
  .wave-animation .wave-back {
    animation: move_wave 15s linear infinite;
  }
}
</style>
