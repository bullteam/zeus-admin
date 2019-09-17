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
        v-permission="['/auth-system/dataPerm:add']"
        class="filter-item"
        style="margin-left: 10px;"
        type="primary"
        icon="el-icon-edit"
        @click="handleCreate">{{ $t('table.add') }}
      </el-button>
    </div>
    <template v-if="domain_id&&list">
      <tree-table :data="list" :eval-func="func" :eval-args="args" :columns="columns" :expand-all="expandAll" border>
        <el-table-column :label="$t('dataPerm.type')" align="center">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.perms_type">{{ scope.row.perms_type | tag }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column :label="$t('dataPerm.topnum')" align="center">
          <template slot-scope="scope">
            {{ scope.row.order_num }}
          </template>
        </el-table-column>
        <el-table-column :label="$t('dataPerm.router')" align="center">
          <template slot-scope="scope">
            {{ scope.row.perms }}
          </template>
        </el-table-column>
        <el-table-column :label="$t('dataPerm.rules')" align="center">
          <template slot-scope="scope">
            {{ scope.row.perms_rule }}
          </template>
        </el-table-column>
        <el-table-column :label="$t('dataPerm.remarks')" align="center">
          <template slot-scope="scope">
            {{ scope.row.remarks }}
          </template>
        </el-table-column>
        <el-table-column :label="$t('dataPerm.actions')" width="200" align="center">
          <template v-if="scope.row.id" slot-scope="scope">
            <el-button v-permission="['/auth-system/dataPerm:edit']" type="text" @click="handleUpdate(scope.row)">{{
            $t('table.edit') }}
            </el-button>
            <el-button v-permission="['/auth-system/dataPerm:del']" type="text" @click="handleDelete(scope.row)">{{
            $t('table.delete') }}
            </el-button>
          </template>
        </el-table-column>
      </tree-table>
    </template>
    <el-dialog :visible.sync="dialogFormVisible">
      <el-form
        ref="dataForm"
        :rules="rules"
        :model="temp"
        label-position="left"
        label-width="80px"
        style=" margin: 0 50px;">
        <el-form-item :label="$t('dataPerm.type')">
          <el-radio-group v-model="permsType">
            <el-radio-button label="1">{{ $t('dataPerm.type_sort') }}</el-radio-button>
            <el-radio-button label="2">{{ $t('dataPerm.type_data') }}</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item :label="$t('dataPerm.name')" prop="name">
          <el-input v-model="temp.name"/>
        </el-form-item>
        <el-form-item v-if="parseInt(temp.perms_type) === 2" :label="$t('dataPerm.parents')" prop="parent_id">
          <el-select :value="temp.parent_id ? temp.parent_id : ''" placeholder="请选择" @change="temp.parent_id = arguments[0]">
            <el-option
              v-for="item in list"
              :key="item.id"
              :label="item.name"
              :value="item.id"/>
          </el-select>
        </el-form-item>
        <el-form-item :label="$t('dataPerm.topnum')" prop="order_num">
          <el-input v-model="temp.order_num"/>
        </el-form-item>
        <el-form-item v-if="parseInt(temp.perms_type) === 2" :label="$t('dataPerm.router')" prop="perms">
          <el-input v-model="temp.perms"/>
        </el-form-item>
        <el-form-item v-if="parseInt(temp.perms_type) === 2" :label="$t('dataPerm.rules')">
          <div ref="jsonEditor"/>
        </el-form-item>
        <el-form-item :label="$t('dataPerm.remarks')">
          <el-input v-model="temp.remarks"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">{{ $t('table.cancel') }}</el-button>
        <el-button type="primary" @click="createUpdateData">{{ $t('table.confirm') }}
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import 'jsoneditor/dist/jsoneditor.min.css'
import Jsoneditor from 'jsoneditor'
import treeTable from '@/components/TreeTable'
import treeToArray from '@/directive/customEval'
// import { asyncRouterMap } from '@/router/routers'
import { fetchDomainList } from '@/api/domain'
import { dataPermList, dataPermAdd, dataPermEdit, dataPermDel } from '@/api/dataPerm'
const temp = function() {
  return {
    id: undefined,
    domain_id: this.domain_id,
    parent_id: 0,
    name: '',
    perms: '',
    perms_rule: '',
    perms_type: '1',
    order_num: '',
    remarks: ''
  }
}
export default {
  name: 'DataPerm',
  components: { treeTable },
  filters: {
    tag(type) {
      return parseInt(type) === 1 ? '分类' : '数据权限'
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
        text: this.$t('dataPerm.name')
      }],
      temp: {},
      dialogFormVisible: false,
      dialogStatus: 'create',
      rules: {
        name: [{ required: true, message: '名称必须填写', trigger: 'blur' }],
        perms: [{ required: true, message: '路由必须填写', trigger: 'blur' }],
        order_num: [{ required: true, message: '排序必须填写', trigger: 'blur' }],
        parent_id: [{ required: true, message: '分类必须选择', trigger: 'change' }]
      },
      index: 1,
      data_copy: [],
      cascader_props: {
        value: 'id',
        label: 'name'
      },
      domainlist: [],
      domain_id: '',
      options: {
        mode: 'tree',
        mainMenuBar: false,
        statusBar: false,
        onChangeJSON: (json) => {
          this.temp.perms_rule = JSON.stringify(json)
        }
      },
      permsType: 1,
      listQuery: {
        start: 0,
        limit: 1000,
        domain_id: 1
      }
    }
  },
  watch: {
    permsType(newVal) {
      const type = parseInt(newVal)
      this.temp.perms_type = type
      if (type === 2) {
        const json = this.temp.perms_rule
        this.$nextTick(function() {
          new Jsoneditor(this.$refs.jsonEditor, this.options, json ? JSON.parse(json) : '')
        })
      }
    },
    dialogFormVisible(newVal) {
      if (!newVal) this.permsType = 1
    }
  },
  mounted() {
    this.getDeptList()
    this.temp = temp.apply(this)
  },
  methods: {
    async getDeptList() {
      this.listLoading = true
      this.domainlist = (await fetchDomainList()).data.result
      if (this.domain_id === '' && this.domainlist && this.domainlist.length > 0) {
        this.domain_id = this.domainlist[0].id
        this.getList()
      }
      this.listLoading = false
    },
    async getList() {
      this.listQuery.domain_id = this.domain_id
      const { result: res_menus } = (await dataPermList(this.listQuery)).data
      if (res_menus && res_menus.length > 0) {
        this.list = this.o(res_menus, 0)
      } else {
        this.list = []
      }
    },
    o(data, id) {
      const menu = data.filter(o => o.parent_id === id)
      menu.forEach(o => {
        const children = this.o(data, o.id)
        if (children && children.length > 0) {
          o.children = children
        }
      })
      return menu
    },
    handleCreate() {
      this.temp = temp.apply(this)
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    handleUpdate(row) {
      this.permsType = row.perms_type
      this.temp = temp.apply(this)
      Object.keys(this.temp).forEach(val => {
        this.temp[val] = row[val]
      })
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
    },
    handleDelete(row) {
      this.$confirm('此操作将永久删除数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        dataPermDel({ id: row.id }).then(() => {
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
      }).catch((err) => {
        this.$message.error(err.msg)
      })
    },
    createUpdateData() {
      this.$refs['dataForm'].validate(async(valid) => {
        if (valid) {
          if (this.temp.perms_rule === '' && this.temp.perms_type === '2') {
            this.$message.error('数据权限规则JSON')
            return
          }
          try {
            this.dialogStatus === 'create' ? await dataPermAdd(this.temp) : await dataPermEdit(this.temp)
            this.getList()
            this.dialogFormVisible = false
            this.$notify({
              name: '成功',
              message: '创建成功',
              type: 'success',
              duration: 2000
            })
          } catch (err) {
            this.$message.error(err.msg)
          }
        }
      })
    }
  }
}
</script>
