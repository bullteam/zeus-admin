<template>
  <div class="social-signup-container">
    <div class="sign-btn" @click="handleClick(1)">
      <img src="@/assets/images/dingtalk.png" style="background-color: #03a9f4"> 钉钉
    </div>
    <div class="sign-btn" @click="handleClick(2)">
      <img src="@/assets/images/github.png" style="background-color: #555"> GitHub
    </div>
    <div class="sign-btn" @click="handleClick(3)">
      <img src="@/assets/images/wechat.png" style="background-color: #79C700"> 微信
    </div>
  </div>
</template>

<script>
// import openWindow from '@/utils/openWindow'

export default {
  name: 'SocialSignin',
  methods: {
    handleClick(from) {
      switch (from) {
        case 1: location.href = 'https://oapi.dingtalk.com/connect/qrconnect?appid=dingoaztngtzbbyeblwvkl&response_type=code&scope=snsapi_login&state=STATE&redirect_uri=' + location.origin + '/login'
          break
      }
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .social-signup-container {
    margin: 20px 0;
    .sign-btn {
      display: inline-block;
      cursor: pointer;
      margin-right: 30px;
      img {
      width: 40px;
      height: 40px;
      border-radius: 3px;
      background-size: 100% 100%;
      margin-right: 5px;
    }
    }
  }
</style>
