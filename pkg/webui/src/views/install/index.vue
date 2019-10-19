<template>
  <div class="wrap">
    <h3>初始配置</h3>
    <div class="info">如果您正在使用 Docker 容器运行 Gitea，请务必先仔细阅读 <a target="blank" href="https://github.com/bullteam/zeus-admin">官方文档</a> 后再对本页面进行填写。</div>
    <ams-block v-if="ready" name="install"></ams-block>
  </div>
</template>

<script>
import ams from '@ams-team/ams'
import installBlock from './install.block'

export default {
  data() {
    return {
      ready: false
    }
  },
  mounted() {
    ams.block('install', installBlock)
    this.ready = true
  }
}
</script>

<style lang="scss" scope>
.wrap {
  width: 70%;
  max-width: 1200px;
  margin: 45px auto;
  border: 1px solid #d4d4d5;
  border-radius: 5px;
  .info{
    color: rgba(0,0,0,.87);
    text-align: center;
    line-height: 50px;
    font-size: 14px;
  }
  h3{
    background-color: #f0f0f0;
    font-size: 18px;
    text-align: center;
    height: 50px;
    line-height: 50px;
    margin: 0;
    color: rgba(0, 0, 0, 0.87);
    border-bottom: 1px solid #d4d4d5;
  }
  .ams-block-form{
    margin: 20px;
    .el-input{
      width: 330px;
    }
  }
}
</style>
