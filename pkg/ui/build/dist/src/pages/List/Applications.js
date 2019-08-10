var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import numeral from 'numeral';
import { connect } from 'dva';
import { FormattedMessage } from 'umi-plugin-react/locale';
import { Row, Col, Form, Card, Select, Icon, Avatar, List, Tooltip, Dropdown, Menu } from 'antd';
import TagSelect from '@/components/TagSelect';
import StandardFormRow from '@/components/StandardFormRow';
import { formatWan } from '@/utils/utils';
import styles from './Applications.less';
const { Option } = Select;
const FormItem = Form.Item;
let FilterCardList = class FilterCardList extends PureComponent {
    componentDidMount() {
        const { dispatch } = this.props;
        dispatch({
            type: 'list/fetch',
            payload: {
                count: 8,
            },
        });
    }
    render() {
        const { list: { list }, loading, form, } = this.props;
        const { getFieldDecorator } = form;
        const CardInfo = ({ activeUser, newUser }) => (React.createElement("div", { className: styles.cardInfo },
            React.createElement("div", null,
                React.createElement("p", null, "\u6D3B\u8DC3\u7528\u6237"),
                React.createElement("p", null, activeUser)),
            React.createElement("div", null,
                React.createElement("p", null, "\u65B0\u589E\u7528\u6237"),
                React.createElement("p", null, newUser))));
        const formItemLayout = {
            wrapperCol: {
                xs: { span: 24 },
                sm: { span: 16 },
            },
        };
        const actionsTextMap = {
            expandText: React.createElement(FormattedMessage, { id: "component.tagSelect.expand", defaultMessage: "Expand" }),
            collapseText: (React.createElement(FormattedMessage, { id: "component.tagSelect.collapse", defaultMessage: "Collapse" })),
            selectAllText: React.createElement(FormattedMessage, { id: "component.tagSelect.all", defaultMessage: "All" }),
        };
        const itemMenu = (React.createElement(Menu, null,
            React.createElement(Menu.Item, null,
                React.createElement("a", { target: "_blank", rel: "noopener noreferrer", href: "https://www.alipay.com/" }, "1st menu item")),
            React.createElement(Menu.Item, null,
                React.createElement("a", { target: "_blank", rel: "noopener noreferrer", href: "https://www.taobao.com/" }, "2nd menu item")),
            React.createElement(Menu.Item, null,
                React.createElement("a", { target: "_blank", rel: "noopener noreferrer", href: "https://www.tmall.com/" }, "3d menu item"))));
        return (React.createElement("div", { className: styles.filterCardList },
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
                    React.createElement(StandardFormRow, { title: "\u5176\u5B83\u9009\u9879", grid: true, last: true },
                        React.createElement(Row, { gutter: 16 },
                            React.createElement(Col, { lg: 8, md: 10, sm: 10, xs: 24 },
                                React.createElement(FormItem, Object.assign({}, formItemLayout, { label: "\u4F5C\u8005" }), getFieldDecorator('author', {})(React.createElement(Select, { placeholder: "\u4E0D\u9650", style: { maxWidth: 200, width: '100%' } },
                                    React.createElement(Option, { value: "lisa" }, "\u738B\u662D\u541B"))))),
                            React.createElement(Col, { lg: 8, md: 10, sm: 10, xs: 24 },
                                React.createElement(FormItem, Object.assign({}, formItemLayout, { label: "\u597D\u8BC4\u5EA6" }), getFieldDecorator('rate', {})(React.createElement(Select, { placeholder: "\u4E0D\u9650", style: { maxWidth: 200, width: '100%' } },
                                    React.createElement(Option, { value: "good" }, "\u4F18\u79C0"),
                                    React.createElement(Option, { value: "normal" }, "\u666E\u901A"))))))))),
            React.createElement(List, { rowKey: "id", style: { marginTop: 24 }, grid: { gutter: 24, xl: 4, lg: 3, md: 3, sm: 2, xs: 1 }, loading: loading, dataSource: list, renderItem: item => (React.createElement(List.Item, { key: item.id },
                    React.createElement(Card, { hoverable: true, bodyStyle: { paddingBottom: 20 }, actions: [
                            React.createElement(Tooltip, { title: "\u4E0B\u8F7D" },
                                React.createElement(Icon, { type: "download" })),
                            React.createElement(Tooltip, { title: "\u7F16\u8F91" },
                                React.createElement(Icon, { type: "edit" })),
                            React.createElement(Tooltip, { title: "\u5206\u4EAB" },
                                React.createElement(Icon, { type: "share-alt" })),
                            React.createElement(Dropdown, { overlay: itemMenu },
                                React.createElement(Icon, { type: "ellipsis" })),
                        ] },
                        React.createElement(Card.Meta, { avatar: React.createElement(Avatar, { size: "small", src: item.avatar }), title: item.title }),
                        React.createElement("div", { className: styles.cardItemContent },
                            React.createElement(CardInfo, { activeUser: formatWan(item.activeUser), newUser: numeral(item.newUser).format('0,0') }))))) })));
    }
};
FilterCardList = __decorate([
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
                    count: 8,
                },
            });
        },
    })
], FilterCardList);
export default FilterCardList;
//# sourceMappingURL=Applications.js.map