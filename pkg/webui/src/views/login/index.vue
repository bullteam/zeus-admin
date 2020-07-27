<template>
  <div :loading="block" :style="'background-image:url('+ Background +');'" class="login-container">

    <el-form v-if="step === 1" ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form" auto-complete="on" label-position="left">
      <!--      <el-radio-group v-model="loginForm.loginType" class="login-type">-->
      <!--        <el-radio-button :label="1">{{ $t('login.standard') }}</el-radio-button>-->
      <!--        <el-radio-button :label="2">{{ $t('login.ldap') }}</el-radio-button>-->
      <!--      </el-radio-group>-->
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
          @blur="checkAccount"
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
      <el-row v-show="checkForm.smsShow">
        <el-col :span="18">
          <el-form-item prop="code" >
            <span class="svg-container">
              <svg-icon icon-class="code" />
            </span>
            <el-input
              v-model="loginForm.code"
              :placeholder="$t('login.code')"
              name="code"
              auto-complete="on"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-button :loading="loading" type="primary" @click.native.prevent="handleSmsSend">{{ $t('login.smsSend') }}</el-button>
        </el-col>
      </el-row>
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
      <br>
      <br>
      <br>
      <el-button class="thirdparty-button" type="primary" style="margin-top:30px;" @click="showDialog=true">{{ $t('login.thirdparty') }}</el-button>
    </el-form>
    <el-form v-else ref="checkForm" class="login-form" label-position="left" >
      <div class="title-container">
        <h3 class="title">{{ $t('login.googleAuths') }}</h3>
      </div>
      <el-form-item prop="code">
        <el-input
          v-model="checkForm.code"
          :placeholder="$t('login.code')"
          name="code"
          type="text"
          auto-complete="on"
          @keyup.enter.native="handlerCode" />
      </el-form-item>
      <el-button :loading="loading" type="primary" style="width:100%;margin-bottom:30px;" @click.native.prevent="handlerCode">{{ $t('login.logIn') }}</el-button>
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
import { checkGoogle2faCode, FindCodeOpen, checkSmsSend, sendSmsCode } from '@/api/user'
import Background from '@/assets/images/background.jpg'
// import { getUserCaptcha } from '@/api/login'
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
      Background: Background,
      loginForm: {
        username: '',
        password: '',
        captchaid: '',
        captchaval: '',
        code: '',
        loginType: 1// 登录类型，1常规登录，2LDAP
      },
      checkForm: {
        code: '',
        smsShow: false
      },
      step: 1,
      captchaUrl: '',
      loginRules: {
        username: [{ required: true, trigger: 'blur', validator: validateUsername }],
        password: [{ required: true, trigger: 'blur', validator: validatePassword }]
      },
      passwordType: 'password',
      loading: false,
      block: false,
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
    const m = location.href.match(/code=([^&]+)/)
    if (m != null) {
      this.block = true
      // const code = this.$route.query.code
      const code = m[1]
      if (code) {
        this.$notify.warning('第三方登录验证中,请等待页面跳转...')
        this.$store.dispatch('LoginByThird', { code: code, type: 0 }).then(() => {
          this.block = false
          location.href = '/#/dashboard'
          // this.$router.push('/dashboard')
        }).catch(res => {
          this.block = false
          this.$message.error('此钉钉号暂未绑定后台用户,请账号密码登录后绑定钉钉账号')
        }).finally(() => {
          this.block = false
        })
      }
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
    checkAccount() {
      checkSmsSend({ username: this.loginForm.username }).then(res => {
        this.checkForm.smsShow = res.data.show
      })
    },
    handleSmsSend() {
      this.loading = true
      sendSmsCode({ username: this.loginForm.username }).then(res => {
        this.loading = false
        if (res.code === 200) {
          this.$message.success(res.msg)
        }
      }).catch(res => {
        this.loading = false
        this.$message.error(res.moreinfo)
      })
    },
    // showCaptcha() {
    //   this.loginForm.captchaval = ''
    //   getUserCaptcha().then((json) => {
    //     this.loginForm.captchaid = json.data.captcha.Id
    //     this.captchaUrl = `//api.${location.host}/captcha/${this.loginForm.captchaid}.png`
    //     // this.captchaUrl = ('http://api-auth{fix}.bullteam.com/captcha/' + this.loginForm.captchaid + '.png').replace('{fix}', getPrefix())
    //   })
    // },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          var requestApi = ''
          if (this.loginForm.loginType === 1) {
            requestApi = 'LoginByUsername'
          } else {
            requestApi = 'LoginLdapByUsername'
          }
          this.$store.dispatch(requestApi, this.loginForm).then(() => {
            // 其他项目后台根据参数 redirectURL, 跳转到对应的项目上
            // 如果没有此参数，根据 redirect 返回到本项目指定路由
            this.loading = false
            FindCodeOpen().then(res => {
              if (res.code === 200 && res.data.is_open === 1) {
                this.step = 2
              } else {
                if (this.redirectURL) {
                  location.href = decodeURIComponent(this.redirectURL)
                  return
                }
                this.$router.push({ path: this.redirect || '/' })
              }
            }).catch(res => {
              console.log(res)
            })
          }).catch((res) => {
            console.log(res)
            if (res.code === 13001) {
              this.showCaptcha()
            } else {
              // this.$message.error(res.msg)
            }
            this.loading = false
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    handlerCode() {
      checkGoogle2faCode({ google_2fa_token: this.checkForm.code }).then(res => {
        if (res.code === 200) {
          this.$message('登陆成功')
          if (this.redirectURL) {
            location.href = decodeURIComponent(this.redirectURL)
            return
          }
          this.$router.push({ path: this.redirect || '/' })
          return
        } else {
          this.$message('登陆失败')
          return
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
  $bg:#ffffff;
  $light_gray:#bfbfbf;
  $cursor: #707070;
  $dark_gray:#889aa4;

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
      height: 40px;
      width: 80%;
      input {
        // background: transparent;
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
      color: rgb(29, 22, 22);
    }
  }

.login-container {
  position: fixed;
  height: 100%;
  width: 100%;
  background-color: $bg;
  .login-form {
    border-radius: 6px;
    background: #ffffff;
    position: absolute;
    left: 0;
    right: 0;
    width: 450px;
    max-width: 100%;
    padding: 35px 35px 15px 35px;
    margin: 100px auto;
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

  /*登录类型*/
  .login-type{
    margin-bottom: 40px;
    width: 100%;
    .el-radio-button{
      width: 50%;
      &__inner{
        width: 100%;
      }
    }
  }
}
</style>
