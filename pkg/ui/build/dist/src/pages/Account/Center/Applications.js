var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { List, Card, Icon, Dropdown, Menu, Avatar, Tooltip } from 'antd';
import numeral from 'numeral';
import { connect } from 'dva';
import { formatWan } from '@/utils/utils';
import stylesApplications from '../../List/Applications.less';
let Center = class Center extends PureComponent {
    render() {
        const { list: { list }, } = this.props;
        const itemMenu = (React.createElement(Menu, null,
            React.createElement(Menu.Item, null,
                React.createElement("a", { target: "_blank", rel: "noopener noreferrer", href: "https://www.alipay.com/" }, "1st menu item")),
            React.createElement(Menu.Item, null,
                React.createElement("a", { target: "_blank", rel: "noopener noreferrer", href: "https://www.taobao.com/" }, "2nd menu item")),
            React.createElement(Menu.Item, null,
                React.createElement("a", { target: "_blank", rel: "noopener noreferrer", href: "https://www.tmall.com/" }, "3d menu item"))));
        const CardInfo = ({ activeUser, newUser }) => (React.createElement("div", { className: stylesApplications.cardInfo },
            React.createElement("div", null,
                React.createElement("p", null, "\u6D3B\u8DC3\u7528\u6237"),
                React.createElement("p", null, activeUser)),
            React.createElement("div", null,
                React.createElement("p", null, "\u65B0\u589E\u7528\u6237"),
                React.createElement("p", null, newUser))));
        return (React.createElement(List, { rowKey: "id", className: stylesApplications.filterCardList, grid: { gutter: 24, xxl: 3, xl: 2, lg: 2, md: 2, sm: 2, xs: 1 }, dataSource: list, renderItem: item => (React.createElement(List.Item, { key: item.id },
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
                    React.createElement("div", { className: stylesApplications.cardItemContent },
                        React.createElement(CardInfo, { activeUser: formatWan(item.activeUser), newUser: numeral(item.newUser).format('0,0') }))))) }));
    }
};
Center = __decorate([
    connect(({ list }) => ({
        list,
    }))
], Center);
export default Center;
//# sourceMappingURL=Applications.js.map