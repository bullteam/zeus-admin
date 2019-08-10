var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent, Fragment } from 'react';
import { connect } from 'dva';
import moment from 'moment';
import Link from 'umi/link';
import { Row, Col, Card, Form, Input, Select, Icon, Button, Dropdown, Menu, InputNumber, DatePicker, Modal, message, Badge, Divider, Steps, Radio, } from 'antd';
import StandardTable from '@/components/StandardTable';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
import styles from './TableList.less';
const FormItem = Form.Item;
const { Step } = Steps;
const { TextArea } = Input;
const { Option } = Select;
const RadioGroup = Radio.Group;
const getValue = obj => Object.keys(obj)
    .map(key => obj[key])
    .join(',');
const statusMap = ['default', 'processing', 'success', 'error'];
const status = ['关闭', '运行中', '已上线', '异常'];
const CreateForm = Form.create()(props => {
    const { modalVisible, form, handleAdd, handleModalVisible } = props;
    const okHandle = () => {
        form.validateFields((err, fieldsValue) => {
            if (err)
                return;
            form.resetFields();
            handleAdd(fieldsValue);
        });
    };
    return (React.createElement(Modal, { destroyOnClose: true, title: "\u65B0\u5EFA\u89C4\u5219", visible: modalVisible, onOk: okHandle, onCancel: () => handleModalVisible() },
        React.createElement(FormItem, { labelCol: { span: 5 }, wrapperCol: { span: 15 }, label: "\u63CF\u8FF0" }, form.getFieldDecorator('desc', {
            rules: [{ required: true, message: '请输入至少五个字符的规则描述！', min: 5 }],
        })(React.createElement(Input, { placeholder: "\u8BF7\u8F93\u5165" })))));
});
let UpdateForm = class UpdateForm extends PureComponent {
    constructor(props) {
        super(props);
        this.handleNext = currentStep => {
            const { form, handleUpdate } = this.props;
            const { formVals: oldValue } = this.state;
            form.validateFields((err, fieldsValue) => {
                if (err)
                    return;
                const formVals = Object.assign({}, oldValue, fieldsValue);
                this.setState({
                    formVals,
                }, () => {
                    if (currentStep < 2) {
                        this.forward();
                    }
                    else {
                        handleUpdate(formVals);
                    }
                });
            });
        };
        this.backward = () => {
            const { currentStep } = this.state;
            this.setState({
                currentStep: currentStep - 1,
            });
        };
        this.forward = () => {
            const { currentStep } = this.state;
            this.setState({
                currentStep: currentStep + 1,
            });
        };
        this.renderContent = (currentStep, formVals) => {
            const { form } = this.props;
            if (currentStep === 1) {
                return [
                    React.createElement(FormItem, Object.assign({ key: "target" }, this.formLayout, { label: "\u76D1\u63A7\u5BF9\u8C61" }), form.getFieldDecorator('target', {
                        initialValue: formVals.target,
                    })(React.createElement(Select, { style: { width: '100%' } },
                        React.createElement(Option, { value: "0" }, "\u8868\u4E00"),
                        React.createElement(Option, { value: "1" }, "\u8868\u4E8C")))),
                    React.createElement(FormItem, Object.assign({ key: "template" }, this.formLayout, { label: "\u89C4\u5219\u6A21\u677F" }), form.getFieldDecorator('template', {
                        initialValue: formVals.template,
                    })(React.createElement(Select, { style: { width: '100%' } },
                        React.createElement(Option, { value: "0" }, "\u89C4\u5219\u6A21\u677F\u4E00"),
                        React.createElement(Option, { value: "1" }, "\u89C4\u5219\u6A21\u677F\u4E8C")))),
                    React.createElement(FormItem, Object.assign({ key: "type" }, this.formLayout, { label: "\u89C4\u5219\u7C7B\u578B" }), form.getFieldDecorator('type', {
                        initialValue: formVals.type,
                    })(React.createElement(RadioGroup, null,
                        React.createElement(Radio, { value: "0" }, "\u5F3A"),
                        React.createElement(Radio, { value: "1" }, "\u5F31")))),
                ];
            }
            if (currentStep === 2) {
                return [
                    React.createElement(FormItem, Object.assign({ key: "time" }, this.formLayout, { label: "\u5F00\u59CB\u65F6\u95F4" }), form.getFieldDecorator('time', {
                        rules: [{ required: true, message: '请选择开始时间！' }],
                    })(React.createElement(DatePicker, { style: { width: '100%' }, showTime: true, format: "YYYY-MM-DD HH:mm:ss", placeholder: "\u9009\u62E9\u5F00\u59CB\u65F6\u95F4" }))),
                    React.createElement(FormItem, Object.assign({ key: "frequency" }, this.formLayout, { label: "\u8C03\u5EA6\u5468\u671F" }), form.getFieldDecorator('frequency', {
                        initialValue: formVals.frequency,
                    })(React.createElement(Select, { style: { width: '100%' } },
                        React.createElement(Option, { value: "month" }, "\u6708"),
                        React.createElement(Option, { value: "week" }, "\u5468")))),
                ];
            }
            return [
                React.createElement(FormItem, Object.assign({ key: "name" }, this.formLayout, { label: "\u89C4\u5219\u540D\u79F0" }), form.getFieldDecorator('name', {
                    rules: [{ required: true, message: '请输入规则名称！' }],
                    initialValue: formVals.name,
                })(React.createElement(Input, { placeholder: "\u8BF7\u8F93\u5165" }))),
                React.createElement(FormItem, Object.assign({ key: "desc" }, this.formLayout, { label: "\u89C4\u5219\u63CF\u8FF0" }), form.getFieldDecorator('desc', {
                    rules: [{ required: true, message: '请输入至少五个字符的规则描述！', min: 5 }],
                    initialValue: formVals.desc,
                })(React.createElement(TextArea, { rows: 4, placeholder: "\u8BF7\u8F93\u5165\u81F3\u5C11\u4E94\u4E2A\u5B57\u7B26" }))),
            ];
        };
        this.renderFooter = currentStep => {
            const { handleUpdateModalVisible, values } = this.props;
            if (currentStep === 1) {
                return [
                    React.createElement(Button, { key: "back", style: { float: 'left' }, onClick: this.backward }, "\u4E0A\u4E00\u6B65"),
                    React.createElement(Button, { key: "cancel", onClick: () => handleUpdateModalVisible(false, values) }, "\u53D6\u6D88"),
                    React.createElement(Button, { key: "forward", type: "primary", onClick: () => this.handleNext(currentStep) }, "\u4E0B\u4E00\u6B65"),
                ];
            }
            if (currentStep === 2) {
                return [
                    React.createElement(Button, { key: "back", style: { float: 'left' }, onClick: this.backward }, "\u4E0A\u4E00\u6B65"),
                    React.createElement(Button, { key: "cancel", onClick: () => handleUpdateModalVisible(false, values) }, "\u53D6\u6D88"),
                    React.createElement(Button, { key: "submit", type: "primary", onClick: () => this.handleNext(currentStep) }, "\u5B8C\u6210"),
                ];
            }
            return [
                React.createElement(Button, { key: "cancel", onClick: () => handleUpdateModalVisible(false, values) }, "\u53D6\u6D88"),
                React.createElement(Button, { key: "forward", type: "primary", onClick: () => this.handleNext(currentStep) }, "\u4E0B\u4E00\u6B65"),
            ];
        };
        this.state = {
            formVals: {
                name: props.values.name,
                desc: props.values.desc,
                key: props.values.key,
                target: '0',
                template: '0',
                type: '1',
                time: '',
                frequency: 'month',
            },
            currentStep: 0,
        };
        this.formLayout = {
            labelCol: { span: 7 },
            wrapperCol: { span: 13 },
        };
    }
    render() {
        const { updateModalVisible, handleUpdateModalVisible, values } = this.props;
        const { currentStep, formVals } = this.state;
        return (React.createElement(Modal, { width: 640, bodyStyle: { padding: '32px 40px 48px' }, destroyOnClose: true, title: "\u89C4\u5219\u914D\u7F6E", visible: updateModalVisible, footer: this.renderFooter(currentStep), onCancel: () => handleUpdateModalVisible(false, values), afterClose: () => handleUpdateModalVisible() },
            React.createElement(Steps, { style: { marginBottom: 28 }, size: "small", current: currentStep },
                React.createElement(Step, { title: "\u57FA\u672C\u4FE1\u606F" }),
                React.createElement(Step, { title: "\u914D\u7F6E\u89C4\u5219\u5C5E\u6027" }),
                React.createElement(Step, { title: "\u8BBE\u5B9A\u8C03\u5EA6\u5468\u671F" })),
            this.renderContent(currentStep, formVals)));
    }
};
UpdateForm.defaultProps = {
    handleUpdate: () => { },
    handleUpdateModalVisible: () => { },
    values: {},
};
UpdateForm = __decorate([
    Form.create()
], UpdateForm);
/* eslint react/no-multi-comp:0 */
let TableList = class TableList extends PureComponent {
    /* eslint react/no-multi-comp:0 */
    constructor() {
        super(...arguments);
        this.state = {
            modalVisible: false,
            updateModalVisible: false,
            expandForm: false,
            selectedRows: [],
            formValues: {},
            stepFormValues: {},
        };
        this.columns = [
            {
                title: '规则名称',
                dataIndex: 'name',
                render: text => React.createElement(Link, { to: `/profile/basic/${text.replace(/\s+/gi, '-')}` }, text),
            },
            {
                title: '描述',
                dataIndex: 'desc',
            },
            {
                title: '服务调用次数',
                dataIndex: 'callNo',
                sorter: true,
                render: val => `${val} 万`,
                // mark to display a total number
                needTotal: true,
            },
            {
                title: '状态',
                dataIndex: 'status',
                filters: [
                    {
                        text: status[0],
                        value: 0,
                    },
                    {
                        text: status[1],
                        value: 1,
                    },
                    {
                        text: status[2],
                        value: 2,
                    },
                    {
                        text: status[3],
                        value: 3,
                    },
                ],
                render(val) {
                    return React.createElement(Badge, { status: statusMap[val], text: status[val] });
                },
            },
            {
                title: '上次调度时间',
                dataIndex: 'updatedAt',
                sorter: true,
                render: val => React.createElement("span", null, moment(val).format('YYYY-MM-DD HH:mm:ss')),
            },
            {
                title: '操作',
                render: (text, record) => (React.createElement(Fragment, null,
                    React.createElement("a", { onClick: () => this.handleUpdateModalVisible(true, record) }, "\u914D\u7F6E"),
                    React.createElement(Divider, { type: "vertical" }),
                    React.createElement("a", { href: "" }, "\u8BA2\u9605\u8B66\u62A5"))),
            },
        ];
        this.handleStandardTableChange = (pagination, filtersArg, sorter) => {
            const { dispatch } = this.props;
            const { formValues } = this.state;
            const filters = Object.keys(filtersArg).reduce((obj, key) => {
                const newObj = Object.assign({}, obj);
                newObj[key] = getValue(filtersArg[key]);
                return newObj;
            }, {});
            const params = Object.assign({ currentPage: pagination.current, pageSize: pagination.pageSize }, formValues, filters);
            if (sorter.field) {
                params.sorter = `${sorter.field}_${sorter.order}`;
            }
            dispatch({
                type: 'rule/fetch',
                payload: params,
            });
        };
        this.handleFormReset = () => {
            const { form, dispatch } = this.props;
            form.resetFields();
            this.setState({
                formValues: {},
            });
            dispatch({
                type: 'rule/fetch',
                payload: {},
            });
        };
        this.toggleForm = () => {
            const { expandForm } = this.state;
            this.setState({
                expandForm: !expandForm,
            });
        };
        this.handleMenuClick = e => {
            const { dispatch } = this.props;
            const { selectedRows } = this.state;
            if (selectedRows.length === 0)
                return;
            switch (e.key) {
                case 'remove':
                    dispatch({
                        type: 'rule/remove',
                        payload: {
                            key: selectedRows.map(row => row.key),
                        },
                        callback: () => {
                            this.setState({
                                selectedRows: [],
                            });
                        },
                    });
                    break;
                default:
                    break;
            }
        };
        this.handleSelectRows = rows => {
            this.setState({
                selectedRows: rows,
            });
        };
        this.handleSearch = e => {
            e.preventDefault();
            const { dispatch, form } = this.props;
            form.validateFields((err, fieldsValue) => {
                if (err)
                    return;
                const values = Object.assign({}, fieldsValue, { updatedAt: fieldsValue.updatedAt && fieldsValue.updatedAt.valueOf() });
                this.setState({
                    formValues: values,
                });
                dispatch({
                    type: 'rule/fetch',
                    payload: values,
                });
            });
        };
        this.handleModalVisible = flag => {
            this.setState({
                modalVisible: !!flag,
            });
        };
        this.handleUpdateModalVisible = (flag, record) => {
            this.setState({
                updateModalVisible: !!flag,
                stepFormValues: record || {},
            });
        };
        this.handleAdd = fields => {
            const { dispatch } = this.props;
            dispatch({
                type: 'rule/add',
                payload: {
                    desc: fields.desc,
                },
            });
            message.success('添加成功');
            this.handleModalVisible();
        };
        this.handleUpdate = fields => {
            const { dispatch } = this.props;
            const { formValues } = this.state;
            dispatch({
                type: 'rule/update',
                payload: {
                    query: formValues,
                    body: {
                        name: fields.name,
                        desc: fields.desc,
                        key: fields.key,
                    },
                },
            });
            message.success('配置成功');
            this.handleUpdateModalVisible();
        };
    }
    componentDidMount() {
        const { dispatch } = this.props;
        dispatch({
            type: 'rule/fetch',
        });
    }
    renderSimpleForm() {
        const { form: { getFieldDecorator }, } = this.props;
        return (React.createElement(Form, { onSubmit: this.handleSearch, layout: "inline" },
            React.createElement(Row, { gutter: { md: 8, lg: 24, xl: 48 } },
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement(FormItem, { label: "\u89C4\u5219\u540D\u79F0" }, getFieldDecorator('name')(React.createElement(Input, { placeholder: "\u8BF7\u8F93\u5165" })))),
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement(FormItem, { label: "\u4F7F\u7528\u72B6\u6001" }, getFieldDecorator('status')(React.createElement(Select, { placeholder: "\u8BF7\u9009\u62E9", style: { width: '100%' } },
                        React.createElement(Option, { value: "0" }, "\u5173\u95ED"),
                        React.createElement(Option, { value: "1" }, "\u8FD0\u884C\u4E2D"))))),
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement("span", { className: styles.submitButtons },
                        React.createElement(Button, { type: "primary", htmlType: "submit" }, "\u67E5\u8BE2"),
                        React.createElement(Button, { style: { marginLeft: 8 }, onClick: this.handleFormReset }, "\u91CD\u7F6E"),
                        React.createElement("a", { style: { marginLeft: 8 }, onClick: this.toggleForm },
                            "\u5C55\u5F00 ",
                            React.createElement(Icon, { type: "down" })))))));
    }
    renderAdvancedForm() {
        const { form: { getFieldDecorator }, } = this.props;
        return (React.createElement(Form, { onSubmit: this.handleSearch, layout: "inline" },
            React.createElement(Row, { gutter: { md: 8, lg: 24, xl: 48 } },
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement(FormItem, { label: "\u89C4\u5219\u540D\u79F0" }, getFieldDecorator('name')(React.createElement(Input, { placeholder: "\u8BF7\u8F93\u5165" })))),
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement(FormItem, { label: "\u4F7F\u7528\u72B6\u6001" }, getFieldDecorator('status')(React.createElement(Select, { placeholder: "\u8BF7\u9009\u62E9", style: { width: '100%' } },
                        React.createElement(Option, { value: "0" }, "\u5173\u95ED"),
                        React.createElement(Option, { value: "1" }, "\u8FD0\u884C\u4E2D"))))),
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement(FormItem, { label: "\u8C03\u7528\u6B21\u6570" }, getFieldDecorator('number')(React.createElement(InputNumber, { style: { width: '100%' } }))))),
            React.createElement(Row, { gutter: { md: 8, lg: 24, xl: 48 } },
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement(FormItem, { label: "\u66F4\u65B0\u65E5\u671F" }, getFieldDecorator('date')(React.createElement(DatePicker, { style: { width: '100%' }, placeholder: "\u8BF7\u8F93\u5165\u66F4\u65B0\u65E5\u671F" })))),
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement(FormItem, { label: "\u4F7F\u7528\u72B6\u6001" }, getFieldDecorator('status3')(React.createElement(Select, { placeholder: "\u8BF7\u9009\u62E9", style: { width: '100%' } },
                        React.createElement(Option, { value: "0" }, "\u5173\u95ED"),
                        React.createElement(Option, { value: "1" }, "\u8FD0\u884C\u4E2D"))))),
                React.createElement(Col, { md: 8, sm: 24 },
                    React.createElement(FormItem, { label: "\u4F7F\u7528\u72B6\u6001" }, getFieldDecorator('status4')(React.createElement(Select, { placeholder: "\u8BF7\u9009\u62E9", style: { width: '100%' } },
                        React.createElement(Option, { value: "0" }, "\u5173\u95ED"),
                        React.createElement(Option, { value: "1" }, "\u8FD0\u884C\u4E2D")))))),
            React.createElement("div", { style: { overflow: 'hidden' } },
                React.createElement("div", { style: { marginBottom: 24 } },
                    React.createElement(Button, { type: "primary", htmlType: "submit" }, "\u67E5\u8BE2"),
                    React.createElement(Button, { style: { marginLeft: 8 }, onClick: this.handleFormReset }, "\u91CD\u7F6E"),
                    React.createElement("a", { style: { marginLeft: 8 }, onClick: this.toggleForm },
                        "\u6536\u8D77 ",
                        React.createElement(Icon, { type: "up" }))))));
    }
    renderForm() {
        const { expandForm } = this.state;
        return expandForm ? this.renderAdvancedForm() : this.renderSimpleForm();
    }
    render() {
        const { rule: { data }, loading, } = this.props;
        const { selectedRows, modalVisible, updateModalVisible, stepFormValues } = this.state;
        const menu = (React.createElement(Menu, { onClick: this.handleMenuClick, selectedKeys: [] },
            React.createElement(Menu.Item, { key: "remove" }, "\u5220\u9664"),
            React.createElement(Menu.Item, { key: "approval" }, "\u6279\u91CF\u5BA1\u6279")));
        const parentMethods = {
            handleAdd: this.handleAdd,
            handleModalVisible: this.handleModalVisible,
        };
        const updateMethods = {
            handleUpdateModalVisible: this.handleUpdateModalVisible,
            handleUpdate: this.handleUpdate,
        };
        return (React.createElement(PageHeaderWrapper, { title: "\u67E5\u8BE2\u8868\u683C" },
            React.createElement(Card, { bordered: false },
                React.createElement("div", { className: styles.tableList },
                    React.createElement("div", { className: styles.tableListForm }, this.renderForm()),
                    React.createElement("div", { className: styles.tableListOperator },
                        React.createElement(Button, { icon: "plus", type: "primary", onClick: () => this.handleModalVisible(true) }, "\u65B0\u5EFA"),
                        selectedRows.length > 0 && (React.createElement("span", null,
                            React.createElement(Button, null, "\u6279\u91CF\u64CD\u4F5C"),
                            React.createElement(Dropdown, { overlay: menu },
                                React.createElement(Button, null,
                                    "\u66F4\u591A\u64CD\u4F5C ",
                                    React.createElement(Icon, { type: "down" })))))),
                    React.createElement(StandardTable, { selectedRows: selectedRows, loading: loading, data: data, columns: this.columns, onSelectRow: this.handleSelectRows, onChange: this.handleStandardTableChange }))),
            React.createElement(CreateForm, Object.assign({}, parentMethods, { modalVisible: modalVisible })),
            stepFormValues && Object.keys(stepFormValues).length ? (React.createElement(UpdateForm, Object.assign({}, updateMethods, { updateModalVisible: updateModalVisible, values: stepFormValues }))) : null));
    }
};
TableList = __decorate([
    connect(({ rule, loading }) => ({
        rule,
        loading: loading.models.rule,
    })),
    Form.create()
], TableList);
export default TableList;
//# sourceMappingURL=TableList.js.map