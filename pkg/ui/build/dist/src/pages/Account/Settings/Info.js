var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component } from 'react';
import { connect } from 'dva';
import router from 'umi/router';
import { FormattedMessage } from 'umi-plugin-react/locale';
import { Menu } from 'antd';
import GridContent from '@/components/PageHeaderWrapper/GridContent';
import styles from './Info.less';
const { Item } = Menu;
let Info = class Info extends Component {
    constructor(props) {
        super(props);
        this.getmenu = () => {
            const { menuMap } = this.state;
            return Object.keys(menuMap).map(item => React.createElement(Item, { key: item }, menuMap[item]));
        };
        this.getRightTitle = () => {
            const { selectKey, menuMap } = this.state;
            return menuMap[selectKey];
        };
        this.selectKey = ({ key }) => {
            router.push(`/account/settings/${key}`);
            this.setState({
                selectKey: key,
            });
        };
        this.resize = () => {
            if (!this.main) {
                return;
            }
            const { mode: currentMode } = this.state;
            let mode = 'inline';
            const { offsetWidth } = this.main;
            if (offsetWidth > 400 && offsetWidth < 641) {
                mode = 'horizontal';
            }
            if (window.innerWidth < 768 && offsetWidth > 400) {
                mode = 'horizontal';
            }
            if (mode !== currentMode) {
                requestAnimationFrame(() => this.setState({ mode }));
            }
        };
        const { match, location } = props;
        const menuMap = {
            base: React.createElement(FormattedMessage, { id: "app.settings.menuMap.basic", defaultMessage: "Basic Settings" }),
            security: (React.createElement(FormattedMessage, { id: "app.settings.menuMap.security", defaultMessage: "Security Settings" })),
            binding: (React.createElement(FormattedMessage, { id: "app.settings.menuMap.binding", defaultMessage: "Account Binding" })),
            notification: (React.createElement(FormattedMessage, { id: "app.settings.menuMap.notification", defaultMessage: "New Message Notification" })),
        };
        const key = location.pathname.replace(`${match.path}/`, '');
        this.state = {
            mode: 'inline',
            menuMap,
            selectKey: menuMap[key] ? key : 'base',
        };
    }
    static getDerivedStateFromProps(props, state) {
        const { match, location } = props;
        let selectKey = location.pathname.replace(`${match.path}/`, '');
        selectKey = state.menuMap[selectKey] ? selectKey : 'base';
        if (selectKey !== state.selectKey) {
            return { selectKey };
        }
        return null;
    }
    componentDidMount() {
        window.addEventListener('resize', this.resize);
        this.resize();
    }
    componentWillUnmount() {
        window.removeEventListener('resize', this.resize);
    }
    render() {
        const { children, currentUser } = this.props;
        if (!currentUser.userid) {
            return '';
        }
        const { mode, selectKey } = this.state;
        return (React.createElement(GridContent, null,
            React.createElement("div", { className: styles.main, ref: ref => {
                    this.main = ref;
                } },
                React.createElement("div", { className: styles.leftmenu },
                    React.createElement(Menu, { mode: mode, selectedKeys: [selectKey], onClick: this.selectKey }, this.getmenu())),
                React.createElement("div", { className: styles.right },
                    React.createElement("div", { className: styles.title }, this.getRightTitle()),
                    children))));
    }
};
Info = __decorate([
    connect(({ user }) => ({
        currentUser: user.currentUser,
    }))
], Info);
export default Info;
//# sourceMappingURL=Info.js.map