import config from '@/config'
const { plugin } = config

export default (Vue) => {
  for (const name in plugin) {
    const value = plugin[name]
    Vue.use(require(`./${name}`).default, typeof value === 'object' ? value : undefined)
  }
}
