var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { connect } from 'dva';
import { Card, Button, Icon, List } from 'antd';
import Ellipsis from '@/components/Ellipsis';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
import styles from './CardList.less';
let CardList = class CardList extends PureComponent {
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
        const { list: { list }, loading, } = this.props;
        const content = (React.createElement("div", { className: styles.pageHeaderContent },
            React.createElement("p", null, "\u6BB5\u843D\u793A\u610F\uFF1A\u8682\u8681\u91D1\u670D\u52A1\u8BBE\u8BA1\u5E73\u53F0 ant.design\uFF0C\u7528\u6700\u5C0F\u7684\u5DE5\u4F5C\u91CF\uFF0C\u65E0\u7F1D\u63A5\u5165\u8682\u8681\u91D1\u670D\u751F\u6001\uFF0C \u63D0\u4F9B\u8DE8\u8D8A\u8BBE\u8BA1\u4E0E\u5F00\u53D1\u7684\u4F53\u9A8C\u89E3\u51B3\u65B9\u6848\u3002"),
            React.createElement("div", { className: styles.contentLink },
                React.createElement("a", null,
                    React.createElement("img", { alt: "", src: "https://gw.alipayobjects.com/zos/rmsportal/MjEImQtenlyueSmVEfUD.svg" }),
                    ' ',
                    "\u5FEB\u901F\u5F00\u59CB"),
                React.createElement("a", null,
                    React.createElement("img", { alt: "", src: "https://gw.alipayobjects.com/zos/rmsportal/NbuDUAuBlIApFuDvWiND.svg" }),
                    ' ',
                    "\u4EA7\u54C1\u7B80\u4ECB"),
                React.createElement("a", null,
                    React.createElement("img", { alt: "", src: "https://gw.alipayobjects.com/zos/rmsportal/ohOEPSYdDTNnyMbGuyLb.svg" }),
                    ' ',
                    "\u4EA7\u54C1\u6587\u6863"))));
        const extraContent = (React.createElement("div", { className: styles.extraImg },
            React.createElement("img", { alt: "\u8FD9\u662F\u4E00\u4E2A\u6807\u9898", src: "https://gw.alipayobjects.com/zos/rmsportal/RzwpdLnhmvDJToTdfDPe.png" })));
        return (React.createElement(PageHeaderWrapper, { title: "\u5361\u7247\u5217\u8868", content: content, extraContent: extraContent },
            React.createElement("div", { className: styles.cardList },
                React.createElement(List, { rowKey: "id", loading: loading, grid: { gutter: 24, lg: 3, md: 2, sm: 1, xs: 1 }, dataSource: ['', ...list], renderItem: item => item ? (React.createElement(List.Item, { key: item.id },
                        React.createElement(Card, { hoverable: true, className: styles.card, actions: [React.createElement("a", null, "\u64CD\u4F5C\u4E00"), React.createElement("a", null, "\u64CD\u4F5C\u4E8C")] },
                            React.createElement(Card.Meta, { avatar: React.createElement("img", { alt: "", className: styles.cardAvatar, src: item.avatar }), title: React.createElement("a", null, item.title), description: React.createElement(Ellipsis, { className: styles.item, lines: 3 }, item.description) })))) : (React.createElement(List.Item, null,
                        React.createElement(Button, { type: "dashed", className: styles.newButton },
                            React.createElement(Icon, { type: "plus" }),
                            " \u65B0\u5EFA\u4EA7\u54C1"))) }))));
    }
};
CardList = __decorate([
    connect(({ list, loading }) => ({
        list,
        loading: loading.models.list,
    }))
], CardList);
export default CardList;
//# sourceMappingURL=CardList.js.map