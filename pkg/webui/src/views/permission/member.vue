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
      <!--<el-select v-model="search_dept_id" class="filter-item" placeholder="Please select" @change="toSearch">-->
      <!--<el-option key="" label="全部" value=""/>-->
      <!--<el-option v-for="item in deptlist" :key="item.id" :label="item.name" :value="item.id"/>-->
      <!--</el-select>-->
      <!--<el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="toSearch">-->
      <!--{{ $t('table.search') }}-->
      <!--</el-button>-->
      <el-button v-waves class="filter-item" type="primary" @click="toMoveAll">
        {{ $t('table.move_all') }}
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
      @sort-change="sortChange"
      @selection-change="handleSelectionChange">
      <el-table-column
        type="selection"
        width="55"/>
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
      <el-table-column :label="$t('user.realname')" align="center" width="150px">
        <template slot-scope="scope">
          {{ scope.row.realname }}
        </template>
      </el-table-column>
      <el-table-column
        :label="$t('user.actions')"
        align="center"
        width="80"
        class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-permission="['/permission/user:edit']"
            type="primary"
            size="mini"
            @click="handleUpdate(scope.row)">{{ $t('table.move') }}
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

    <el-dialog :title="$t('user.'+ textMap[dialogStatus])" :visible.sync="dialogFormVisible" width="420px">
      <el-form
        ref="dataForm"
        :rules="rules"
        label-position="left"
        label-width="80px"
        style=" margin-left:50px;">
        <el-form-item :label="$t('user.move_department')">
          <el-select v-model="dept_id" class="filter-item" placeholder="Please select">
            <el-option v-for="item in deptlist" :key="item.id" :label="item.name" :value="item.id"/>
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
import { fetchUserList, updateUserDept } from '@/api/user'
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
      dept_id: '',
      id: undefined,
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
      },
      multipleSelection: []
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
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    handleUpdate(row) {
      this.id = row.id
      const dept = this.deptlist.find(o => o.name === '未分配')
      dept ? this.dept_id = dept.id : ''
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
        // this.$refs.tree.setCheckedKeys(this.roles)
      })
    },
    updateData() {
      if (this.dept_id === '') {
        this.$message.error('请选择所属部门')
        return
      }
      if (this.id === '') {
        this.$message.error('请勾选用户')
        return
      }
      updateUserDept({ uids: this.id, department_id: this.dept_id }).then(() => {
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
    },
    toMoveAll() {
      const uids = []
      this.multipleSelection.forEach(o => {
        uids.push(o.id)
      })
      this.id = uids.join(',')
      if (this.id === '') {
        this.$message.error('请勾选用户')
        return
      }
      const dept = this.deptlist.find(o => o.name === '未分配')
      dept ? this.dept_id = dept.id : ''
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
        // this.$refs.tree.setCheckedKeys(this.roles)
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
