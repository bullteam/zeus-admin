<template>
  <div>
    <div v-for="item in bindlist" :key="item.name" class="item">
      <div>
        <img :src="item.img" :style="{'background-color': item.bgColor}">
        {{ item.name }}
        <span>{{ item.bindName }}</span>
      </div>
      <el-button v-if="!item.isBind" type="primary" @click="bindingAccount(item.from, false)">绑定</el-button>
      <el-button v-else type="danger" @click="bindingAccount(item.from, true)">解绑</el-button>
    </div>
  </div>
</template>
<script>
import { accountThird, unbind, bind } from '@/api/user'
export default {
  filters: {
    isBinding(val) {
      return this.bindlist[val]
    }
  },
  data() {
    return {
      iconList: [
        {
          img: require('../../assets/images/dingtalk.png'),
          bgColor: '#03a9f4',
          name: '钉钉',
          from: 1
        },
        {
          img: require('../../assets/images/github.png'),
          bgColor: '#555',
          name: 'github'
        },
        {
          img: require('../../assets/images/wechat.png'),
          bgColor: '#79C700',
          name: '微信'
        }
      ],
      bindlist: []
    }
  },
  beforeRouteEnter(to, fromObj, next) {
    const { code, from } = to.query
    if (code) {
      bind({ code, from }).then(res => {
        next('/my/third')
      }).catch(res => {
        next(vm => {
          vm.$message(res.msg)
        })
      })
    } else {
      next()
    }
  },
  mounted() {
    this.getBindList()
  },
  methods: {
    getBindList() {
      accountThird().then(res => {
        this.bindlist = this.iconList.map(val => {
          if (res.data) {
            res.data.forEach(element => {
              if (val.from === parseInt(element.from)) {
                val.isBind = true
                val.bindName = element.name
              } else {
                delete val.isBind
                delete val.bindName
              }
            })
          }
          return val
        })
      })
    },
    bindingAccount(from, isBind) {
      if (isBind) {
        unbind({ from }).then(res => {
          this.$message('解除绑定成功')
          this.getBindList()
        })
      } else {
        switch (from) {
          case 1: location.href = 'https://oapi.dingtalk.com/connect/qrconnect?appid=dingoaztngtzbbyeblwvkl&response_type=code&scope=snsapi_login&state=STATE&redirect_uri=' + location.origin + '/my/third/from/1'
            break
        }
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.item{
  padding: 15px;
  border-top: 1px solid #f5f5f5;
  display: flex;
  justify-content: space-between;
  align-items: center;
  div {
    display: flex;
    align-items: center;
    font-size: 14px;
    img {
      width: 28px;
      height: 28px;
      border-radius: 3px;
      background-size: 100% 100%;
      margin-right: 15px;
    }
    span {
      padding-left: 5px;
      color: red;
    }
  }
}
</style>

