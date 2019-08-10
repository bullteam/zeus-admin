import React, { Component } from 'react';
import { connect } from 'dva';
import {
  Table,
  Divider,
  Button,
  Card,
  Icon,
  Modal,
  Popconfirm,
  Select,
} from 'antd';
import styles from './MenuManage.less';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';

const { Option } = Select;

const SelectComponent = () => {
  function handleChange(value) {
    console.log(`selected ${value}`);
  }
  return (
    <Select defaultValue="auth" style={{ width: 120 }} onChange={handleChange}>
      <Option value="auth">权限中心</Option>
      <Option value="test">测试中心</Option>
    </Select>
  );
};

const data = [
  {
    id: 1,
    name: '权限管理',
    icon: '图标',
    type: ' 菜单',
    order: 1,
    route: '/permission',
    auth_vi: '',
    key: 1,
    children: [
      {
        id: 2,
        name: '用户管理',
        icon: '图标',
        type: ' 菜单',
        order: 1,
        route: '/permission',
        auth_vi: '',
        key: 11,
        children: [
          {
            id: 3,
            name: '浏览',
            icon: '图标',
            type: ' 菜单',
            order: 1,
            route: '/permission',
            auth_vi: '',
            key: 111,
          },
        ],
      },
      {
        id: 4,
        name: '部门管理',
        icon: '图标',
        type: ' 菜单',
        order: 1,
        route: '/permission',
        auth_vi: '',
        key: 12,
        children: [
          {
            id: 5,
            name: '浏览',
            icon: '图标',
            type: ' 菜单',
            order: 1,
            route: '/permission',
            auth_vi: '',
            key: 121,
          },
        ],
      },
      {
        id: 6,
        name: '角色管理',
        icon: '图标',
        type: ' 菜单',
        order: 1,
        route: '/permission',
        auth_vi: '',
        key: 13,
        children: [
          {
            id: 7,
            name: '浏览',
            icon: '图标',
            type: ' 菜单',
            order: 1,
            route: '/permission',
            auth_vi: '',
            key: 131,
          },
        ],
      },
    ],
  },
];

@connect(({ loading }) => ({
  loading: loading.effects['profile/fetchBasic'],
}))
class Hello extends Component {
  state = {
    modalAddVisible: false,
    modalEditVisible: false,
  };

  showModalAdd = () => {
    this.setState({
      modalAddVisible: true,
    });
  };

  handleAddOk = () => {
    this.setState({
      modalAddVisible: false,
    });
  };

  handleAddCancel = () => {
    this.setState({
      modalAddVisible: false,
    });
  };

  showModalEdit = () => {
    this.setState({
      modalEditVisible: true,
    });
  };

  handleEditOk = () => {
    this.setState({
      modalEditVisible: false,
    });
  };

  handleEditCancel = () => {
    this.setState({
      modalEditVisible: false,
    });
  };

  handleDelete = () => {};

  render() {
    const { loading } = this.props;
    const columns = [
      {
        title: '名称',
        dataIndex: 'name',
        key: 'name',
      },
      {
        title: '图标',
        dataIndex: 'icon',
        key: 'icon',
      },
      {
        title: '类型',
        dataIndex: 'type',
        key: 'type',
      },
      {
        title: '排序',
        dataIndex: 'order',
        key: 'order',
      },
      {
        title: '路由',
        dataIndex: 'route',
        key: 'route',
      },
      {
        title: '授权标识',
        dataIndex: 'auth_vi',
        key: 'auth_vi',
      },
      {
        title: '操作',
        key: 'action',
        render: (text, record) => (
          <span>
            <Button type="primary" onClick={this.showModalEdit}>
              编辑
            </Button>
            <Divider type="vertical" />

            <Popconfirm title="Sure to delete?" onConfirm={() => this.handleDelete(record.key)}>
              <Button type="danger">删除</Button>
            </Popconfirm>
          </span>
        ),
      },
    ];
    return (
      <PageHeaderWrapper title="菜单管理" loading={loading} id="app.auth.header">
        <Modal
          title="新增菜单"
          visible={this.state.modalAddVisible}
          onOk={this.handleAddOk}
          onCancel={this.handleAddCancel}
        >
          <p>新增 ing</p>
        </Modal>
        <Modal
          title="编辑菜单"
          visible={this.state.modalEditVisible}
          onOk={this.handleEditOk}
          onCancel={this.handleEditCancel}
        >
          <p>编辑 ing</p>
        </Modal>
        <Card bordered={false}>
          <div className={styles.tableOperations}>
            <SelectComponent />
            <Divider type="vertical" />
            <Button type="primary">刷新</Button>
            <Divider type="vertical" />
            <Button type="primary" onClick={this.showModalAdd}>
              新增
            </Button>
          </div>
          <Table bordered columns={columns} dataSource={data} />
        </Card>
      </PageHeaderWrapper>
    );
  }
}

export default Hello;
