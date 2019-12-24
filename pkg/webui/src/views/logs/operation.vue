<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form inline>
        <el-form-item label="用户名">
          <el-input v-model="listQuery.username" />
        </el-form-item>
        <el-form-item label="IP">
          <el-input v-model="listQuery.ip" />
        </el-form-item>
        <el-form-item label="操作时间">
          <el-date-picker
            v-model="dateValue"
            :picker-options="pickerOptions"
            value-format="yyyy-MM-dd HH:mm:ss"
            type="datetimerange"
            range-separator="至"
            start-placeholder="开始时间"
            end-placeholder="结束时间"
            align="right">
          </el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="toSearch">
            {{ $t('table.search') }}
          </el-button>
        </el-form-item>
      </el-form>
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
      <el-table-column :label="$t('log.user_id')" min-width="100px" width="100px">
        <template slot-scope="scope">
          {{ scope.row.username }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.request_url')" width="250px">
        <template slot-scope="scope">
          {{ scope.row.request_url }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.operation_method')" align="center" width="100px">
        <template slot-scope="scope">
          {{ scope.row.operation_method }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.operation_result')" width="120px">
        <template slot-scope="scope">
          {{ scope.row.operation_result }}
        </template>
      </el-table-column>
      <el-table-column :label="$t('log.operation_content')" align="center" width="220px">
        <template slot-scope="scope">
          {{ scope.row.operation_content }}
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
      <el-table-column :label="$t('log.operation_time')" width="160px" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.operation_time | parseTime('{y}-{m}-{d} {h}:{i}:{s}') }}</span>
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
import { fetchOperationLogList } from '@/api/log'
import Pagination from '@/components/Pagination'
import moment from 'moment'
import PreCheck from '../layout/mixin/PreCheck'

export default {
  name: 'LogsOperation',
  components: { Pagination },
  filters: {
    status(type) {
      return type === 1 ? 'success' : 'failed'
    }
  },
  mixins: [PreCheck],
  data() {
    return {
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        username: '',
        ip: '',
        start_time: '',
        end_time: '',
        page: 1,
        skip: 0,
        limit: 10,
        sort: '+id'
      },
      sortOptions: [{ label: 'ID Ascending', key: '+id' }, { label: 'ID Descending', key: '-id' }],
      showReviewer: false,
      downloadLoading: false,
      status: 0,
      pickerOptions: {
        shortcuts: [{
          text: '最近一周',
          onClick(picker) {
            const end = new Date()
            const start = new Date()
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
            picker.$emit('pick', [start, end])
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date()
            const start = new Date()
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30)
            picker.$emit('pick', [start, end])
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date()
            const start = new Date()
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90)
            picker.$emit('pick', [start, end])
          }
        }]
      },
      dateValue: []
    }
  },
  created() {
    this.dateValue = this.lastMonth()
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      this.listQuery.skip = (this.listQuery.page - 1) * this.listQuery.limit
      if (this.dateValue) {
        this.listQuery.start_time = this.dateValue[0]
        this.listQuery.end_time = this.dateValue[1]
      }
      fetchOperationLogList(this.listQuery).then(response => {
        this.list = response.data.result
        this.total = response.data.total

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    toSearch() {
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
    },
    lastMonth() {
      return [
        moment().subtract(1, 'months').format('YYYY-MM-DD 00:00:00'),
        moment().format('YYYY-MM-DD 00:00:00')
      ]
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
