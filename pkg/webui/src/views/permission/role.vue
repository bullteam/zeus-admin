<template>
  <div class="app-container">
    <div class="filter-container">
      <!--<el-input-->
      <!--:placeholder="$t('role.search')"-->
      <!--v-model="listQuery.title"-->
      <!--style="width: 200px;"-->
      <!--class="filter-item"-->
      <!--@keyup.enter.native="handleFilter"/>-->
      <el-select v-model="search_domain_id" class="filter-item" placeholder="Please select" @change="toSearch">
        <el-option key="" label="全部" value=""/>
        <el-option v-for="item in domainlist" :key="item.id" :label="item.name" :value="item.id"/>
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="toSearch">
        {{ $t('table.search') }}
      </el-button>
      <el-button
        v-permission="['/permission/role:add']"
        class="filter-item"
        style="margin-left: 10px;"
        type="primary"
        icon="el-icon-edit"
        @click="handleCreate">{{ $t('table.add') }}
      </el-button>
    </div>

    <el-table
      v-loading="listLoading"
      :key="tableKey"
      :data="list"
      border
      fit
      highlight-current-row
      style="width: 100%;"
      @sort-change="sortChange">
      <el-table-column :label="$t('role.id')" prop="id" align="center" width="65">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('role.name')" min-width="150px">
        <template slot-scope="scope">
          {{ scope.row.name }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('role.dept')">
        <template slot-scope="scope">
          {{ scope.row.domain.name }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('role.remark')">
        <template slot-scope="scope">
          {{ scope.row.remark }}
        </template>
      </el-table-column>
      <!--<el-table-column :label="$t('role.date')" width="150px" align="center">-->
      <!--<template slot-scope="scope">-->
      <!--<span>{{ scope.row.created_time | parseTime('{y}-{m}-{d} {h}:{i}') }}</span>-->
      <!--</template>-->
      <!--</el-table-column>-->
      <el-table-column :label="$t('role.actions')" align="center" width="200" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-permission="['/permission/role:edit']"
            type="primary"
            size="mini"
            @click="handleUpdate(scope.row)">{{ $t('table.edit') }}
          </el-button>
          <el-button v-permission="['/permission/role:del']" type="danger" size="mini" @click="handleDelete(scope.row)">
            {{ $t('table.delete') }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="getList"/>

    <el-dialog :title="$t('user.'+ textMap[dialogStatus])" :visible.sync="dialogFormVisible">
      <el-form
        ref="dataForm"
        :rules="rules"
        :model="temp"
        label-position="left"
        label-width="80px"
        style=" margin: 0 50px;">
        <el-form-item :label="$t('role.name')" prop="name">
          <el-input v-model="temp.name"/>
        </el-form-item>
        <el-form-item :label="$t('role.remark')">
          <el-input v-model="temp.remark"/>
        </el-form-item>
        <el-form-item :label="$t('role.domain')">
          <el-select
            v-model="domain_id"
            :disabled="dialogStatus!=='create'"
            class="filter-item"
            placeholder="Please select"
            @change="getPermList">
            <el-option v-for="item in domainlist" :key="item.id" :label="item.name" :value="item.id"/>
          </el-select>
        </el-form-item>
        <el-form-item :label="$t('role.menuscope')">
          <el-radio-group v-model="scopeType" class="radio">
            <el-radio-button label="1">{{ $t('role.menuscope') }}</el-radio-button>
            <el-radio-button label="2">{{ $t('role.datascope') }}</el-radio-button>
          </el-radio-group>
          <el-tree
            v-show="parseInt(scopeType) === 1"
            ref="tree"
            :data="tree_data"
            :props="tree_props"
            show-checkbox
            node-key="id"/>
          <el-tree
            v-show="parseInt(scopeType) === 2"
            ref="treeData"
            :data="tree_data_perm"
            :props="tree_props"
            show-checkbox
            node-key="id"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false,tree_data = []">{{ $t('table.cancel') }}</el-button>
        <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">{{ $t('table.confirm') }}
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { fetchRoleList, createRole, updateRole, deleteRole } from '@/api/role'
import { fetchDomainList } from '@/api/domain'
import { fetchMenuList } from '@/api/menu'
// import { parseTime } from '@/utils'
import Pagination from '@/components/Pagination' // Secondary package based on el-pagination
import { dataPermList } from '@/api/dataPerm'

export default {
  name: 'Role',
  components: { Pagination },
  data() {
    return {
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        start: 0,
        limit: 20,
        q: ''
      },
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      department: ['admin', 'editor'],
      showReviewer: false,
      temp: {
        id: undefined,
        name: '',
        remark: '',
        role_name: '',
        menu_ids: [],
        domain_id: ''
      },
      dialogFormVisible: false,
      dialogStatus: 'create',
      textMap: {
        update: 'Edit',
        create: 'Create'
      },
      rules: {
        type: [{ required: true, message: 'type is required', trigger: 'change' }],
        timestamp: [{ type: 'date', required: true, message: 'timestamp is required', trigger: 'change' }],
        name: [{ required: true, message: '角色名必须填写', trigger: 'blur' }],
        remark: [{ required: true, message: '备注必须填写', trigger: 'blur' }]
      },
      downloadLoading: false,
      tree_data: [],
      tree_data_perm: [],
      tree_props: {
        children: 'children',
        label: 'name'
      },
      domainlist: [],
      domain_id: '',
      search_domain_id: '',
      menuslist: [],
      scopeType: 1
    }
  },
  created() {
    this.getDeptList()
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      this.listQuery.start = (this.listQuery.page - 1) * 20
      fetchRoleList(this.listQuery).then(response => {
        this.list = response.data.result
        this.total = response.data.total

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    toSearch() {
      if (this.search_domain_id !== '') {
        this.listQuery.q = 'd=' + this.search_domain_id
      } else {
        delete this.listQuery.q
      }
      this.getList()
    },
    // 获取权限列表 （角色权限or数据权限）
    getPermList() {
      Promise.all([fetchMenuList({
        domain_id: this.domain_id
      }), dataPermList({
        start: 0,
        limit: 1000,
        domain_id: this.domain_id
      })]).then(response => {
        const res_menus = response[0].data.result
        const result = response[1].data.result
        if (res_menus && res_menus.length > 0) {
          this.tree_data = this.o(res_menus, 0)
        } else {
          this.tree_data = []
        }
        if (result && result.length > 0) {
          this.tree_data_perm = this.o(result, 0)
        } else {
          this.tree_data_perm = []
        }
        const { menu_ids_ele = '', data_perm_ids = '' } = this.temp
        this.$refs.tree.setCheckedKeys(menu_ids_ele.split(','))
        this.$refs.treeData.setCheckedKeys(data_perm_ids.split(','))
      })
    },
    getDeptList() {
      fetchDomainList().then(response => {
        this.domainlist = response.data.result
        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    o(data, id) {
      const menu = data.filter(o => parseInt(o.parent_id) === parseInt(id))
      menu.forEach(o => {
        o.children = this.o(data, o.id)
      })
      return menu
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleModifyStatus(row, status) {
      this.$message({
        message: '操作成功',
        type: 'success'
      })
      row.status = status
    },
    sortChange(data) {
      const { prop, order } = data
      if (prop === 'id') {
        this.sortByID(order)
      }
    },
    sortByID(order) {
      if (order === 'ascending') {
        this.listQuery.sort = '+id'
      } else {
        this.listQuery.sort = '-id'
      }
      this.handleFilter()
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: '',
        role_name: '',
        remark: '',
        menu_ids: [],
        domain_id: ''
      }
      this.domain_id = ''
    },
    handleCreate() {
      this.resetTemp()
      this.domainlist.length > 0 ? this.domain_id = this.domainlist[0].id : ''
      this.getPermList()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          // this.temp.id = parseInt(Math.random() * 100) + 1024 // mock a id
          this.temp.author = 'vue-element-admin'
          this.temp.role_name = this.temp.name
          this.temp.menu_ids_ele = this.$refs.tree.getCheckedKeys().join(',')
          const menu_ids = []
          const data_perm_ids = []
          this.$refs.tree.getCheckedKeys().forEach(o => {
            menu_ids.push(o)
            // this.findParentMenus(menu_ids, o)
            // const s = this.menuslist.find(i => i.id === o)
            // if (s) {
            //   menu_ids.push(s.parent_id)
            // }
          })
          this.$refs.treeData.getCheckedKeys().forEach(o => {
            data_perm_ids.push(o)
          })
          this.temp.menu_ids = Array.from(new Set(menu_ids)).join(',')
          this.temp.data_perm_ids = Array.from(new Set(data_perm_ids)).join(',')
          this.temp.domain_id = this.domain_id
          createRole(this.temp).then(() => {
            // this.list.unshift(this.temp)
            this.getList()
            this.tree_data = []
            this.dialogFormVisible = false
            this.$notify({
              title: '成功',
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
    handleUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.temp.timestamp = new Date(this.temp.timestamp)
      this.dialogStatus = 'update'
      this.domain_id = this.temp.domain.id
      this.getPermList()
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    findParentMenus(menus, id) {
      const s = this.menuslist.find(i => i.id === id)
      if (s && s.parent_id !== '0') {
        menus.push(s.parent_id)
        this.findParentMenus(menus, s.parent_id)
      }
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.temp.role_name = this.temp.name
          this.temp.menu_ids_ele = this.$refs.tree.getCheckedKeys().join(',')
          const menu_ids = []
          const data_perm_ids = []
          this.$refs.tree.getCheckedKeys().forEach(o => {
            menu_ids.push(o)
            this.findParentMenus(menu_ids, o)
            // const s = this.menuslist.find(i => i.id === o)
            // if (s) {
            //   menu_ids.push(s.parent_id)
            // }
          })
          this.$refs.treeData.getCheckedKeys().forEach(o => {
            data_perm_ids.push(o)
          })
          this.temp.menu_ids = Array.from(new Set(menu_ids)).join(',')
          this.temp.data_perm_ids = Array.from(new Set(data_perm_ids)).join(',')
          this.temp.domain_id = this.domain_id
          delete this.temp.domain
          const tempData = Object.assign({}, this.temp)
          tempData.timestamp = +new Date(tempData.timestamp)
          updateRole(tempData).then(() => {
            this.getList()
            this.tree_data = []
            this.dialogFormVisible = false
            this.$notify({
              title: '成功',
              message: '更新成功',
              type: 'success',
              duration: 2000
            })
          }).catch((res) => {
            this.$message.error(res.msg)
          })
        }
      })
    },
    handleDelete(row) {
      this.$confirm('<span>删除后，拥有该角色的用户相关权限将受到影响，</span>你还要继续吗?', '删除角色', {
        confirmButtonText: '继续',
        cancelButtonText: '取消',
        type: 'warning',
        dangerouslyUseHTMLString: true
      }).then(() => {
        deleteRole({ id: row.id }).then(() => {
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
    }
  }
}
</script>

<style>
  .radio {
    margin-bottom: 10px;
  }
  .pagination-container {
    margin-top: 0;
  }

  .el-tree {
    box-shadow: 0px 0px 2px #e2e2e2;
  }

  .el-tree-node {
    display: flex;
  }

  .el-tree > .el-tree-node:not(:nth-last-child(2)) {
    border-bottom: 1px solid #e2e2e2;
  }
  .el-message-box__message span{
    color: red;
  }
</style>
