var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component, Fragment } from 'react';
import { connect } from 'dva';
import { Form, Card, Select, List, Tag, Icon, Row, Col, Button } from 'antd';
import { FormattedMessage } from 'umi-plugin-react/locale';
import TagSelect from '@/components/TagSelect';
import StandardFormRow from '@/components/StandardFormRow';
import ArticleListContent from '@/components/ArticleListContent';
import styles from './Articles.less';
const { Option } = Select;
const FormItem = Form.Item;
const pageSize = 5;
let SearchList = class SearchList extends Component {
    constructor() {
        super(...arguments);
        this.setOwner = () => {
            const { form } = this.props;
            form.setFieldsValue({
                owner: ['wzj'],
            });
        };
        this.fetchMore = () => {
            const { dispatch } = this.props;
            dispatch({
                type: 'list/appendFetch',
                payload: {
                    count: pageSize,
                },
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
        const { form, list: { list }, loading, } = this.props;
        const { getFieldDecorator } = form;
        const owners = [
            {
                id: 'wzj',
                name: '我自己',
            },
            {
                id: 'wjh',
                name: '吴家豪',
            },
            {
                id: 'zxx',
                name: '周星星',
            },
            {
                id: 'zly',
                name: '赵丽颖',
            },
            {
                id: 'ym',
                name: '姚明',
            },
        ];
        const IconText = ({ type, text }) => (React.createElement("span", null,
            React.createElement(Icon, { type: type, style: { marginRight: 8 } }),
            text));
        const formItemLayout = {
            wrapperCol: {
                xs: { span: 24 },
                sm: { span: 24 },
                md: { span: 12 },
            },
        };
        const actionsTextMap = {
            expandText: React.createElement(FormattedMessage, { id: "component.tagSelect.expand", defaultMessage: "Expand" }),
            collapseText: (React.createElement(FormattedMessage, { id: "component.tagSelect.collapse", defaultMessage: "Collapse" })),
            selectAllText: React.createElement(FormattedMessage, { id: "component.tagSelect.all", defaultMessage: "All" }),
        };
        const loadMore = list.length > 0 ? (React.createElement("div", { style: { textAlign: 'center', marginTop: 16 } },
            React.createElement(Button, { onClick: this.fetchMore, style: { paddingLeft: 48, paddingRight: 48 } }, loading ? (React.createElement("span", null,
                React.createElement(Icon, { type: "loading" }),
                " \u52A0\u8F7D\u4E2D...")) : ('加载更多')))) : null;
        return (React.createElement(Fragment, null,
            React.createElement(Card, { bordered: false },
                React.createElement(Form, { layout: "inline" },
                    React.createElement(StandardFormRow, { title: "\u6240\u5C5E\u7C7B\u76EE", block: true, style: { paddingBottom: 11 } },
                        React.createElement(FormItem, null, getFieldDecorator('category')(React.createElement(TagSelect, { expandable: true, actionsText: actionsTextMap },
                            React.createElement(TagSelect.Option, { value: "cat1" }, "\u7C7B\u76EE\u4E00"),
                            React.createElement(TagSelect.Option, { value: "cat2" }, "\u7C7B\u76EE\u4E8C"),
                            React.createElement(TagSelect.Option, { value: "cat3" }, "\u7C7B\u76EE\u4E09"),
                            React.createElement(TagSelect.Option, { value: "cat4" }, "\u7C7B\u76EE\u56DB"),
                            React.createElement(TagSelect.Option, { value: "cat5" }, "\u7C7B\u76EE\u4E94"),
                            React.createElement(TagSelect.Option, { value: "cat6" }, "\u7C7B\u76EE\u516D"),
                            React.createElement(TagSelect.Option, { value: "cat7" }, "\u7C7B\u76EE\u4E03"),
                            React.createElement(TagSelect.Option, { value: "cat8" }, "\u7C7B\u76EE\u516B"),
                            React.createElement(TagSelect.Option, { value: "cat9" }, "\u7C7B\u76EE\u4E5D"),
                            React.createElement(TagSelect.Option, { value: "cat10" }, "\u7C7B\u76EE\u5341"),
                            React.createElement(TagSelect.Option, { value: "cat11" }, "\u7C7B\u76EE\u5341\u4E00"),
                            React.createElement(TagSelect.Option, { value: "cat12" }, "\u7C7B\u76EE\u5341\u4E8C"))))),
                    React.createElement(StandardFormRow, { title: "owner", grid: true },
                        React.createElement(Row, null,
                            React.createElement(Col, null,
                                React.createElement(FormItem, Object.assign({}, formItemLayout),
                                    getFieldDecorator('owner', {
                                        initialValue: ['wjh', 'zxx'],
                                    })(React.createElement(Select, { mode: "multiple", style: { maxWidth: 286, width: '100%' }, placeholder: "\u9009\u62E9 owner" }, owners.map(owner => (React.createElement(Option, { key: owner.id, value: owner.id }, owner.name))))),
                                    React.createElement("a", { className: styles.selfTrigger, onClick: this.setOwner }, "\u53EA\u770B\u81EA\u5DF1\u7684"))))),
                    React.createElement(StandardFormRow, { title: "\u5176\u5B83\u9009\u9879", grid: true, last: true },
                        React.createElement(Row, { gutter: 16 },
                            React.createElement(Col, { xl: 8, lg: 10, md: 12, sm: 24, xs: 24 },
                                React.createElement(FormItem, Object.assign({}, formItemLayout, { label: "\u6D3B\u8DC3\u7528\u6237" }), getFieldDecorator('user', {})(React.createElement(Select, { placeholder: "\u4E0D\u9650", style: { maxWidth: 200, width: '100%' } },
                                    React.createElement(Option, { value: "lisa" }, "\u674E\u4E09"))))),
                            React.createElement(Col, { xl: 8, lg: 10, md: 12, sm: 24, xs: 24 },
                                React.createElement(FormItem, Object.assign({}, formItemLayout, { label: "\u597D\u8BC4\u5EA6" }), getFieldDecorator('rate', {})(React.createElement(Select, { placeholder: "\u4E0D\u9650", style: { maxWidth: 200, width: '100%' } },
                                    React.createElement(Option, { value: "good" }, "\u4F18\u79C0"))))))))),
            React.createElement(Card, { style: { marginTop: 24 }, bordered: false, bodyStyle: { padding: '8px 32px 32px 32px' } },
                React.createElement(List, { size: "large", loading: list.length === 0 ? loading : false, rowKey: "id", itemLayout: "vertical", loadMore: loadMore, dataSource: list, renderItem: item => (React.createElement(List.Item, { key: item.id, actions: [
                            React.createElement(IconText, { type: "star-o", text: item.star }),
                            React.createElement(IconText, { type: "like-o", text: item.like }),
                            React.createElement(IconText, { type: "message", text: item.message }),
                        ], extra: React.createElement("div", { className: styles.listItemExtra }) },
                        React.createElement(List.Item.Meta, { title: React.createElement("a", { className: styles.listItemMetaTitle, href: item.href }, item.title), description: React.createElement("span", null,
                                React.createElement(Tag, null, "Ant Design"),
                                React.createElement(Tag, null, "\u8BBE\u8BA1\u8BED\u8A00"),
                                React.createElement(Tag, null, "\u8682\u8681\u91D1\u670D")) }),
                        React.createElement(ArticleListContent, { data: item }))) }))));
    }
};
SearchList = __decorate([
    connect(({ list, loading }) => ({
        list,
        loading: loading.models.list,
    })),
    Form.create({
        onValuesChange({ dispatch }, changedValues, allValues) {
            // 表单项变化时请求数据
            // eslint-disable-next-line
            console.log(changedValues, allValues);
            // 模拟查询表单生效
            dispatch({
                type: 'list/fetch',
                payload: {
                    count: 5,
                },
            });
        },
    })
], SearchList);
export default SearchList;
//# sourceMappingURL=Articles.js.map