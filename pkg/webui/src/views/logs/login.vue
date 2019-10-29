<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form inline>
        <el-form-item label="用户名">
          <el-input v-model="userName" />
        </el-form-item>
        <el-form-item label="IP">
          <el-input v-model="ip" />
        </el-form-item>
        <el-form-item label="登录时间" label-width="120px" class="postInfo-container-item">
          <el-date-picker v-model="displayTime" type="datetime" format="yyyy-MM-dd HH:mm:ss" placeholder="Select start datetime" />
        </el-form-item>
        <el-form-item label="">
          <el-date-picker v-model="displayTime" type="datetime" format="yyyy-MM-dd HH:mm:ss" placeholder="Select end datetime" />
        </el-form-item>
        <el-form-item>
          <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="toSearch">
            {{ $t('table.search') }}
          </el-button>
        </el-form-item>
      </el-form>
      <el-alert
        :closable="false"
        :title="`总共有${total}个结果`"
        type="success"/>
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
      <el-table-column :label="$t('log.id')" prop="id" align="center" width="65">
        <template slot-scope="scope">
          <span>{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.user_id')" min-width="100px" width="120px">
        <template slot-scope="scope">
          {{ scope.row.user_id }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.client')" width="290px">
        <template slot-scope="scope">
          {{ scope.row.client }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.platform')" align="center" width="120px">
        <template slot-scope="scope">
          {{ scope.row.platform }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.login_result')" width="150px">
        <template slot-scope="scope">
          {{ scope.row.login_result }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.login_status')" align="center" width="110px">
        <template slot-scope="scope">
          {{ scope.row.login_status | status }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.ip')" align="center" width="100px">
        <template slot-scope="scope">
          {{ scope.row.ip }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.ip_location')" align="center" width="100px">
        <template slot-scope="scope">
          {{ scope.row.ip_location }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.login_time')" width="160px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.login_time | parseTime('{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="getList"/>

  </div>
</template>

<script>
import { fetchLoginLogList } from '@/api/log'
import Pagination from '@/components/Pagination'

export default {
  name: 'LoginLog',
  components: { Pagination },
  filters: {
    status(type) {
      return type === 1 ? 'success' : 'failed'
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
        skip: 0,
        limit: 20,
        importance: undefined,
        type: undefined,
        sort: '+id'
      },
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      showReviewer: false,
      downloadLoading: false,
      status: 0,
      userName: '',
      ip: '',
      display_time: undefined // 前台展示时间
    }
  },
  computed: {
    displayTime: {
      // set and get is useful when the data
      // returned by the back end api is different from the front end
      // back end return => "2013-06-25 06:59:25"
      // front end need timestamp => 1372114765000
      get() {
        return (+new Date(this.display_time))
      },
      set(val) {
        this.display_time = new Date(val)
      }
    }
  },
  created() {
    if (this.$route.query.dept) {
      this.listQuery.q = 'd=' + this.$route.query.dept
    }
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      this.listQuery.skip = (this.listQuery.page - 1) * this.listQuery.limit
      fetchLoginLogList(this.listQuery).then(response => {
        this.list = response.data.result
        this.total = response.data.total

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    toSearch() {
      if (this.search_department_id !== '') {
        this.listQuery.q = 'd=' + this.search_department_id
      } else {
        delete this.listQuery.q
      }
      this.getList()
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
  .el-checkbox+.el-checkbox {
    margin-left: 0px;
  }
  .el-checkbox {
    margin-right: 15px;
  }
</style>
