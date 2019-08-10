var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component } from 'react';
import { connect } from 'dva';
import { Card, Badge, Table, Divider } from 'antd';
import DescriptionList from '@/components/DescriptionList';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
import styles from './BasicProfile.less';
const { Description } = DescriptionList;
const progressColumns = [
    {
        title: '时间',
        dataIndex: 'time',
        key: 'time',
    },
    {
        title: '当前进度',
        dataIndex: 'rate',
        key: 'rate',
    },
    {
        title: '状态',
        dataIndex: 'status',
        key: 'status',
        render: text => text === 'success' ? (React.createElement(Badge, { status: "success", text: "\u6210\u529F" })) : (React.createElement(Badge, { status: "processing", text: "\u8FDB\u884C\u4E2D" })),
    },
    {
        title: '操作员ID',
        dataIndex: 'operator',
        key: 'operator',
    },
    {
        title: '耗时',
        dataIndex: 'cost',
        key: 'cost',
    },
];
let BasicProfile = class BasicProfile extends Component {
    componentDidMount() {
        const { dispatch, match } = this.props;
        const { params } = match;
        dispatch({
            type: 'profile/fetchBasic',
            payload: params.id || '1000000000',
        });
    }
    render() {
        const { profile = {}, loading } = this.props;
        const { basicGoods = [], basicProgress = [], userInfo = {}, application = {} } = profile;
        let goodsData = [];
        if (basicGoods.length) {
            let num = 0;
            let amount = 0;
            basicGoods.forEach(item => {
                num += Number(item.num);
                amount += Number(item.amount);
            });
            goodsData = basicGoods.concat({
                id: '总计',
                num,
                amount,
            });
        }
        const renderContent = (value, row, index) => {
            const obj = {
                children: value,
                props: {},
            };
            if (index === basicGoods.length) {
                obj.props.colSpan = 0;
            }
            return obj;
        };
        const goodsColumns = [
            {
                title: '商品编号',
                dataIndex: 'id',
                key: 'id',
                render: (text, row, index) => {
                    if (index < basicGoods.length) {
                        return React.createElement("a", { href: "" }, text);
                    }
                    return {
                        children: React.createElement("span", { style: { fontWeight: 600 } }, "\u603B\u8BA1"),
                        props: {
                            colSpan: 4,
                        },
                    };
                },
            },
            {
                title: '商品名称',
                dataIndex: 'name',
                key: 'name',
                render: renderContent,
            },
            {
                title: '商品条码',
                dataIndex: 'barcode',
                key: 'barcode',
                render: renderContent,
            },
            {
                title: '单价',
                dataIndex: 'price',
                key: 'price',
                align: 'right',
                render: renderContent,
            },
            {
                title: '数量（件）',
                dataIndex: 'num',
                key: 'num',
                align: 'right',
                render: (text, row, index) => {
                    if (index < basicGoods.length) {
                        return text;
                    }
                    return React.createElement("span", { style: { fontWeight: 600 } }, text);
                },
            },
            {
                title: '金额',
                dataIndex: 'amount',
                key: 'amount',
                align: 'right',
                render: (text, row, index) => {
                    if (index < basicGoods.length) {
                        return text;
                    }
                    return React.createElement("span", { style: { fontWeight: 600 } }, text);
                },
            },
        ];
        return (React.createElement(PageHeaderWrapper, { title: "\u57FA\u7840\u8BE6\u60C5\u9875", loading: loading },
            React.createElement(Card, { bordered: false },
                React.createElement(DescriptionList, { size: "large", title: "\u9000\u6B3E\u7533\u8BF7", style: { marginBottom: 32 } },
                    React.createElement(Description, { term: "\u53D6\u8D27\u5355\u53F7" }, application.id),
                    React.createElement(Description, { term: "\u72B6\u6001" }, application.status),
                    React.createElement(Description, { term: "\u9500\u552E\u5355\u53F7" }, application.orderNo),
                    React.createElement(Description, { term: "\u5B50\u8BA2\u5355" }, application.childOrderNo)),
                React.createElement(Divider, { style: { marginBottom: 32 } }),
                React.createElement(DescriptionList, { size: "large", title: "\u7528\u6237\u4FE1\u606F", style: { marginBottom: 32 } },
                    React.createElement(Description, { term: "\u7528\u6237\u59D3\u540D" }, userInfo.name),
                    React.createElement(Description, { term: "\u8054\u7CFB\u7535\u8BDD" }, userInfo.tel),
                    React.createElement(Description, { term: "\u5E38\u7528\u5FEB\u9012" }, userInfo.delivery),
                    React.createElement(Description, { term: "\u53D6\u8D27\u5730\u5740" }, userInfo.addr),
                    React.createElement(Description, { term: "\u5907\u6CE8" }, userInfo.remark)),
                React.createElement(Divider, { style: { marginBottom: 32 } }),
                React.createElement("div", { className: styles.title }, "\u9000\u8D27\u5546\u54C1"),
                React.createElement(Table, { style: { marginBottom: 24 }, pagination: false, loading: loading, dataSource: goodsData, columns: goodsColumns, rowKey: "id" }),
                React.createElement("div", { className: styles.title }, "\u9000\u8D27\u8FDB\u5EA6"),
                React.createElement(Table, { style: { marginBottom: 16 }, pagination: false, loading: loading, dataSource: basicProgress, columns: progressColumns }))));
    }
};
BasicProfile = __decorate([
    connect(({ profile, loading }) => ({
        profile,
        loading: loading.effects['profile/fetchBasic'],
    }))
], BasicProfile);
export default BasicProfile;
//# sourceMappingURL=BasicProfile.js.map