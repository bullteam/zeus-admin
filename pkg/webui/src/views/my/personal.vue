<template>
  <div>
    <ams-block v-if="ready" name="personal"/>
  </div>
</template>
<script>
import ams from '@ams-team/ams'
import personalBlock from './personal.block'
import PreCheck from '../layout/mixin/PreCheck'
export default {
  name: 'Personal',
  mixins: [PreCheck],
  data() {
    return {
      ready: false
    }
  },
  mounted() {
    const user = this.$store.state.user || {}
    ams.block('personal', {
      ...personalBlock,
      data: {
        avatar: user.avatar,
        name: user.name,
        introduction: user.introduction
      }
    })
    this.ready = true
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
