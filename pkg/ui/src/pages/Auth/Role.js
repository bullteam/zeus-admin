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
  Form,
  Input,
  Select,
} from 'antd';
import styles from './Role.less';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
import RoleFormComponent from './RoleFormComponent';

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
    name: '超级管理员',
    project: '权限中心',
    remark: '备注',
  },
  {
    id: 1,
    name: '超级管理员',
    project: '权限中心',
    remark: '备注',
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
        title: 'Id',
        dataIndex: 'id',
        key: 'id',
      },
      {
        title: '角色名',
        dataIndex: 'name',
        key: 'name',
      },
      {
        title: '项目',
        dataIndex: 'project',
        key: 'project',
      },
      {
        title: '备注',
        dataIndex: 'remark',
        key: 'remark',
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
      <PageHeaderWrapper title="角色管理" loading={loading} id="app.auth.header">
        <Modal
          width="60%"
          title="新增角色"
          visible={this.state.modalAddVisible}
          onOk={this.handleAddOk}
          onCancel={this.handleAddCancel}
        >
          <RoleFormComponent />
        </Modal>
        <Modal
          
          title="编辑角色"
          visible={this.state.modalEditVisible}
          onOk={this.handleEditOk}
          onCancel={this.handleEditCancel}
        >
          <RoleFormComponent />
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
