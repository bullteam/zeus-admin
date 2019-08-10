var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component, Fragment } from 'react';
import Debounce from 'lodash-decorators/debounce';
import Bind from 'lodash-decorators/bind';
import { connect } from 'dva';
import { Button, Menu, Dropdown, Icon, Row, Col, Steps, Card, Popover, Badge, Table, Tooltip, Divider, } from 'antd';
import classNames from 'classnames';
import DescriptionList from '@/components/DescriptionList';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
import styles from './AdvancedProfile.less';
const { Step } = Steps;
const { Description } = DescriptionList;
const ButtonGroup = Button.Group;
const getWindowWidth = () => window.innerWidth || document.documentElement.clientWidth;
const menu = (React.createElement(Menu, null,
    React.createElement(Menu.Item, { key: "1" }, "\u9009\u9879\u4E00"),
    React.createElement(Menu.Item, { key: "2" }, "\u9009\u9879\u4E8C"),
    React.createElement(Menu.Item, { key: "3" }, "\u9009\u9879\u4E09")));
const action = (React.createElement(Fragment, null,
    React.createElement(ButtonGroup, null,
        React.createElement(Button, null, "\u64CD\u4F5C"),
        React.createElement(Button, null, "\u64CD\u4F5C"),
        React.createElement(Dropdown, { overlay: menu, placement: "bottomRight" },
            React.createElement(Button, null,
                React.createElement(Icon, { type: "ellipsis" })))),
    React.createElement(Button, { type: "primary" }, "\u4E3B\u64CD\u4F5C")));
const extra = (React.createElement(Row, null,
    React.createElement(Col, { xs: 24, sm: 12 },
        React.createElement("div", { className: styles.textSecondary }, "\u72B6\u6001"),
        React.createElement("div", { className: styles.heading }, "\u5F85\u5BA1\u6279")),
    React.createElement(Col, { xs: 24, sm: 12 },
        React.createElement("div", { className: styles.textSecondary }, "\u8BA2\u5355\u91D1\u989D"),
        React.createElement("div", { className: styles.heading }, "\u00A5 568.08"))));
const description = (React.createElement(DescriptionList, { className: styles.headerList, size: "small", col: "2" },
    React.createElement(Description, { term: "\u521B\u5EFA\u4EBA" }, "\u66F2\u4E3D\u4E3D"),
    React.createElement(Description, { term: "\u8BA2\u8D2D\u4EA7\u54C1" }, "XX \u670D\u52A1"),
    React.createElement(Description, { term: "\u521B\u5EFA\u65F6\u95F4" }, "2017-07-07"),
    React.createElement(Description, { term: "\u5173\u8054\u5355\u636E" },
        React.createElement("a", { href: "" }, "12421")),
    React.createElement(Description, { term: "\u751F\u6548\u65E5\u671F" }, "2017-07-07 ~ 2017-08-08"),
    React.createElement(Description, { term: "\u5907\u6CE8" }, "\u8BF7\u4E8E\u4E24\u4E2A\u5DE5\u4F5C\u65E5\u5185\u786E\u8BA4")));
const tabList = [
    {
        key: 'detail',
        tab: '详情',
    },
    {
        key: 'rule',
        tab: '规则',
    },
];
const desc1 = (React.createElement("div", { className: classNames(styles.textSecondary, styles.stepDescription) },
    React.createElement(Fragment, null,
        "\u66F2\u4E3D\u4E3D",
        React.createElement(Icon, { type: "dingding-o", style: { marginLeft: 8 } })),
    React.createElement("div", null, "2016-12-12 12:32")));
const desc2 = (React.createElement("div", { className: styles.stepDescription },
    React.createElement(Fragment, null,
        "\u5468\u6BDB\u6BDB",
        React.createElement(Icon, { type: "dingding-o", style: { color: '#00A0E9', marginLeft: 8 } })),
    React.createElement("div", null,
        React.createElement("a", { href: "" }, "\u50AC\u4E00\u4E0B"))));
const popoverContent = (React.createElement("div", { style: { width: 160 } },
    "\u5434\u52A0\u53F7",
    React.createElement("span", { className: styles.textSecondary, style: { float: 'right' } },
        React.createElement(Badge, { status: "default", text: React.createElement("span", { style: { color: 'rgba(0, 0, 0, 0.45)' } }, "\u672A\u54CD\u5E94") })),
    React.createElement("div", { className: styles.textSecondary, style: { marginTop: 4 } }, "\u8017\u65F6\uFF1A2\u5C0F\u65F625\u5206\u949F")));
