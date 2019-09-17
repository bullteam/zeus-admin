<template>
  <div class="dashboard-container">
    <template v-for="o in domainlist">
      <el-card :key="o.code" shadow="hover">
        <div @click="toUrl(o)">{{ o.name }}</div>
      </el-card>
    </template>
  </div>
</template>

<script>
import { getUserDomain } from '@/api/login'
// import { getToken } from '@/utils/auth'
// import { getToken } from '@/utils'

export default {
  name: 'Dashboard',
  data() {
    return {
      domainlist: []
    }
  },
  computed: {},
  created() {
    this.getList()
  },
  methods: {
    getList() {
      getUserDomain().then(response => {
        this.domainlist = response.data
      })
    },
    toUrl(obj) {
      if (obj && obj.url) {
        // 暂不需要授权token, 通过跨域 cookies 打通子域名
        // window.open(obj.url.replace('[access_token]', getToken()), '_blank')

        // 处理后缀环境问题
        let url = obj.url
        const arrHost = location.host.split('.')
        const suffix = arrHost[arrHost.length - 1]
        // 开发环境或本地
        if (suffix !== 'work' && arrHost.length !== 1) {
          url = url.substring(0, url.lastIndexOf('.')) + '.' + suffix
        }
        window.open(url, '_blank')
      }
    }
  }
}
</script>

<style lang="scss">
  .dashboard-container {
    padding: 20px;
    min-height: 400px;
    display: flex;
    flex-wrap: wrap;
    .el-card {
      width: 32%;
      height: 200px;
      margin: 5px;
      cursor: pointer;
      box-sizing: border-box;
      text-align: center;
      display: flex;
      align-items: center;
      justify-content: center;
      .el-card__body {
        padding: 0;
        line-height: 200px;
        width: 100%;
      }
    }
  }
</style>
