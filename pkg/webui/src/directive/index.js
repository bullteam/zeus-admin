import Clipboard from './clipboard/clipboard'
import drag from './el-dragDialog/drag'
import permission from './permission/permission'
import waves from './waves/waves'

const importDirective = Vue => {
  Vue.directive('Clipboard', Clipboard)
  Vue.directive('el-drag-dialog', drag)
  Vue.directive('permission', permission)
  Vue.directive('waves', waves)
}

export default importDirective
