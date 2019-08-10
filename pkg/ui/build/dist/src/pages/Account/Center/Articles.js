var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { List, Icon, Tag } from 'antd';
import { connect } from 'dva';
import ArticleListContent from '@/components/ArticleListContent';
import styles from './Articles.less';
let Center = class Center extends PureComponent {
    render() {
        const { list: { list }, } = this.props;
        const IconText = ({ type, text }) => (React.createElement("span", null,
            React.createElement(Icon, { type: type, style: { marginRight: 8 } }),
            text));
        return (React.createElement(List, { size: "large", className: styles.articleList, rowKey: "id", itemLayout: "vertical", dataSource: list, renderItem: item => (React.createElement(List.Item, { key: item.id, actions: [
                    React.createElement(IconText, { type: "star-o", text: item.star }),
                    React.createElement(IconText, { type: "like-o", text: item.like }),
                    React.createElement(IconText, { type: "message", text: item.message }),
                ] },
                React.createElement(List.Item.Meta, { title: React.createElement("a", { className: styles.listItemMetaTitle, href: item.href }, item.title), description: React.createElement("span", null,
                        React.createElement(Tag, null, "Ant Design"),
                        React.createElement(Tag, null, "\u8BBE\u8BA1\u8BED\u8A00"),
                        React.createElement(Tag, null, "\u8682\u8681\u91D1\u670D")) }),
                React.createElement(ArticleListContent, { data: item }))) }));
    }
};
Center = __decorate([
    connect(({ list }) => ({
        list,
    }))
], Center);
export default Center;
//# sourceMappingURL=Articles.js.map