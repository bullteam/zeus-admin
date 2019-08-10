var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { findDOMNode } from 'react-dom';
import moment from 'moment';
import { connect } from 'dva';
import { List, Card, Row, Col, Radio, Input, Progress, Button, Icon, Dropdown, Menu, Avatar, Modal, Form, DatePicker, Select, } from 'antd';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
import Result from '@/components/Result';
import styles from './BasicList.less';
const FormItem = Form.Item;
const RadioButton = Radio.Button;
const RadioGroup = Radio.Group;
const SelectOption = Select.Option;
const { Search, TextArea } = Input;
let BasicList = class BasicList extends PureComponent {
    constructor() {
        super(...arguments);
        this.state = { visible: false, done: false };
        this.formLayout = {
            labelCol: { span: 7 },
            wrapperCol: { span: 13 },
        };
        this.showModal = () => {
            this.setState({
                visible: true,
                current: undefined,
            });
        };
        this.showEditModal = item => {
            this.setState({
                visible: true,
                current: item,
            });
        };
        this.handleDone = () => {
            setTimeout(() => this.addBtn.blur(), 0);
            this.setState({
                done: false,
                visible: false,
            });
        };
        this.handleCancel = () => {
            setTimeout(() => this.addBtn.blur(), 0);
            this.setState({
                visible: false,
            });
        };
        this.handleSubmit = e => {
            e.preventDefault();
            const { dispatch, form } = this.props;
            const { current } = this.state;
            const id = current ? current.id : '';
            setTimeout(() => this.addBtn.blur(), 0);
            form.validateFields((err, fieldsValue) => {
                if (err)
                    return;
                this.setState({
                    done: true,
                });
                dispatch({
                    type: 'list/submit',
                    payload: Object.assign({ id }, fieldsValue),
                });
            });
        };
        this.deleteItem = id => {
            const { dispatch } = this.props;
            dispatch({
                type: 'list/submit',
                payload: { id },
            });
        };
    }
    componentDidMount() {
        const { dispatch } = this.props;
        dispatch({
            type: 'list/fetch',
            payload: {
                count: 5,
            },
        });
    }
    render() {
        const { list: { list }, loading, } = this.props;
        const { form: { getFieldDecorator }, } = this.props;
        const { visible, done, current = {} } = this.state;
        const editAndDelete = (key, currentItem) => {
            if (key === 'edit')
                this.showEditModal(currentItem);
            else if (key === 'delete') {
                Modal.confirm({
                    title: '删除任务',
                    content: '确定删除该任务吗？',
                    okText: '确认',
                    cancelText: '取消',
                    onOk: () => this.deleteItem(currentItem.id),
                });
            }
        };
        const modalFooter = done
            ? { footer: null, onCancel: this.handleDone }
            : { okText: '保存', onOk: this.handleSubmit, onCancel: this.handleCancel };
        const Info = ({ title, value, bordered }) => (React.createElement("div", { className: styles.headerInfo },
            React.createElement("span", null, title),
            React.createElement("p", null, value),
            bordered && React.createElement("em", null)));
        const extraContent = (React.createElement("div", { className: styles.extraContent },
            React.createElement(RadioGroup, { defaultValue: "all" },
                React.createElement(RadioButton, { value: "all" }, "\u5168\u90E8"),
                React.createElement(RadioButton, { value: "progress" }, "\u8FDB\u884C\u4E2D"),
                React.createElement(RadioButton, { value: "waiting" }, "\u7B49\u5F85\u4E2D")),
            React.createElement(Search, { className: styles.extraContentSearch, placeholder: "\u8BF7\u8F93\u5165", onSearch: () => ({}) })));
        const paginationProps = {
            showSizeChanger: true,
            showQuickJumper: true,
            pageSize: 5,
            total: 50,
        };
        const ListContent = ({ data: { owner, createdAt, percent, status } }) => (React.createElement("div", { className: styles.listContent },
            React.createElement("div", { className: styles.listContentItem },
                React.createElement("span", null, "Owner"),
                React.createElement("p", null, owner)),
            React.createElement("div", { className: styles.listContentItem },
                React.createElement("span", null, "\u5F00\u59CB\u65F6\u95F4"),
                React.createElement("p", null, moment(createdAt).format('YYYY-MM-DD HH:mm'))),
            React.createElement("div", { className: styles.listContentItem },
                React.createElement(Progress, { percent: percent, status: status, strokeWidth: 6, style: { width: 180 } }))));
        const MoreBtn = props => (React.createElement(Dropdown, { overlay: React.createElement(Menu, { onClick: ({ key }) => editAndDelete(key, props.current) },
                React.createElement(Menu.Item, { key: "edit" }, "\u7F16\u8F91"),
                React.createElement(Menu.Item, { key: "delete" }, "\u5220\u9664")) },
            React.createElement("a", null,
                "\u66F4\u591A ",
                React.createElement(Icon, { type: "down" }))));
        const getModalContent = () => {
            if (done) {
                return (React.createElement(Result, { type: "success", title: "\u64CD\u4F5C\u6210\u529F", description: "\u4E00\u7CFB\u5217\u7684\u4FE1\u606F\u63CF\u8FF0\uFF0C\u5F88\u77ED\u540C\u6837\u4E5F\u53EF\u4EE5\u5E26\u6807\u70B9\u3002", actions: React.createElement(Button, { type: "primary", onClick: this.handleDone }, "\u77E5\u9053\u4E86"), className: styles.formResult }));
            }
            return (React.createElement(Form, { onSubmit: this.handleSubmit },
                React.createElement(FormItem, Object.assign({ label: "\u4EFB\u52A1\u540D\u79F0" }, this.formLayout), getFieldDecorator('title', {
                    rules: [{ required: true, message: '请输入任务名称' }],
                    initialValue: current.title,
                })(React.createElement(Input, { placeholder: "\u8BF7\u8F93\u5165" }))),
                React.createElement(FormItem, Object.assign({ label: "\u5F00\u59CB\u65F6\u95F4" }, this.formLayout), getFieldDecorator('createdAt', {
                    rules: [{ required: true, message: '请选择开始时间' }],
                    initialValue: current.createdAt ? moment(current.createdAt) : null,
                })(React.createElement(DatePicker, { showTime: true, placeholder: "\u8BF7\u9009\u62E9", format: "YYYY-MM-DD HH:mm:ss", style: { width: '100%' } }))),
                React.createElement(FormItem, Object.assign({ label: "\u4EFB\u52A1\u8D1F\u8D23\u4EBA" }, this.formLayout), getFieldDecorator('owner', {
                    rules: [{ required: true, message: '请选择任务负责人' }],
                    initialValue: current.owner,
                })(React.createElement(Select, { placeholder: "\u8BF7\u9009\u62E9" },
                    React.createElement(SelectOption, { value: "\u4ED8\u6653\u6653" }, "\u4ED8\u6653\u6653"),
                    React.createElement(SelectOption, { value: "\u5468\u6BDB\u6BDB" }, "\u5468\u6BDB\u6BDB")))),
                React.createElement(FormItem, Object.assign({}, this.formLayout, { label: "\u4EA7\u54C1\u63CF\u8FF0" }), getFieldDecorator('subDescription', {
                    rules: [{ message: '请输入至少五个字符的产品描述！', min: 5 }],
                    initialValue: current.subDescription,
                })(React.createElement(TextArea, { rows: 4, placeholder: "\u8BF7\u8F93\u5165\u81F3\u5C11\u4E94\u4E2A\u5B57\u7B26" })))));
        };
        return (React.createElement(PageHeaderWrapper, null,
            React.createElement("div", { className: styles.standardList },
                React.createElement(Card, { bordered: false },
                    React.createElement(Row, null,
                        React.createElement(Col, { sm: 8, xs: 24 },
                            React.createElement(Info, { title: "\u6211\u7684\u5F85\u529E", value: "8\u4E2A\u4EFB\u52A1", bordered: true })),
                        React.createElement(Col, { sm: 8, xs: 24 },
                            React.createElement(Info, { title: "\u672C\u5468\u4EFB\u52A1\u5E73\u5747\u5904\u7406\u65F6\u95F4", value: "32\u5206\u949F", bordered: true })),
                        React.createElement(Col, { sm: 8, xs: 24 },
                            React.createElement(Info, { title: "\u672C\u5468\u5B8C\u6210\u4EFB\u52A1\u6570", value: "24\u4E2A\u4EFB\u52A1" })))),
                React.createElement(Card, { className: styles.listCard, bordered: false, title: "\u6807\u51C6\u5217\u8868", style: { marginTop: 24 }, bodyStyle: { padding: '0 32px 40px 32px' }, extra: extraContent },
                    React.createElement(Button, { type: "dashed", style: { width: '100%', marginBottom: 8 }, icon: "plus", onClick: this.showModal, ref: component => {
                            /* eslint-disable */
                            this.addBtn = findDOMNode(component);
                            /* eslint-enable */
                        } }, "\u6DFB\u52A0"),
                    React.createElement(List, { size: "large", rowKey: "id", loading: loading, pagination: paginationProps, dataSource: list, renderItem: item => (React.createElement(List.Item, { actions: [
                                React.createElement("a", { onClick: e => {
                                        e.preventDefault();
                                        this.showEditModal(item);
                                    } }, "\u7F16\u8F91"),
                                React.createElement(MoreBtn, { current: item }),
                            ] },
                            React.createElement(List.Item.Meta, { avatar: React.createElement(Avatar, { src: item.logo, shape: "square", size: "large" }), title: React.createElement("a", { href: item.href }, item.title), description: item.subDescription }),
                            React.createElement(ListContent, { data: item }))) }))),
            React.createElement(Modal, Object.assign({ title: done ? null : `任务${current.id ? '编辑' : '添加'}`, className: styles.standardListForm, width: 640, bodyStyle: done ? { padding: '72px 0' } : { padding: '28px 0 0' }, destroyOnClose: true, visible: visible }, modalFooter), getModalContent())));
    }
};
BasicList = __decorate([
    connect(({ list, loading }) => ({
        list,
        loading: loading.models.list,
    })),
    Form.create()
], BasicList);
export default BasicList;
//# sourceMappingURL=BasicList.js.map