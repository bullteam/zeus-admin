<template>
  <div class="app-container">
    <div class="filter-container">
      <!--<el-input-->
      <!--:placeholder="$t('user.search')"-->
      <!--v-model="listQuery.title"-->
      <!--style="width: 200px;"-->
      <!--class="filter-item"-->
      <!--@keyup.enter.native="handleFilter"/>-->
      <!--<el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">-->
      <!--{{ $t('table.search') }}-->
      <!--</el-button>-->
      <!--<el-select v-model="search_domain_id" class="filter-item" placeholder="Please select" @change="toSearch">-->
      <!--<el-option v-for="item in domainlist" :key="item.id" :label="item.name" :value="item.id"/>-->
      <!--</el-select>-->
      <el-select v-model="search_dept_id" class="filter-item" placeholder="Please select" @change="toSearch">
        <el-option key="" label="全部" value=""/>
        <el-option v-for="item in deptlist" :key="item.id" :label="item.name" :value="item.id"/>
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="toSearch">
        {{ $t('table.search') }}
      </el-button>
      <el-button
        v-permission="['/permission/user:add']"
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
      <el-table-column :label="$t('user.id')" prop="id" align="center" width="65">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('user.username')" min-width="150px">
        <template slot-scope="scope">
          {{ scope.row.username }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('user.department')" width="120px">
        <template slot-scope="scope">
          {{ department(scope.row.Department.id) }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('user.title')" align="center" width="120px">
        <template slot-scope="scope">
          {{ scope.row.title }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('user.email')" width="200px">
        <template slot-scope="scope">
          {{ scope.row.email }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('user.mobile')" align="center" width="120px">
        <template slot-scope="scope">
          {{ scope.row.mobile }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('user.status')" class-name="status-col" width="100">
        <template slot-scope="scope">
          <el-tag>{{ scope.row.status | status }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column :label="$t('user.date')" width="150px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.create_time | parseTime('{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>
      <el-table-column
        :label="$t('user.actions')"
        align="center"
        min-width="120"
        class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-permission="['/permission/user:edit']"
            type="primary"
            size="mini"
            @click="handleUpdate(scope.row)">{{ $t('table.edit') }}
          </el-button>
          <el-button
            v-permission="['/permission/user:edit']"
            v-if="scope.row.status!=1"
            size="mini"
            type="success"
            @click="handleModifyStatus(scope.row,1)">{{ $t('table.enable') }}
          </el-button>
          <el-button
            v-permission="['/permission/user:edit']"
            v-if="scope.row.status!=2"
            size="mini"
            @click="handleModifyStatus(scope.row,2)">{{ $t('table.disable') }}
          </el-button>
          <el-dropdown
            v-permission="['/permission/user:edit','/permission/user:del']"
            class="right-menu-btn"
            trigger="click">
            <el-button
              size="mini"
              type="success">更多 ↓
            </el-button>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item v-permission="['/permission/user:edit']">
                <span style="display:block;" @click="handleResetUpdate(scope.row)">{{ $t('table.reset') }}</span>
              </el-dropdown-item>
              <el-dropdown-item v-permission="['/permission/user:edit']" divided>
                <span style="display:block;" @click="handleCopyUpdate(scope.row)">{{ $t('table.copy') }}</span>
              </el-dropdown-item>
              <el-dropdown-item v-permission="['/permission/user:del']" divided>
                <span style="display:block;" @click="handleDelete(scope.row)">{{ $t('table.delete') }}</span>
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <!--<el-button-->
          <!--v-permission="['/permission/user:edit']"-->
          <!--type="primary"-->
          <!--size="mini"-->
          <!--@click="handleCopyUpdate(scope.row)">{{ $t('table.copy') }}-->
          <!--</el-button>-->
          <!--<el-button v-permission="['/permission/user:del']" type="danger" size="mini" @click="handleDelete(scope.row)">-->
          <!--{{ $t('table.delete') }}-->
          <!--</el-button>-->
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
        style=" margin-left:50px;">
        <el-form-item :label="$t('user.username')" prop="username">
          <el-input :disabled="dialogStatus==='update'" v-model="temp.username"/>
        </el-form-item>
        <el-form-item :label="$t('user.department')">
          <el-select v-model="dept_id" class="filter-item" placeholder="Please select">
            <el-option v-for="item in deptlist" :key="item.id" :label="item.name" :value="item.id"/>
          </el-select>
        </el-form-item>
        <!--<el-form-item :label="$t('user.password')">-->
        <!--<el-input v-model="temp.password" type="password"/>-->
        <!--</el-form-item>-->
        <el-form-item :label="$t('user.title')">
          <el-input v-model="temp.title"/>
        </el-form-item>
        <el-form-item :label="$t('user.nickname')">
          <el-input v-model="temp.realname"/>
        </el-form-item>
        <el-form-item :label="$t('user.sex')">
          <el-radio-group v-model="temp.sex">
            <el-radio-button label="1">男</el-radio-button>
            <el-radio-button label="2">女</el-radio-button>
            <el-radio-button label="3">保密</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item :label="$t('user.email')">
          <el-input v-model="temp.email"/>
        </el-form-item>
        <el-form-item :label="$t('user.mobile')">
          <el-input v-model="temp.mobile"/>
        </el-form-item>
        <el-form-item :label="$t('user.status')">
          <el-radio-group v-model="temp.status">
            <el-radio-button label="1">{{ $t('table.enable') }}</el-radio-button>
            <el-radio-button label="2">{{ $t('table.disable') }}</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item :label="$t('user.role')">
          <!--<el-checkbox-group v-model="roles">-->
          <!--<el-checkbox v-for="item in rolelist" :label="item.id" :key="item.id">{{ item.name }}</el-checkbox>-->
          <!--</el-checkbox-group>-->
          <!--<div style="margin-bottom: 20px;">-->
          <!--<el-select v-model="domain_id" class="filter-item" placeholder="Please select" @change="setDomain">-->
          <!--<el-option key="" label="全部" value=""/>-->
          <!--<el-option v-for="item in domainlist" :key="item.id" :label="item.name" :value="item.id"/>-->
          <!--</el-select>-->
          <!--</div>-->
          <!--<el-transfer-->
          <!--ref="transfer"-->
          <!--:filter-method="filterMethod"-->
          <!--:data="rolelist"-->
          <!--v-model="roles"-->
          <!--:props="{-->
          <!--key: 'id',-->
          <!--label: 'name'-->
          <!--}"-->
          <!--:titles="['角色列表','授权角色']"-->
          <!--filter-placeholder="请输入角色名"-->
          <!--filterable/>-->
          <!--<el-tree-->
          <!--ref="tree"-->
          <!--:data="tree_data"-->
          <!--:props="tree_props"-->
          <!--show-checkbox-->
          <!--default-expand-all-->
          <!--node-key="id"/>-->
          <el-tabs tab-position="left" type="border-card">
            <el-tab-pane v-for="items in domainlist" :key="items.id" :label="items.name" :value="items.id">
              <el-checkbox-group v-model="roles">
                <el-checkbox
                  v-for="item in rolelist.filter(o =>o.domain.id === items.id)"
                  :label="item.id"
                  :key="item.id">{{ item.name }}
                </el-checkbox>
              </el-checkbox-group>
            </el-tab-pane>
          </el-tabs>
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
import { fetchUserList, createUser, deleteUser, updateUser, updateUserStatus, changeUserPassword } from '@/api/user'
import { fetchRoleList } from '@/api/role'
import { fetchDeptList } from '@/api/dept'
import { fetchDomainList } from '@/api/domain'
// import { parseTime } from '@/utils'
import Pagination from '@/components/Pagination' // Secondary package based on el-pagination

export default {
  name: 'User',
  components: { Pagination },
  filters: {
    status(type) {
      return type === 1 ? '正常' : '停用'
    }
  },
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
        importance: undefined,
        type: undefined,
        sort: '+id'
      },
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      showReviewer: false,
      temp: {
        id: undefined,
        timestamp: new Date(),
        title: '',
        type: '',
        username: '',
        dept_id: '',
        email: '',
        mobile: '',
        status: '1',
        date: '',
        actions: '',
        password: '',
        repassword: '',
        realname: '',
        faceicon: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
        sex: '1',
        remark: ''
        // roles: []
      },
      dept_id: '',
      roles: [],
      dialogFormVisible: false,
      dialogStatus: 'create',
      textMap: {
        update: 'Edit',
        create: 'Create'
      },
      rules: {
        type: [{ required: true, message: 'type is required', trigger: 'change' }],
        timestamp: [{ type: 'date', required: true, message: 'timestamp is required', trigger: 'change' }],
        username: [{ required: true, message: '用户名必须填写', trigger: 'blur' }],
        password: [{ required: false, message: '密码必须填写', trigger: 'blur' }],
        title: [{ required: true, message: '职位必须填写', trigger: 'blur' }],
        realname: [{ required: true, message: '真实姓名必须填写', trigger: 'blur' }],
        email: [{ required: true, message: '邮箱必须填写', trigger: 'blur' }],
        mobile: [{ required: true, message: '手机号码必须填写', trigger: 'blur' }]
      },
      downloadLoading: false,
      rolelist: [],
      deptlist: [],
      domainlist: [],
      domain_id: '',
      search_domain_id: '',
      search_dept_id: '',
      tree_data: [],
      tree_props: {
        children: 'children',
        label: 'name'
      }
    }
  },
  created() {
    if (this.$route.query.dept) {
      this.listQuery.q = 'd=' + this.$route.query.dept
      this.search_dept_id = parseInt(this.$route.query.dept)
      // console.log(this.$route.query)
    }
    this.getList()
    this.getRoleList()
    this.getDeptList()
    // this.getDomainList()
  },
  methods: {
    getList() {
      this.listLoading = true
      this.listQuery.start = (this.listQuery.page - 1) * 20
      fetchUserList(this.listQuery).then(response => {
        this.list = response.data.result
        this.total = response.data.total

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    toSearch() {
      if (this.search_dept_id !== '') {
        this.listQuery.q = 'd=' + this.search_dept_id
      } else {
        delete this.listQuery.q
      }
      this.getList()
    },
    getRoleList() {
      // { q: 'd=' + this.domain_id }
      fetchRoleList({ limit: 1000 }).then(response => {
        this.rolelist = response.data.result
        this.getDomainList()
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    getDeptList() {
      fetchDeptList().then(response => {
        this.deptlist = response.data.result
        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    getDomainList() {
      fetchDomainList().then(response => {
        this.domainlist = response.data.result
        // const menu = this.domainlist
        // menu.forEach(o => {
        //   // console.log(o.id, this.rolelist)
        //   o.children = this.rolelist.filter(os => os.domain.id === o.id)
        //   o.id = 'domain_' + o.id
        // })
        // this.tree_data = menu
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    setDomain() {
      this.$refs.transfer.$refs.leftPanel.query = '\r'
      this.$refs.transfer.filterMethod()
      // this.$refs.transfer.clearQuery('left')
    },
    filterMethod(query, item) {
      if (query === '\r') {
        if (this.domain_id === '') {
          return true
        }
        return item && item.domain.id === this.domain_id
      } else {
        return item && item.name.indexOf(query) > -1
      }
    },
    department(id) {
      const o = this.deptlist.find(o => o.id === id)
      return o ? o.name : ''
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleModifyStatus(row, status) {
      updateUserStatus({ id: row.id, status: status }).then(() => {
        this.$message({
          message: '操作成功',
          type: 'success'
        })
        row.status = status
      })
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
        timestamp: new Date(),
        title: '',
        type: '',
        username: '',
        dept_id: '',
        email: '',
        mobile: '',
        status: '1',
        date: '',
        actions: '',
        password: '',
        repassword: '',
        realname: '',
        faceicon: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
        sex: '1',
        remark: ''
        // roles: []
      }
      this.roles = []
      // this.dept_id = ''
      this.domain_id = ''
      const dept = this.deptlist.find(o => o.name === '未分配')
      dept ? this.dept_id = dept.id : ''
    },
    handleCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.rules.password[0].required = true
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
        // this.$refs.tree.setCheckedKeys(this.roles)
        // this.$refs.transfer.$refs.leftPanel.query = ''
      })
    },
    handleCopyUpdate(row) {
      this.temp = Object.assign({ password: '' }, row) // copy obj
      this.temp.id = undefined
      this.temp.username = ''
      this.temp.sex = '1'
      this.temp.mobile = ''
      this.temp.email = ''
      this.temp.realname = ''
      this.temp.status = this.temp.status.toString()
      this.roles = []
      this.temp.Roles.forEach(o => {
        this.roles.push(o.id)
      })
      this.dept_id = this.temp.Department.id
      this.temp.faceicon = 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif'
      this.temp.timestamp = new Date(this.temp.timestamp)
      this.dialogStatus = 'create'
      this.temp.timestamp = new Date()
      this.rules.password[0].required = true
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
        // this.$refs.tree.setCheckedKeys(this.roles)
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if (this.dept_id === '') {
            this.$message.error('请选择所属部门')
            return
          }
          // this.roles = []
          // this.$refs.tree.getCheckedKeys().forEach(o => {
          //   if (o.toString().indexOf('domain_')) {
          //     this.roles.push(o)
          //   }
          // })
          // if (this.roles.length === 0) {
          //   this.$message.error('请选择所属角色授权')
          //   return
          // }
          this.temp.password = '123456'
          this.temp.roles = this.roles.join(',')
          this.temp.dept_id = this.dept_id
          delete this.temp.Roles
          createUser(this.temp).then(() => {
            // this.list.unshift(this.temp)
            this.getList()
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
      this.temp = Object.assign({ password: '' }, row) // copy obj
      this.temp.sex = this.temp.sex.toString()
      this.temp.status = this.temp.status.toString()
      this.roles = []
      this.temp.Roles.forEach(o => {
        this.roles.push(o.id)
      })
      this.dept_id = this.temp.Department.id
      this.temp.faceicon = 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif'
      this.temp.timestamp = new Date(this.temp.timestamp)
      this.dialogStatus = 'update'
      this.rules.password[0].required = false
      this.dialogFormVisible = true
      delete this.roles.password
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
        // this.$refs.tree.setCheckedKeys(this.roles)
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if (this.dept_id === '') {
            this.$message.error('请选择所属部门')
            return
          }
          // this.roles = []
          // this.$refs.tree.getCheckedKeys().forEach(o => {
          //   if (o.toString().indexOf('domain_')) {
          //     this.roles.push(o)
          //   }
          // })
          // if (this.roles.length === 0) {
          //   this.$message.error('请选择所属角色授权')
          //   return
          // }
          delete this.temp.Roles
          delete this.temp.Department
          delete this.temp.create_time
          this.temp.roles = this.roles.join(',')
          this.temp.dept_id = this.dept_id
          const tempData = Object.assign({}, this.temp)
          tempData.timestamp = new Date()
          updateUser(tempData).then(() => {
            this.getList()
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
      this.$confirm('<span>删除后, 将不可恢复,</span> 你还要继续吗?', '删除用户', {
        confirmButtonText: '继续',
        cancelButtonText: '取消',
        type: 'warning',
        dangerouslyUseHTMLString: true
      }).then(() => {
        deleteUser({ id: row.id }).then(() => {
          this.$notify({
            title: '成功',
            message: '重置成功',
            type: 'success',
            duration: 2000
          })
          this.getList()
          // const index = this.list.indexOf(row)
          // this.list.splice(index, 1)
        }).catch((res) => {
          this.$message.error(res.msg)
        })
      }).catch(() => {
      })
    },
    handleResetUpdate(row) {
      this.$confirm('将该用户的密码重置为初始密码123456', '重置该用户的密码', {
        confirmButtonText: '确定重置',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        changeUserPassword({ user_id: row.id, new_password: '123456', re_password: '123456' }).then(() => {
          this.$notify({
            title: '成功',
            message: '重置成功',
            type: 'success',
            duration: 2000
          })
          this.getList()
          // const index = this.list.indexOf(row)
          // this.list.splice(index, 1)
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
  .pagination-container {
    margin-top: 0;
  }

  .el-transfer-panel .el-transfer-panel__header .el-checkbox .el-checkbox__label {
    font-size: 14px;
  }

  .el-icon-circle-close:before {
    content: "\E619";
  }

  .right-menu-btn {
    margin-left: 10px;
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

  .el-message-box__message span {
    color: red;
  }
</style>
