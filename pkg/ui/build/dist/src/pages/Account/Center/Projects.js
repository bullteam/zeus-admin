var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { List, Card } from 'antd';
import moment from 'moment';
import { connect } from 'dva';
import AvatarList from '@/components/AvatarList';
import stylesProjects from '../../List/Projects.less';
let Center = class Center extends PureComponent {
    render() {
        const { list: { list }, } = this.props;
        return (React.createElement(List, { className: stylesProjects.coverCardList, rowKey: "id", grid: { gutter: 24, xxl: 3, xl: 2, lg: 2, md: 2, sm: 2, xs: 1 }, dataSource: list, renderItem: item => (React.createElement(List.Item, null,
                React.createElement(Card, { className: stylesProjects.card, hoverable: true, cover: React.createElement("img", { alt: item.title, src: item.cover }) },
                    React.createElement(Card.Meta, { title: React.createElement("a", null, item.title), description: item.subDescription }),
                    React.createElement("div", { className: stylesProjects.cardItemContent },
                        React.createElement("span", null, moment(item.updatedAt).fromNow()),
                        React.createElement("div", { className: stylesProjects.avatarList },
                            React.createElement(AvatarList, { size: "mini" }, item.members.map(member => (React.createElement(AvatarList.Item, { key: `${item.id}-avatar-${member.id}`, src: member.avatar, tips: member.name }))))))))) }));
    }
};
Center = __decorate([
    connect(({ list }) => ({
        list,
    }))
], Center);
export default Center;
//# sourceMappingURL=Projects.js.map