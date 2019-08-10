import React, {Component} from 'react';
// import {connect} from 'dva'; //网络请求组件
// import List from '@/components/List';
import {
  Button,
  Table,
  Modal,
  Form,
  Input,
  Popconfirm,
  Select,
  Radio,
} from 'antd';
import styles from './DataPerm.less';

const {Option} = Select;
const {TextArea} = Input;


/* 数据 */
const data = [
  {
    id: '1',
    name: 'XX项目',
    type: 1,
    order: 1,
    url: '',
    rule: '',
    statement: 'sssssss1111111'
  },
  {
    id: '2',
    name: 'YYYYYYYYYYY项目',
    type: 2,
    order: 2,
    url: '/index2',
    rule: 'YYYYYYYY222222',
    statement: 'sssssss22222'
  },
];

/* 编辑框组件 */
class EditForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      edit_type: 1,// 编辑类型：1新建，2编辑
    }
  }

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
    const {getFieldDecorator, getFieldValue} = this.props.form;
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
        <Form.Item label="类型">
          {getFieldDecorator('type', {
            initialValue: 1,
            rules: [{required: true, message: '请选择类型'}],
          })(
            <Radio.Group buttonStyle="solid">
              <Radio.Button value={1}>分类</Radio.Button>
              <Radio.Button value={2}>数据权限</Radio.Button>
            </Radio.Group>
          )}
        </Form.Item>
        <Form.Item label="名称">
          {getFieldDecorator('name', {
            rules: [{required: true, message: '请输入名称'}],
          })(<Input />)}
        </Form.Item>
        <Form.Item label="排序">
          {getFieldDecorator('order', {
            rules: [{required: true, message: '请输入序号'}],
          })(<Input />)}
        </Form.Item>
        <Form.Item
          label="路由"
          style={{display: (getFieldValue('type') === 2) ? 'block' : 'none'}}
        >
          {getFieldDecorator('url', {
            rules: [{required: getFieldValue('type') === 2, message: '请输入路由'}],
          })(<Input />)}
        </Form.Item>
        <Form.Item
          label="权限规则"
          style={{display: (getFieldValue('type') === 2) ? 'block' : 'none'}}
        >
          {getFieldDecorator('rule')(<TextArea rows={2} />)}
        </Form.Item>
        <Form.Item label="说明">
          {getFieldDecorator('statement')(<TextArea rows={4} />)}
        </Form.Item>
      </Form>
    );
  }
}

const WrappedEditForm = Form.create({name: 'edit_form'})(EditForm);

/* 数据权限管理模块 */
class DataPerm extends Component {
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
      show_modal_edit: true,
    });

    setTimeout(() => {
      if (this.editForm) {
        this.editForm.props.form.resetFields();
        this.editForm.state.edit_type = 1;
        this.setState({
          modal_title: '新建',
        });
        if (record) {
          this.editForm.state.edit_type = 2;
          const {
            id,
            name,
            type,
            order,
            url,
            statement,
          } = {...record};
          this.editForm.props.form.setFieldsValue({
            id,
            name,
            type,
            order,
            url,
            statement,
          });
          this.setState({
            modal_title: '编辑',
          });
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


  topSelectChange = () => {

  }

  render() {
    const columns = [
      {
        title: '名称',
        dataIndex: 'name',
        key: 'name',
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
        dataIndex: 'url',
        key: 'url',
      },
      {
        title: '权限规则',
        dataIndex: 'rule',
        key: 'rule',
      },
      {
        title: '说明',
        dataIndex: 'statement',
        key: 'statement',
      },
      {
        title: '操作',
        width: '300px',
        render: (text, record, index) => (
          <div className={styles['btn-group']}>
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

    const topOptions = {1: '权限中心'};
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

        <h2>数据权限</h2>

        <Select
          defaultValue={topOptions[Object.keys(topOptions)[0]]}
          style={{width: 150, marginRight: 10,}}
          onChange={() => {
            this.topSelectChange()
          }}
        >
          {
            Object.keys(topOptions).map((key) => {
              let val = topOptions[key];
              return (<Option value={key}>{val}</Option>);
            })
          }
        </Select>
        <span className={styles['btn-group']}>
          <Button
            type="primary"
            icon="search"
            style={{marginBottom: 16}}
          >
            搜索
          </Button>
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
        </span>
        <Table dataSource={data} columns={columns} />
      </div>);
  }
}

export default DataPerm;