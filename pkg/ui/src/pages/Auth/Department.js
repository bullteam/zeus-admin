import React, {Component} from 'react';
// import {connect} from 'dva'; //网络请求组件
// import List from '@/components/List';
import {Button, Table, Modal, Form, Input, Popconfirm} from 'antd';
import styles from './Department.less';


/* 数据 */
const data = [
  {
    id: '1',
    name: 'XX部',
  },
  {
    id: '2',
    name: 'YYY部',
  },
];

/* 编辑框组件 */
class EditForm extends Component {
  /* 组件挂载后 */
  componentDidMount() {
    this.props.onRef(this);
  }

  /**
   * 提交
   * @param e
   */
  editSubmit = (e) => {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      if (!err) {
        // TODO 提交数据
        console.log('输入的值', values);
        this.props.hideModalEdit();
      }
    });
  }

  render() {
    const {getFieldDecorator} = this.props.form;
    const editFormLayout = {
      labelCol: {
        span: 4
      },
      wrapperCol: {
        span: 16
      },
    };
    return (
      <Form {...editFormLayout} onSubmit={this.editSubmit}>
        <Form.Item label="ID" style={{display: 'none'}}>
          {getFieldDecorator('id', {})(<Input disabled />)}
        </Form.Item>
        <Form.Item label="名称">
          {getFieldDecorator('name', {
            rules: [{required: true, message: '请输入名称'}],
          })(<Input />)}
        </Form.Item>
      </Form>
    );
  }
}

const WrappedEditForm = Form.create({name: 'edit_form'})(EditForm);

/* 部门管理模块 */
class Department extends Component {
  constructor(props) {
    super(props);
    this.state = {
      show_modal_edit: false,// 是否显示编辑对话框
      modal_title: '新建',
    };
  }

  /**
   * 显示编辑对话框
   */
  showModalEdit = (record) => {
    this.setState({
      show_modal_edit: true
    });

    setTimeout(() => {
      if (this.editForm) {
        this.editForm.props.form.resetFields();
        this.setState({
          modal_title: '新建',
        });
        if (record) {
          this.setState({
            modal_title: '编辑',
          });
          const {name} = {...record};
          this.editForm.props.form.setFieldsValue({name});
        }
      }
    }, 0);
  }

  /**
   * 隐藏编辑对话框
   */
  hideModalEdit = () => {
    this.setState({
      show_modal_edit: false
    });
  }

  /**
   * 模态框保存 - 调用EditForm子组件提交
   */
  modalSave = (e) => {
    this.editForm.editSubmit(e);
  }

  /**
   * 模态框取消
   */
  modalCancel = () => {
    this.setState({
      show_modal_edit: false
    });
  }

  /**
   * 删除
   */
  delConfirm = (item) => {
    console.log(item);
    // TODO 删除
  }

  render() {
    const columns = [
      {
        title: 'ID',
        dataIndex: 'id',
        width: '50px',
        key: 'id',
      },
      {
        title: '名称',
        dataIndex: 'name',
        key: 'name',
      },
      {
        title: '操作',
        width: '300px',
        render: (text, record, index) => (
          <div className={styles['btn-group']}>
            <Button type="primary">查看用户</Button>
            <Button type="primary" onClick={() => this.showModalEdit(record)}>编辑</Button>
            <Popconfirm
              placement="top"
              title="确定要删除？"
              onConfirm={() => this.delConfirm(record)}
              okText="是"
              cancelText="否"
            >
              <Button type="danger">删除</Button>
            </Popconfirm>
          </div>
        ),
      },
    ];
    return (
      <div className={styles.main}>
        {/* 编辑框 */}
        <Modal
          title={this.state.modal_title}
          visible={this.state.show_modal_edit}
          onOk={this.modalSave}
          onCancel={this.modalCancel}
        >
          <WrappedEditForm
            onRef={(ref) => {
              this.editForm = ref
            }}
            hideModalEdit={this.hideModalEdit}
          />
        </Modal>

        <h2>部门管理</h2>
        <Button
          type="primary"
          icon="edit"
          style={{marginBottom: 16}}
          onClick={() => {
            this.showModalEdit()
          }}
        >
          添加
        </Button>
        <Table dataSource={data} columns={columns} />
      </div>);
  }
}

export default Department;