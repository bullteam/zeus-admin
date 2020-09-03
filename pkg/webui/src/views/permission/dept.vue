<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button
        v-permission="['/permission/dept:add']"
        class="filter-item"
        style="margin-left: 10px;"
        type="primary"
        icon="el-icon-edit"
        @click="handleCreate">{{ $t('table.add') }}
      </el-button>
    </div>
    <!--
    <el-table
      v-loading="listLoading"
      :key="tableKey"
      :data="list"
      border
      fit
      highlight-current-row
      style="width: 100%;"
      @sort-change="sortChange">
      <el-table-column :label="$t('dept.id')" prop="id" align="center" width="65">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('dept.name')" min-width="150px">
        <template slot-scope="scope">
          {{ scope.row.name }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('dept.actions')" align="center" width="280" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-permission="['/permission/dept:edit']"
            type="primary"
            size="mini"
            style="width: 80px;"
            @click="handleLook(scope.row)">{{ $t('table.look') }}
          </el-button>
          <el-button
            v-permission="['/permission/dept:edit']"
            v-if="scope.row.name!=='未分配'"
            type="primary"
            size="mini"
            @click="handleUpdate(scope.row)">{{ $t('table.edit') }}
          </el-button>
          <el-button
            v-permission="['/permission/dept:del']"
            v-if="scope.row.name!=='未分配'"
            type="danger"
            size="mini"
            @click="handleDelete(scope.row)">{{ $t('table.delete') }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    -->
    <tree-table
      :data="treeList"
      :eval-func="func"
      :eval-args="args"
      :columns="columns"
      :expand-all="expandAll"
      border
    >
      <!-- <el-table-column :label="$t('dept.id')" prop="id" align="center" width="65">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column> -->
      <el-table-column :label="$t('dept.actions')" align="center" width="350">
        <template slot-scope="scope">
          <el-button v-permission="['/auth-system/menu:edit']" type="text" size="mini" @click="handleCreate(scope.row)">
            {{ $t('table.createchild') }}
          </el-button>
          <el-button
            v-permission="['/permission/dept:edit']"
            type="text"
            size="mini"
            @click="handleLook(scope.row)">{{ $t('table.look') }}
          </el-button>
          <el-button
            v-permission="['/permission/dept:edit']"
            v-if="scope.row.name!=='未分配'"
            type="text"
            size="mini"
            @click="handleUpdate(scope.row)">{{ $t('table.edit') }}
          </el-button>
          <el-button
            v-permission="['/permission/dept:del']"
            v-if="scope.row.name!=='未分配'"
            type="text"
            size="mini"
            @click="handleDelete(scope.row)">{{ $t('table.delete') }}
          </el-button>
          <el-button
            v-permission="['/permission/dept:edit']"
            v-show="scope.row.parent_id===0"
            type="text"
            size="mini"
            @click="handleRebuild(scope.row)">{{ $t('table.rebuild') }}
          </el-button>
        </template>
      </el-table-column>
    </tree-table>
    <!--
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="getList"/>
    -->
    <el-dialog :title="$t('user.'+ textMap[dialogStatus])" :visible.sync="dialogFormVisible">
      <el-form
        ref="dataForm"
        :rules="rules"
        :model="temp"
        label-position="left"
        label-width="80px"
        style=" margin: 0 50px;">
        <el-form-item :label="$t('dept.name')" prop="name">
          <el-input v-model="temp.name"/>
        </el-form-item>
        <!--<el-form-item :label="$t('dept.remark')">-->
        <!--<el-input v-model="temp.remark"/>-->
        <!--</el-form-item>-->
        <!--<el-form-item :label="$t('dept.callbackurl')">-->
        <!--<el-input v-model="temp.callbackurl"/>-->
        <!--</el-form-item>-->
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
import { fetchDeptList, createDept, updateDept, deleteDept, checkMemberDept, rebuildDept } from '@/api/dept'
// import { parseTime } from '@/utils'
import Pagination from '@/components/Pagination' // Secondary package based on el-pagination
import PreCheck from '../layout/mixin/PreCheck'

export default {
  name: 'Dept',
  components: { Pagination, treeTable },
  mixins: [PreCheck],
  data() {
    return {
      func: treeToArray,
      args: [null, null, 'timeLine'],
      columns: [{
        value: 'name',
        text: this.$t('dept.name')
      }],
      expandAll: false,
      treeList: {},
      index: 1,
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        skip: 0,
        limit: 20,
        importance: undefined,
        title: undefined,
        type: undefined,
        sort: '+id'
      },
      // sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      department: ['admin', 'editor'],
      showReviewer: false,
      temp: {
        id: undefined,
        name: '',
        remark: '',
        callbackurl: '',
        parents: ['0']
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
        name: [{ required: true, message: '名称必须填写', trigger: 'blur' }]
      },
      downloadLoading: false,
      tree_data: [],
      tree_props: {
        children: 'children',
        label: 'name'
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      this.listQuery.skip = (this.listQuery.page - 1) * this.listQuery.limit
      fetchDeptList(this.listQuery).then(response => {
        this.list = response.data.result
        this.total = response.data.total
        this.treeList = this.o(response.data.result, 0)
        // Just to simulate the time of the request
        // setTimeout(() => {
        this.listLoading = false
        // }, 1.5 * 1000)
      })
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
    resetTemp(data) {
      if (typeof data !== undefined) {
        this.temp = {
          id: undefined,
          name: '',
          remark: '',
          callbackurl: '',
          parents: [data.id]
        }
      } else {
        this.temp = {
          id: undefined,
          name: '',
          remark: '',
          callbackurl: '',
          parents: ['0']
        }
      }
    },
    handleCreate(data) {
      this.resetTemp(data)
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.temp.id = parseInt(Math.random() * 100) + 1024 // mock a id
          this.temp.author = 'vue-element-admin'
          this.temp.parent_id = this.temp.parents[this.temp.parents.length - 1]
          delete this.temp.parent
          createDept(this.temp).then(() => {
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
      this.temp = Object.assign({}, row) // copy obj
      this.temp.timestamp = new Date(this.temp.timestamp)
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.temp.parents = []
      this.findParent(this.temp.id, this.temp.parents, this.list)
      this.temp.parents.reverse()
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    handleRebuild(row) {
      this.listLoading = true
      rebuildDept({ id: row.id }).then((res) => {
        this.listLoading = false
        this.$message.success(res.msg)
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          delete this.temp.children
          const tempData = Object.assign({}, this.temp)
          tempData.timestamp = +new Date(tempData.timestamp) // change Thu Nov 30 2017 16:41:05 GMT+0800 (CST) to 1512031311464
          tempData.parent_id = tempData.parents[this.temp.parents.length - 1]
          delete tempData.parent
          console.log(this.temp)
          updateDept(this.temp.id, tempData).then(() => {
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
      checkMemberDept({ id: row.id }).then((response) => {
        this.$confirm('<span>删除后，该部门名称可进行复用</span>', '删除部门', {
          confirmButtonText: '继续',
          cancelButtonText: '取消',
          type: 'warning',
          dangerouslyUseHTMLString: true
        }).then(() => {
          deleteDept({ id: row.id }).then(() => {
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
      }).catch((res) => {
        this.$alert('部门内仍有用户，请先将用户转移至其他部门再进行删除', '不可删除部门', {
          confirmButtonText: '确定',
          type: 'warning'
        })
      })
    },
    handleLook(row) {
      this.$router.push({ path: '/permission/dept/member?dept=' + row.id })
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
            alias: '',
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
          this.findParent(o.parent_id, output, this.treeList)
        }
        if (o.children && Array.isArray(o.children)) {
          this.findParent(id, output, o.children)
        }
      })
      return output
    }
  }
}
</script>

<style scoped>
  .pagination-container {
    margin-top: 0;
  }

  .el-message-box__message span {
    color: red;
  }
</style>
