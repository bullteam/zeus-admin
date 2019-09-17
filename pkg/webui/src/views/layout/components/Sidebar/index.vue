<template>
  <el-scrollbar wrap-class="scrollbar-wrapper">
    <el-menu
      :show-timeout="200"
      :unique-opened="true"
      :default-active="$route.path"
      :collapse="isCollapse"
      mode="vertical"
      background-color="#304156"
      text-color="#bfcbd9"
      active-text-color="#409EFF"
    >
      <!-- 需要放在菜单上面的内容，如Logo，写在side-menu标签内部，如下 -->
      <div class="logo-con" @click="toggleSideBar">
        <img v-show="!isCollapse" key="max-logo" :src="maxLogo" >
        <img v-show="isCollapse" key="min-logo" :src="minLogo" >
      </div>
      <sidebar-item v-for="route in permission_routers" :key="route.path" :item="route" :base-path="route.path"/>
    </el-menu>
  </el-scrollbar>
</template>

<script>
import { mapGetters } from 'vuex'
import SidebarItem from './SidebarItem'
import minLogo from '@/assets/images/logo-min.png'
import maxLogo from '@/assets/images/logo.png'

export default {
  components: { SidebarItem },
  data() {
    return {
      minLogo,
      maxLogo
    }
  },
  computed: {
    ...mapGetters([
      'permission_routers',
      'sidebar'
    ]),
    isCollapse() {
      return !this.sidebar.opened
    }
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch('toggleSideBar')
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .logo-con{
    height: 60px;
    padding:20px 10px 10px;
  img{
    /*height: 36px;*/
    width: auto;
    display: block;
    margin: 0 auto;
  }
  }
  .header-con{
    background: #fff;
    padding: 0 20px;
    width: 100%;
  }
  .main-layout-con{
    height: 100%;
    overflow: hidden;
  }
  .el-menu--collapse{
    .logo-con{
      height: 44px;
      img{
        height: 16px;
      }
    }
  }
</style>
