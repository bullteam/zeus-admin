<template>
  <div class="app-container">
    <div class="filter-container">
      <el-select v-model="domain_id" class="filter-item" placeholder="Please select" @change="getList">
        <el-option v-for="item in domainlist" :key="item.id" :label="item.name" :value="item.id"/>
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="getList">
        {{ $t('table.search') }}
      </el-button>
      <el-button
        v-permission="['/auth-system/menu:add']"
        class="filter-item"
        style="margin-left: 10px;"
        type="primary"
        icon="el-icon-edit"
        @click="handleCreate">{{ $t('table.add') }}
      </el-button>
    </div>
    <template v-if="domain_id&&list">
      <tree-table :data="list" :eval-func="func" :eval-args="args" :columns="columns" :expand-all="expandAll" border>
        <el-table-column :label="$t('menu.icon')" align="center">
          <template slot-scope="scope">
            <svg-icon v-if="scope.row.icon" :icon-class="scope.row.icon"/>
          </template>
        </el-table-column>
        <el-table-column :label="$t('menu.type')" align="center">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.menu_type">{{ scope.row.menu_type | tag }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column :label="$t('menu.topnum')" align="center">
          <template slot-scope="scope">
            {{ scope.row.order_num }}
          </template>
        </el-table-column>
        <el-table-column :label="$t('menu.router')" align="center">
          <template slot-scope="scope">
            {{ scope.row.url }}
          </template>
        </el-table-column>
        <el-table-column :label="$t('menu.auth')" align="center">
          <template slot-scope="scope">
            {{ scope.row.perms }}
          </template>
        </el-table-column>
        <el-table-column :label="$t('menu.actions')" width="200" align="center">
          <template v-if="scope.row.id" slot-scope="scope">
            <el-button v-permission="['/auth-system/menu:edit']" type="text" @click="handleUpdate(scope.row)">{{
            $t('table.edit') }}
            </el-button>
            <el-button v-permission="['/auth-system/menu:del']" type="text" @click="handleDelete(scope.row)">{{
            $t('table.delete') }}
            </el-button>
          </template>
        </el-table-column>
      </tree-table>
    </template>
    <el-dialog :name="$t('menu.'+ textMap[dialogStatus])" :visible.sync="dialogFormVisible">
      <el-form
        ref="dataForm"
        :rules="rules"
        :model="temp"
        label-position="left"
        label-width="80px"
        style=" margin: 0 50px;">
        <el-form-item :label="$t('menu.type')">
          <el-radio-group v-model="temp.menu_type" :disabled="dialogStatus!=='create'" @change="typeChange">
            <el-radio-button label="0">{{ $t('menu.type_directories') }}</el-radio-button>
            <el-radio-button label="1">{{ $t('menu.type_menu') }}</el-radio-button>
            <el-radio-button label="2">{{ $t('menu.type_button') }}</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item :label="$t('menu.name')" prop="name">
          <el-input v-model="temp.name"/>
        </el-form-item>
        <el-form-item :label="$t('menu.parents')">
          <el-cascader
            :style="{'width':'100%'}"
            :options="data_options"
            :props="cascader_props"
            v-model="temp.parents"
            change-on-select
          />
        </el-form-item>
        <el-form-item v-if="temp.menu_type!=='2'" :label="$t('menu.topnum')" prop="order_num">
          <el-input v-model="temp.order_num"/>
        </el-form-item>
        <el-form-item v-if="temp.menu_type==='1'" :label="$t('menu.router')">
          <el-input v-model="temp.url"/>
        </el-form-item>
        <el-form-item v-if="temp.menu_type!=='0'" :label="$t('menu.auth')">
          <el-input v-model="temp.perms"/>
        </el-form-item>
        <el-form-item v-if="temp.menu_type!=='2'" :label="$t('menu.icon')">
          <el-select v-model="temp.icon" class="filter-item" placeholder="Please select">
            <el-option v-for="item in icons" :key="item" :label="item" :value="item">
              <svg-icon :icon-class="item"/>
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">{{ $t('table.cancel') }}</el-button>
        <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">{{ $t('table.confirm') }}
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import treeTable from '@/components/TreeTable'
import treeToArray from '@/directive/customEval'
import icons from '@/utils/requireIcons'
// import { asyncRouterMap } from '@/router/routers'
import { fetchMenuList, createMenu, updateMenu, deleteMenu } from '@/api/menu'
import { fetchDomainList } from '@/api/domain'

