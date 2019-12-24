<template>
  <div class="wrap">
    <ams-block v-if="ready" name="auth"></ams-block>
  </div>
</template>

<script>
import ams from '@ams-team/ams'
import block from './auth.block'
import PreCheck from '../layout/mixin/PreCheck'
export default {
  mixins: [PreCheck],
  data() {
    return {
      ready: false
    }
  },
  mounted() {
    ams.block('auth', block)
    this.ready = true
  }
}
</script>

<style lang="scss" scope>
.wrap {
  padding: 20px;
}
</style>
