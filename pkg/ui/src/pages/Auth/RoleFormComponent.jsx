import React, { Component } from 'react';
import { Form, Icon, Input, Button, Checkbox, Select, Radio, Divider,TreeSelect, Row } from 'antd';

const { SHOW_PARENT } = TreeSelect;
const treeData = [
  {
    title: '权限管理',
    value: '1',
    key: '1',
    children: [
      {
        title: '用户管理',
        value: '11',
        key: '11',
        children: [
          {
            title: '浏览',
            value: '111',
            key: '111',
          },
          {
            title: '添加',
            value: '112',
            key: '112',
          },
          {
            title: '修改',
            value: '113',
            key: '113',
          },
          {
            title: '删除',
            value: '114',
            key: '114',
          },
        ],
      },
      {
        title: '部门管理',
        value: '12',
        key: '12',
        children: [
          {
            title: '浏览',
            value: '121',
            key: '121',
          },
          {
            title: '添加',
            value: '122',
            key: '122',
          },
          {
            title: '修改',
            value: '123',
            key: '123',
          },
          {
            title: '删除',
            value: '124',
            key: '124',
          },
        ],
      },
      {
        title: '角色管理',
        value: '13',
        key: '13',
        children: [
          {
            title: '浏览',
            value: '131',
            key: '131',
          },
          {
            title: '添加',
            value: '132',
            key: '132',
          },
          {
            title: '修改',
            value: '133',
            key: '133',
          },
          {
            title: '删除',
            value: '134',
            key: '134',
          },
        ],
      },
    ],
  },
];

class RolePermissionComponent extends React.Component {
  state = {
    value: [],
  };

  onChange = value => {
    console.log('onChange ', value);
    this.setState({ value });
  };

  render() {
    const tProps = {
      treeData,
      value: this.state.value,
      onChange: this.onChange,
      treeCheckable: true,
      showCheckedStrategy: SHOW_PARENT,
      searchPlaceholder: '权限管理',
      style: {
        width: 300,
      },
    };
    return (
      <Row>
        <TreeSelect {...tProps} />
      </Row>
    );
  }
}

const DataPermissionComponent = (props) => {
  return(
    <div>数据权限</div>
  )
}

class RoleFormComponent extends Component {
  constructor(props) {
    super(props);
    this.state = {
      rolePermission: '1',
    }
  }
  handleRolePermission = (e) => {
    this.setState({
      rolePermission: e.target.value
    })
  };
  handleSubmit = e => {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      if (!err) {
        console.log('Received values of form: ', values);
      }
    });
  };
  render() {
    const { getFieldDecorator } = this.props.form;
    const formItemLayout = {
      labelCol: {
        xs: { span: 4 },
        sm: { span: 4 },
      },
      wrapperCol: {
        xs: { span: 20 },
        sm: { span: 20},
      },
    };
    const {rolePermission} = this.state;

    return (
      <Form {...formItemLayout} onSubmit={this.handleSubmit}>
        <Form.Item label="角色名">
          {getFieldDecorator('name', {
            rules: [{ required: true, message: 'Please input your name!' }],
          })(
            <Input 
              placeholder="请输入角色名"
            />,
          )}
        </Form.Item>
        <Form.Item label="备注">
          <Input
            type="remarks"
            placeholder="请输入备注"
          />
        </Form.Item>
        <Form.Item label="项目域">
          <Select defaultValue="1" style={{ width: 150 }}>
            <Option value="1">权限中心</Option>
            <Option value="2">测试中心</Option>
          </Select>
        </Form.Item>
        <Form.Item label="角色权限">
          <Radio.Group defaultValue="1" buttonStyle="solid" onChange={this.handleRolePermission}>
            <Radio.Button value="1">角色权限</Radio.Button>
            <Radio.Button value="2">数据权限</Radio.Button>
          </Radio.Group>
          {
            rolePermission === '1' 
            ? <RolePermissionComponent test="123" />
            : <DataPermissionComponent />
          }
        </Form.Item>
      </Form>
    );
  }
}

const WrappedRoleFormComponent = Form.create({ name: 'normal_login' })(RoleFormComponent);

export default WrappedRoleFormComponent;