export default {
  name: 'Menu',
  components: { treeTable },
  filters: {
    tag(type) {
      return type === '0' ? '目录' : type === '1' ? '菜单' : '按钮'
    }
  },
  data() {
    return {
      func: treeToArray,
      expandAll: false,
      list: {},
      args: [null, null, 'timeLine'],
      columns: [{
        value: 'name',
        text: this.$t('menu.name')
      }],
      temp: {
        id: undefined,
        name: '',
        menu_type: '1',
        url: '',
        order_num: 1,
        perms: '',
        icon: '',
        parents: ['0']
      },
      icons: icons,
      dialogFormVisible: false,
      dialogStatus: 'create',
      textMap: {
        update: 'Edit',
        create: 'Create'
      },
      rules: {
        type: [{ required: true, message: 'type is required', trigger: 'change' }],
        timestamp: [{ type: 'date', required: true, message: 'timestamp is required', trigger: 'change' }],
        name: [{ required: true, message: '名称必须填写', trigger: 'blur' }],
        // url: [{ required: true, message: '路由链接必须填写', trigger: 'blur' }],
        order_num: [{ required: true, message: '排序必须填写', trigger: 'blur' }]
      },
      index: 1,
      data_copy: [],
      data_options: [],
      cascader_props: {
        value: 'id',
        label: 'name'
      },
      domainlist: [],
      domain_id: ''
    }
  },
  mounted() {
    // this.list = this.recursive(asyncRouterMap, {})
    // this.recursive(asyncRouterMap, {})
    // this.os(this.list, 0)
    // this.oks(0)
  },
  created() {
    // this.getList()
    this.getDeptList()
  },
  methods: {
    // 点击按钮后置空From
    typeChange(type) {
      this.resetTemp()
      this.temp.menu_type = type
    },
    os(data) {
      data.forEach(o => {
        this.data_copy.push(o)
        if (o.children && Array.isArray(o.children)) {
          this.os(o.children)
        }
      })
    },
    oks(i) {
      if (i < this.data_copy.length) {
        var _self = this
        this.autoCreate(this.data_copy[i]).then(res => {
          _self.oks(i + 1)
        })
      }
    },
    getDeptList() {
      this.listLoading = true
      fetchDomainList().then(res => {
        this.domainlist = res.data.result
        if (this.domain_id === '' && this.domainlist && this.domainlist.length > 0) {
          this.domain_id = this.domainlist[0].id
          this.getList()
        }
        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    getList() {
      this.listLoading = true
      fetchMenuList({ domain_id: this.domain_id }).then(res => {
        const res_menus = res.data.result
        // const menu = this.o(res_menus, 0)
        if (res_menus && res_menus.length > 0) {
          this.list = this.o(res_menus, 0)
          this.data_options = [{
            id: '0',
            name: '一级菜单',
            children: this.list
          }]
        } else {
          this.list = []
          this.data_options = [{
            id: '0',
            name: '一级菜单'
          }]
        }
        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    o(data, id) {
      const menu = data.filter(o => o.parent_id === id.toString())
      menu.forEach(o => {
        const children = this.o(data, o.id)
        if (children && children.length > 0) {
          o.children = children
        }
      })
      return menu
    },
    recursive(obj, parent) {
      const output = []
      let temp = []
      let index = 1
      obj.forEach(o => {
        if (o.permission || o.permission !== false) {
          temp = {
            name: this.$t('route.' + o.meta.title),
            label: this.$t('route.' + o.meta.title),
            icon: o.meta.icon,
            id: this.index,
            value: this.index,
            order_num: index,
            url: JSON.stringify(parent) === '{}' ? o.path : parent.url + '/' + o.path,
            parent_id: JSON.stringify(parent) === '{}' ? 0 : parent.id,
            perms: '',
            menu_type: '1'
          }
          this.index += 1
          index += 1
          if (o.children && Array.isArray(o.children)) {
            temp.children = this.recursive(o.children, temp)
          }
          if (o.auth && Array.isArray(o.auth)) {
            const items = []
            let item = {}
            let item_index = 1
            o.auth.forEach(o => {
              item = {
                name: o.name,
                label: o.name,
                icon: '',
                id: this.index,
                value: this.index,
                order_num: item_index,
                url: '',
                parent_id: temp.id,
                perms: temp.url + ':' + o.code,
                menu_type: '2'
              }
              items.push(item)
              this.index += 1
              item_index += 1
            })
            temp.children = items
          }
          output.push(temp)
        }
      })
      return output
    },
    findParent(id, output, data) {
      data.forEach(o => {
        if (o.id === id) {
          output.push(o.parent_id)
          this.findParent(o.parent_id, output, this.list)
        }
        if (o.children && Array.isArray(o.children)) {
          this.findParent(id, output, o.children)
        }
      })
      return output
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: '',
        menu_type: '1',
        url: '',
        order_num: 1,
        perms: '',
        icon: '',
        parents: ['0']
      }
    },
    handleCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    handleUpdate(row) {
      // this.$message.info(row)
      // this.dialogFormVisible = true
      this.temp = Object.assign({}, row) // copy obj
      this.temp.timestamp = new Date(this.temp.timestamp)
      this.temp.parents = []
      this.findParent(this.temp.id, this.temp.parents, this.list)
      this.temp.parents.reverse()
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
    },
    handleDelete(row) {
      this.$confirm('此操作将永久删除数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteMenu({ id: row.id }).then(() => {
          this.$notify({
            title: '成功',
            message: '删除成功',
            type: 'success',
            duration: 2000
          })
          // const index = this.list.indexOf(row)
          // this.list.splice(index, 1)
          this.getList()
        }).catch((res) => {
          this.$message.error(res.msg)
        })
      }).catch(() => {
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if (this.temp.url === '' && this.temp.menu_type === '1') {
            this.$message.error('请输入路由地址')
            return
          }
          if (this.temp.perms === '' && this.temp.menu_type === '2') {
            this.$message.error('请输入授权标识')
            return
          }
          this.temp.id = parseInt(Math.random() * 100) + 1024 // mock a id
          this.temp.author = 'vue-element-admin'
          this.temp.domain_id = this.domain_id
          this.temp.parent_id = this.temp.parents[this.temp.parents.length - 1]
          delete this.temp.parent
          createMenu(this.temp).then(() => {
            // this.list.unshift(this.temp)
            this.getList()
            this.dialogFormVisible = false
            this.$notify({
              name: '成功',
              message: '创建成功',
              type: 'success',
              duration: 2000
            })
          }).catch((res) => {
            this.$message.error(res.msg)
          })
        }
      })
    },
    autoCreate(obj) {
      this.temp = obj
      this.temp.name = obj.name
      this.temp.url = obj.url
      this.temp.perms = obj.perms
      this.temp.menu_type = obj.menu_type
      this.temp.parent_id = obj.parent_id
      this.temp.domain_id = this.domain_id
      delete this.temp.children
      // this.temp.parent_id = obj.parents[obj.parents.length - 1]
      return createMenu(this.temp)
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if (this.temp.url === '' && this.temp.menu_type === '1') {
            this.$message.error('请输入路由地址')
            return
          }
          if (this.temp.perms === '' && this.temp.menu_type === '2') {
            this.$message.error('请输入授权标识')
            return
          }
          delete this.temp.children
          // delete this.temp.parents
          this.temp.domain_id = this.domain_id
          const tempData = Object.assign({}, this.temp)
          tempData.timestamp = +new Date(tempData.timestamp) // change Thu Nov 30 2017 16:41:05 GMT+0800 (CST) to 1512031311464
          tempData.parent_id = tempData.parents[this.temp.parents.length - 1]
          delete tempData.parent
          updateMenu(tempData).then(() => {
            // for (const v of this.list) {
            //   if (v.id === this.temp.id) {
            //     const index = this.list.indexOf(v)
            //     this.list.splice(index, 1, this.temp)
            //     break
            //   }
            // }
            this.getList()
            this.dialogFormVisible = false
            this.$notify({
              name: '成功',
              message: '更新成功',
              type: 'success',
              duration: 2000
            })
          }).catch((res) => {
            this.$message.error(res.msg)
          })
        }
      })
    }
  }
}
</script>
