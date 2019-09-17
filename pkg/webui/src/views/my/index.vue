<template>
  <div class="personal_content">
    <el-row :gutter="12" type="flex" justify="center">
      <el-col :span="4">
        <el-card shadow="always" class="user_top">
          <div class="user_inner">
            <img :src="user.avatar">
            <div class="info">
              <p>{{ user.name }}</p>
              <p>{{ user.introduction }}</p>
            </div>
          </div>
        </el-card>
        <router-link v-for="item in infoBtnList" :key="item.name" :to="item.path">
          <el-card shadow="hover">
            <span :style="{'font-weight': $route.path === item.path ? 'bolder': '', color: $route.path === item.path ? '': '#999999'}">{{ item.name }}</span>
          </el-card>
        </router-link>
      </el-col>
      <el-col :span="12">
        <el-card shadow="always">
          <p class="title">{{ $t('route.' + $route.name) }}</p>
          <router-view/>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  name: 'My',
  data() {
    return {
      infoBtnList: [
        {
          name: this.$t('route.personal'),
          path: '/my/personal'
        },
        {
          name: this.$t('route.psw'),
          path: '/my/psw'
        },
        {
          name: this.$t('route.third'),
          path: '/my/third'
        }
      ]
    }
  },
  computed: {
    user() {
      return this.$store.state.user
    }
  }
}
</script>
<style lang="scss" scoped>
.personal_content {
  width: 100%;
  height: calc(100vh - 84px);
  background: #f5f5f5;
  padding: 30px;
  .user_top {
    margin-bottom: 30px;
    .user_inner {
      display: flex;
      img {
        height: 80px;
        width: 80px;
        border-radius: 50%;
      }
      .info {
        padding: 15px;
        p {
          margin: 0;
          line-height: 18px;
          font-weight: bold;
          &:last-child{
            color: #999999;
            font-size: 12px;
            font-weight: 400
          }
        }
      }
    }
  }
  .title {
    font-size: 18px;
    font-weight: bold;
    margin-top: 0;
  }
}
</style>
