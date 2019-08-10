var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { connect } from 'dva';
import Link from 'umi/link';
import router from 'umi/router';
import { Card, Row, Col, Icon, Avatar, Tag, Divider, Spin, Input } from 'antd';
import GridContent from '@/components/PageHeaderWrapper/GridContent';
import styles from './Center.less';
let Center = class Center extends PureComponent {
    constructor() {
        super(...arguments);
        this.state = {
            newTags: [],
            inputVisible: false,
            inputValue: '',
        };
        this.onTabChange = key => {
            const { match } = this.props;
            switch (key) {
                case 'articles':
                    router.push(`${match.url}/articles`);
                    break;
                case 'applications':
                    router.push(`${match.url}/applications`);
                    break;
                case 'projects':
                    router.push(`${match.url}/projects`);
                    break;
                default:
                    break;
            }
        };
        this.showInput = () => {
            this.setState({ inputVisible: true }, () => this.input.focus());
        };
        this.saveInputRef = input => {
            this.input = input;
        };
        this.handleInputChange = e => {
            this.setState({ inputValue: e.target.value });
        };
        this.handleInputConfirm = () => {
            const { state } = this;
            const { inputValue } = state;
            let { newTags } = state;
            if (inputValue && newTags.filter(tag => tag.label === inputValue).length === 0) {
                newTags = [...newTags, { key: `new-${newTags.length}`, label: inputValue }];
            }
            this.setState({
                newTags,
                inputVisible: false,
                inputValue: '',
            });
        };
    }
    componentDidMount() {
        const { dispatch } = this.props;
        dispatch({
            type: 'user/fetchCurrent',
        });
        dispatch({
            type: 'list/fetch',
            payload: {
                count: 8,
            },
        });
        dispatch({
            type: 'project/fetchNotice',
        });
    }
    render() {
        const { newTags, inputVisible, inputValue } = this.state;
        const { listLoading, currentUser, currentUserLoading, project: { notice }, projectLoading, match, location, children, } = this.props;
        const operationTabList = [
            {
                key: 'articles',
                tab: (React.createElement("span", null,
                    "\u6587\u7AE0 ",
                    React.createElement("span", { style: { fontSize: 14 } }, "(8)"))),
            },
            {
                key: 'applications',
                tab: (React.createElement("span", null,
                    "\u5E94\u7528 ",
                    React.createElement("span", { style: { fontSize: 14 } }, "(8)"))),
            },
            {
                key: 'projects',
                tab: (React.createElement("span", null,
                    "\u9879\u76EE ",
                    React.createElement("span", { style: { fontSize: 14 } }, "(8)"))),
            },
        ];
        return (React.createElement(GridContent, { className: styles.userCenter },
            React.createElement(Row, { gutter: 24 },
                React.createElement(Col, { lg: 7, md: 24 },
                    React.createElement(Card, { bordered: false, style: { marginBottom: 24 }, loading: currentUserLoading }, currentUser && Object.keys(currentUser).length ? (React.createElement("div", null,
                        React.createElement("div", { className: styles.avatarHolder },
                            React.createElement("img", { alt: "", src: currentUser.avatar }),
                            React.createElement("div", { className: styles.name }, currentUser.name),
                            React.createElement("div", null, currentUser.signature)),
                        React.createElement("div", { className: styles.detail },
                            React.createElement("p", null,
                                React.createElement("i", { className: styles.title }),
                                currentUser.title),
                            React.createElement("p", null,
                                React.createElement("i", { className: styles.group }),
                                currentUser.group),
                            React.createElement("p", null,
                                React.createElement("i", { className: styles.address }),
                                currentUser.geographic.province.label,
                                currentUser.geographic.city.label)),
                        React.createElement(Divider, { dashed: true }),
                        React.createElement("div", { className: styles.tags },
                            React.createElement("div", { className: styles.tagsTitle }, "\u6807\u7B7E"),
                            currentUser.tags.concat(newTags).map(item => (React.createElement(Tag, { key: item.key }, item.label))),
                            inputVisible && (React.createElement(Input, { ref: this.saveInputRef, type: "text", size: "small", style: { width: 78 }, value: inputValue, onChange: this.handleInputChange, onBlur: this.handleInputConfirm, onPressEnter: this.handleInputConfirm })),
                            !inputVisible && (React.createElement(Tag, { onClick: this.showInput, style: { background: '#fff', borderStyle: 'dashed' } },
                                React.createElement(Icon, { type: "plus" })))),
                        React.createElement(Divider, { style: { marginTop: 16 }, dashed: true }),
                        React.createElement("div", { className: styles.team },
                            React.createElement("div", { className: styles.teamTitle }, "\u56E2\u961F"),
                            React.createElement(Spin, { spinning: projectLoading },
                                React.createElement(Row, { gutter: 36 }, notice.map(item => (React.createElement(Col, { key: item.id, lg: 24, xl: 12 },
                                    React.createElement(Link, { to: item.href },
                                        React.createElement(Avatar, { size: "small", src: item.logo }),
                                        item.member))))))))) : ('loading...'))),
                React.createElement(Col, { lg: 17, md: 24 },
                    React.createElement(Card, { className: styles.tabsCard, bordered: false, tabList: operationTabList, activeTabKey: location.pathname.replace(`${match.path}/`, ''), onTabChange: this.onTabChange, loading: listLoading }, children)))));
    }
};
Center = __decorate([
    connect(({ loading, user, project }) => ({
        listLoading: loading.effects['list/fetch'],
        currentUser: user.currentUser,
        currentUserLoading: loading.effects['user/fetchCurrent'],
        project,
        projectLoading: loading.effects['project/fetchNotice'],
    }))
], Center);
export default Center;
//# sourceMappingURL=Center.js.map