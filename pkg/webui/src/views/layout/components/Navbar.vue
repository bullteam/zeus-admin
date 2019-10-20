<template>
  <div class="navbar">
    <hamburger :toggle-click="toggleSideBar" :is-active="sidebar.opened" class="hamburger-container"/>

    <breadcrumb class="breadcrumb-container"/>

    <div class="right-menu">
      <template v-if="device!=='mobile'">
        <error-log class="errLog-container right-menu-item"/>

        <el-tooltip :content="$t('navbar.screenfull')" effect="dark" placement="bottom">
          <screenfull class="screenfull right-menu-item"/>
        </el-tooltip>

        <el-tooltip :content="$t('navbar.size')" effect="dark" placement="bottom">
          <size-select class="international right-menu-item"/>
        </el-tooltip>
        <!--<error-store v-if="$config.plugin['error-store'] && $config.plugin['error-store'].showInHeader" :has-read="hasReadErrorPage" :count="errorCount"></error-store>-->
        <!--<lang-select class="international right-menu-item"/>-->

        <!--<el-tooltip :content="$t('navbar.theme')" effect="dark" placement="bottom">-->
        <!--<theme-picker class="theme-switch right-menu-item"/>-->
        <!--</el-tooltip>-->
      </template>

      <el-dropdown class="avatar-container right-menu-item" trigger="click">
        <div class="avatar-wrapper">
          <!--<img :src="avatar+'?imageView2/1/w/80/h/80'" class="user-avatar">-->
          <img :src="minLogo" class="user-avatar">
          <span>{{ name }}</span>
          <i class="el-icon-caret-bottom"/>
        </div>
        <el-dropdown-menu slot="dropdown">
          <router-link to="/">
            <el-dropdown-item>
              {{ $t('navbar.dashboard') }}
            </el-dropdown-item>
          </router-link>
          <!-- 个人中心 -->
          <el-dropdown-item divided>
            <span style="display:block;" @click="$router.push('/my/personal')">{{ $t('navbar.personal') }}</span>
          </el-dropdown-item>
          <!-- 修改密码 -->
          <!-- <el-dropdown-item divided>
            <span style="display:block;" @click="dialogFormVisible=true">{{ $t('navbar.password') }}</span>
          </el-dropdown-item> -->
          <el-dropdown-item divided>
            <span style="display:block;" @click="logout">{{ $t('navbar.logOut') }}</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    <!-- 修改密码功能移到个人中心 -->
    <!-- <el-dialog :visible.sync="dialogFormVisible" :title="$t('navbar.password')" width="420px">
      <el-form :model="form">
        <el-form-item label-width="100px" label="新密码">
          <el-input v-model="form.re_password" type="password" placeholder="请输入" autocomplete="off"/>
        </el-form-item>
        <el-form-item label-width="100px" label="确认新密码">
          <el-input v-model="form.new_password" type="password" placeholder="请输入" autocomplete="off"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="toUpWord">确 定</el-button>
      </div>
    </el-dialog> -->
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Breadcrumb from '@/components/Breadcrumb'
import Hamburger from '@/components/Hamburger'
import ErrorLog from '@/components/ErrorLog'
import Screenfull from '@/components/Screenfull'
import SizeSelect from '@/components/SizeSelect'
import LangSelect from '@/components/LangSelect'
import ThemePicker from '@/components/ThemePicker'
import minLogo from '@/assets/images/logo-min.png'
import { updateUserPassWord } from '@/api/user'

export default {
  components: {
    Breadcrumb,
    Hamburger,
    ErrorLog,
    Screenfull,
    SizeSelect,
    LangSelect,
    ThemePicker
  },
  data() {
    return {
      minLogo,
      dialogFormVisible: false,
      form: {
        re_password: '',
        new_password: ''
      }
    }
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'name',
      'avatar',
      'device'
    ])
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch('toggleSideBar')
    },
    logout() {
      this.$store.dispatch('LogOut').then(() => {
        location.reload()// In order to re-instantiate the vue-router object to avoid bugs
      })
    },
    toUpWord() {
      if (this.form.re_password === '') {
        this.$message.error('请输入新密码')
        return
      }
      if (this.form.new_password === '') {
        this.$message.error('请输入确认新密码')
        return
      }
      var patt1 = new RegExp(/\s+/g)
      if (patt1.test(this.form.re_password) || patt1.test(this.form.new_password)) {
        this.$message.error('密码仅支持输入字母，数字，符号')
        return
      }
      updateUserPassWord(this.form).then(() => {
        this.$confirm('登录已失效, 请重新登录！', '密码修改成功', {
          confirmButtonText: '确定',
          showCancelButton: false,
          type: 'success'
        }).then(() => {
          this.logout()
        }).catch(() => {
        })
      }).catch((res) => {
        this.$message.error(res.msg)
      })
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .navbar {
    height: 50px;
    line-height: 50px;
    border-radius: 0px !important;
    .hamburger-container {
      line-height: 58px;
      height: 50px;
      float: left;
      padding: 0 10px;
    }
    .breadcrumb-container {
      float: left;
    }
    .errLog-container {
      display: inline-block;
      vertical-align: top;
    }
    .right-menu {
      float: right;
      height: 100%;
      &:focus {
        outline: none;
      }
      .right-menu-item {
        display: inline-block;
        margin: 0 8px;
      }
      .screenfull {
        height: 20px;
      }
      .international {
        vertical-align: top;
      }
      .theme-switch {
        vertical-align: 15px;
      }
      .avatar-container {
        height: 50px;
        margin-right: 10px;
        overflow: hidden;
        // background: rgba(239, 239, 239, 0.7);
        .avatar-wrapper {
          // margin-top: 5px;
          padding: 0 25px 0 0px;
          position: relative;
          span {
            font-weight: bold;
            position: relative;
            top: -5px;
            margin-left: 5px;
            font-size: 18px;
          }
          .user-avatar {
            cursor: pointer;
            vertical-align: middle;
                margin-top: -5px;
            width: 40px;
            height: 40px;
            border-radius: 20px;
          }
          .el-icon-caret-bottom {
            cursor: pointer;
            position: absolute;
            right: 10px;
            top: 15px;
            font-size: 12px;
          }
        }
      }
    }
  }
</style>