const customDot = (dot, { status }) => status === 'process' ? (React.createElement(Popover, { placement: "topLeft", arrowPointAtCenter: true, content: popoverContent }, dot)) : (dot);
const operationTabList = [
    {
        key: 'tab1',
        tab: '操作日志一',
    },
    {
        key: 'tab2',
        tab: '操作日志二',
    },
    {
        key: 'tab3',
        tab: '操作日志三',
    },
];
const columns = [
    {
        title: '操作类型',
        dataIndex: 'type',
        key: 'type',
    },
    {
        title: '操作人',
        dataIndex: 'name',
        key: 'name',
    },
    {
        title: '执行结果',
        dataIndex: 'status',
        key: 'status',
        render: text => text === 'agree' ? (React.createElement(Badge, { status: "success", text: "\u6210\u529F" })) : (React.createElement(Badge, { status: "error", text: "\u9A73\u56DE" })),
    },
    {
        title: '操作时间',
        dataIndex: 'updatedAt',
        key: 'updatedAt',
    },
    {
        title: '备注',
        dataIndex: 'memo',
        key: 'memo',
    },
];
let AdvancedProfile = class AdvancedProfile extends Component {
    constructor() {
        super(...arguments);
        this.state = {
            operationkey: 'tab1',
            stepDirection: 'horizontal',
        };
        this.onOperationTabChange = key => {
            this.setState({ operationkey: key });
        };
    }
    componentDidMount() {
        const { dispatch } = this.props;
        dispatch({
            type: 'profile/fetchAdvanced',
        });
        this.setStepDirection();
        window.addEventListener('resize', this.setStepDirection, { passive: true });
    }
    componentWillUnmount() {
        window.removeEventListener('resize', this.setStepDirection);
        this.setStepDirection.cancel();
    }
    setStepDirection() {
        const { stepDirection } = this.state;
        const w = getWindowWidth();
        if (stepDirection !== 'vertical' && w <= 576) {
            this.setState({
                stepDirection: 'vertical',
            });
        }
        else if (stepDirection !== 'horizontal' && w > 576) {
            this.setState({
                stepDirection: 'horizontal',
            });
        }
    }
    render() {
        const { stepDirection, operationkey } = this.state;
        const { profile, loading } = this.props;
        const { advancedOperation1, advancedOperation2, advancedOperation3 } = profile;
        const contentList = {
            tab1: (React.createElement(Table, { pagination: false, loading: loading, dataSource: advancedOperation1, columns: columns })),
            tab2: (React.createElement(Table, { pagination: false, loading: loading, dataSource: advancedOperation2, columns: columns })),
            tab3: (React.createElement(Table, { pagination: false, loading: loading, dataSource: advancedOperation3, columns: columns })),
        };
        return (React.createElement(PageHeaderWrapper, { title: "\u5355\u53F7\uFF1A234231029431", logo: React.createElement("img", { alt: "", src: "https://gw.alipayobjects.com/zos/rmsportal/nxkuOJlFJuAUhzlMTCEe.png" }), extra: action, content: description, extraContent: extra, tabList: tabList },
            React.createElement(Card, { title: "\u6D41\u7A0B\u8FDB\u5EA6", style: { marginBottom: 24 }, bordered: false },
                React.createElement(Steps, { direction: stepDirection, progressDot: customDot, current: 1 },
                    React.createElement(Step, { title: "\u521B\u5EFA\u9879\u76EE", description: desc1 }),
                    React.createElement(Step, { title: "\u90E8\u95E8\u521D\u5BA1", description: desc2 }),
                    React.createElement(Step, { title: "\u8D22\u52A1\u590D\u6838" }),
                    React.createElement(Step, { title: "\u5B8C\u6210" }))),
            React.createElement(Card, { title: "\u7528\u6237\u4FE1\u606F", style: { marginBottom: 24 }, bordered: false },
                React.createElement(DescriptionList, { style: { marginBottom: 24 } },
                    React.createElement(Description, { term: "\u7528\u6237\u59D3\u540D" }, "\u4ED8\u5C0F\u5C0F"),
                    React.createElement(Description, { term: "\u4F1A\u5458\u5361\u53F7" }, "32943898021309809423"),
                    React.createElement(Description, { term: "\u8EAB\u4EFD\u8BC1" }, "3321944288191034921"),
                    React.createElement(Description, { term: "\u8054\u7CFB\u65B9\u5F0F" }, "18112345678"),
                    React.createElement(Description, { term: "\u8054\u7CFB\u5730\u5740" }, "\u66F2\u4E3D\u4E3D 18100000000 \u6D59\u6C5F\u7701\u676D\u5DDE\u5E02\u897F\u6E56\u533A\u9EC4\u59D1\u5C71\u8DEF\u5DE5\u4E13\u8DEF\u4EA4\u53C9\u8DEF\u53E3")),
                React.createElement(DescriptionList, { style: { marginBottom: 24 }, title: "\u4FE1\u606F\u7EC4" },
                    React.createElement(Description, { term: "\u67D0\u67D0\u6570\u636E" }, "725"),
                    React.createElement(Description, { term: "\u8BE5\u6570\u636E\u66F4\u65B0\u65F6\u95F4" }, "2017-08-08"),
                    React.createElement(Description, null, "\u00A0"),
                    React.createElement(Description, { term: React.createElement("span", null,
                            "\u67D0\u67D0\u6570\u636E",
                            React.createElement(Tooltip, { title: "\u6570\u636E\u8BF4\u660E" },
                                React.createElement(Icon, { style: { color: 'rgba(0, 0, 0, 0.43)', marginLeft: 4 }, type: "info-circle-o" }))) }, "725"),
                    React.createElement(Description, { term: "\u8BE5\u6570\u636E\u66F4\u65B0\u65F6\u95F4" }, "2017-08-08")),
                React.createElement("h4", { style: { marginBottom: 16 } }, "\u4FE1\u606F\u7EC4"),
                React.createElement(Card, { type: "inner", title: "\u591A\u5C42\u7EA7\u4FE1\u606F\u7EC4" },
                    React.createElement(DescriptionList, { size: "small", style: { marginBottom: 16 }, title: "\u7EC4\u540D\u79F0" },
                        React.createElement(Description, { term: "\u8D1F\u8D23\u4EBA" }, "\u6797\u4E1C\u4E1C"),
                        React.createElement(Description, { term: "\u89D2\u8272\u7801" }, "1234567"),
                        React.createElement(Description, { term: "\u6240\u5C5E\u90E8\u95E8" }, "XX\u516C\u53F8 - YY\u90E8"),
                        React.createElement(Description, { term: "\u8FC7\u671F\u65F6\u95F4" }, "2017-08-08"),
                        React.createElement(Description, { term: "\u63CF\u8FF0" }, "\u8FD9\u6BB5\u63CF\u8FF0\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F\u5F88\u957F...")),
                    React.createElement(Divider, { style: { margin: '16px 0' } }),
                    React.createElement(DescriptionList, { size: "small", style: { marginBottom: 16 }, title: "\u7EC4\u540D\u79F0", col: "1" },
                        React.createElement(Description, { term: "\u5B66\u540D" }, "Citrullus lanatus (Thunb.) Matsum. et Nakai\u4E00\u5E74\u751F\u8513\u751F\u85E4\u672C\uFF1B\u830E\u3001\u679D\u7C97\u58EE\uFF0C\u5177\u660E\u663E\u7684\u68F1\u3002\u5377\u987B\u8F83\u7C97..")),
                    React.createElement(Divider, { style: { margin: '16px 0' } }),
                    React.createElement(DescriptionList, { size: "small", title: "\u7EC4\u540D\u79F0" },
                        React.createElement(Description, { term: "\u8D1F\u8D23\u4EBA" }, "\u4ED8\u5C0F\u5C0F"),
                        React.createElement(Description, { term: "\u89D2\u8272\u7801" }, "1234568")))),
            React.createElement(Card, { title: "\u7528\u6237\u8FD1\u534A\u5E74\u6765\u7535\u8BB0\u5F55", style: { marginBottom: 24 }, bordered: false },
                React.createElement("div", { className: styles.noData },
                    React.createElement(Icon, { type: "frown-o" }),
                    "\u6682\u65E0\u6570\u636E")),
            React.createElement(Card, { className: styles.tabsCard, bordered: false, tabList: operationTabList, onTabChange: this.onOperationTabChange }, contentList[operationkey])));
    }
};
__decorate([
    Bind(),
    Debounce(200)
], AdvancedProfile.prototype, "setStepDirection", null);
AdvancedProfile = __decorate([
    connect(({ profile, loading }) => ({
        profile,
        loading: loading.effects['profile/fetchAdvanced'],
    }))
], AdvancedProfile);
export default AdvancedProfile;
//# sourceMappingURL=AdvancedProfile.js.map