<template>
  <div>
    <el-form>
      <el-form-item label="avatar">
        <img :src="user.avatar">
      </el-form-item>
      <el-form-item label="name">{{ user.name }}</el-form-item>
      <el-form-item label="introduction">{{ user.introduction }}</el-form-item>
    </el-form>
  </div>
</template>
<script>
export default {
  name: 'Personal',
  computed: {
    user() {
      return this.$store.state.user
    }
  }
}
</script>
<style lang="scss" scoped>
img {
  height: 120px;
  width: 120px;
  border-radius: 50%;
}
</style>
