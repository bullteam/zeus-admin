import React, { PureComponent } from 'react';
import { FormattedMessage, formatMessage } from 'umi-plugin-react/locale';
import { Spin, Tag, Menu, Icon, Avatar, Tooltip, message } from 'antd';
import moment from 'moment';
import groupBy from 'lodash/groupBy';
import NoticeIcon from '../NoticeIcon';
import HeaderSearch from '../HeaderSearch';
import HeaderDropdown from '../HeaderDropdown';
import SelectLang from '../SelectLang';
import styles from './index.less';
export default class GlobalHeaderRight extends PureComponent {
    constructor() {
        super(...arguments);
        this.getUnreadData = noticeData => {
            const unreadMsg = {};
            Object.entries(noticeData).forEach(([key, value]) => {
                if (!unreadMsg[key]) {
                    unreadMsg[key] = 0;
                }
                if (Array.isArray(value)) {
                    unreadMsg[key] = value.filter(item => !item.read).length;
                }
            });
            return unreadMsg;
        };
        this.changeReadState = clickedItem => {
            const { id } = clickedItem;
            const { dispatch } = this.props;
            dispatch({
                type: 'global/changeNoticeReadState',
                payload: id,
            });
        };
    }
    getNoticeData() {
        const { notices = [] } = this.props;
        if (notices.length === 0) {
            return {};
        }
        const newNotices = notices.map(notice => {
            const newNotice = Object.assign({}, notice);
            if (newNotice.datetime) {
                newNotice.datetime = moment(notice.datetime).fromNow();
            }
            if (newNotice.id) {
                newNotice.key = newNotice.id;
            }
            if (newNotice.extra && newNotice.status) {
                const color = {
                    todo: '',
                    processing: 'blue',
                    urgent: 'red',
                    doing: 'gold',
                }[newNotice.status];
                newNotice.extra = (React.createElement(Tag, { color: color, style: { marginRight: 0 } }, newNotice.extra));
            }
            return newNotice;
        });
        return groupBy(newNotices, 'type');
    }
    render() {
        const { currentUser, fetchingNotices, onNoticeVisibleChange, onMenuClick, onNoticeClear, theme, } = this.props;
        const menu = (React.createElement(Menu, { className: styles.menu, selectedKeys: [], onClick: onMenuClick },
            React.createElement(Menu.Item, { key: "userCenter" },
                React.createElement(Icon, { type: "user" }),
                React.createElement(FormattedMessage, { id: "menu.account.center", defaultMessage: "account center" })),
            React.createElement(Menu.Item, { key: "userinfo" },
                React.createElement(Icon, { type: "setting" }),
                React.createElement(FormattedMessage, { id: "menu.account.settings", defaultMessage: "account settings" })),
            React.createElement(Menu.Item, { key: "triggerError" },
                React.createElement(Icon, { type: "close-circle" }),
                React.createElement(FormattedMessage, { id: "menu.account.trigger", defaultMessage: "Trigger Error" })),
            React.createElement(Menu.Divider, null),
            React.createElement(Menu.Item, { key: "logout" },
                React.createElement(Icon, { type: "logout" }),
                React.createElement(FormattedMessage, { id: "menu.account.logout", defaultMessage: "logout" }))));
        const noticeData = this.getNoticeData();
        const unreadMsg = this.getUnreadData(noticeData);
        let className = styles.right;
        if (theme === 'dark') {
            className = `${styles.right}  ${styles.dark}`;
        }
        return (React.createElement("div", { className: className },
            React.createElement(HeaderSearch, { className: `${styles.action} ${styles.search}`, placeholder: formatMessage({ id: 'component.globalHeader.search' }), dataSource: [
                    formatMessage({ id: 'component.globalHeader.search.example1' }),
                    formatMessage({ id: 'component.globalHeader.search.example2' }),
                    formatMessage({ id: 'component.globalHeader.search.example3' }),
                ], onSearch: value => {
                    console.log('input', value); // eslint-disable-line
                }, onPressEnter: value => {
                    console.log('enter', value); // eslint-disable-line
                } }),
            React.createElement(Tooltip, { title: formatMessage({ id: 'component.globalHeader.help' }) },
                React.createElement("a", { target: "_blank", href: "https://pro.ant.design/docs/getting-started", rel: "noopener noreferrer", className: styles.action },
                    React.createElement(Icon, { type: "question-circle-o" }))),
            React.createElement(NoticeIcon, { className: styles.action, count: currentUser.unreadCount, onItemClick: (item, tabProps) => {
                    console.log(item, tabProps); // eslint-disable-line
                    this.changeReadState(item, tabProps);
                }, loading: fetchingNotices, locale: {
                    emptyText: formatMessage({ id: 'component.noticeIcon.empty' }),
                    clear: formatMessage({ id: 'component.noticeIcon.clear' }),
                    viewMore: formatMessage({ id: 'component.noticeIcon.view-more' }),
                    notification: formatMessage({ id: 'component.globalHeader.notification' }),
                    message: formatMessage({ id: 'component.globalHeader.message' }),
                    event: formatMessage({ id: 'component.globalHeader.event' }),
                }, onClear: onNoticeClear, onPopupVisibleChange: onNoticeVisibleChange, onViewMore: () => message.info('Click on view more'), clearClose: true },
                React.createElement(NoticeIcon.Tab, { count: unreadMsg.notification, list: noticeData.notification, title: "notification", emptyText: formatMessage({ id: 'component.globalHeader.notification.empty' }), emptyImage: "https://gw.alipayobjects.com/zos/rmsportal/wAhyIChODzsoKIOBHcBk.svg", showViewMore: true }),
                React.createElement(NoticeIcon.Tab, { count: unreadMsg.message, list: noticeData.message, title: "message", emptyText: formatMessage({ id: 'component.globalHeader.message.empty' }), emptyImage: "https://gw.alipayobjects.com/zos/rmsportal/sAuJeJzSKbUmHfBQRzmZ.svg", showViewMore: true }),
                React.createElement(NoticeIcon.Tab, { count: unreadMsg.event, list: noticeData.event, title: "event", emptyText: formatMessage({ id: 'component.globalHeader.event.empty' }), emptyImage: "https://gw.alipayobjects.com/zos/rmsportal/HsIsxMZiWKrNUavQUXqx.svg", showViewMore: true })),
            currentUser.name ? (React.createElement(HeaderDropdown, { overlay: menu },
                React.createElement("span", { className: `${styles.action} ${styles.account}` },
                    React.createElement(Avatar, { size: "small", className: styles.avatar, src: currentUser.avatar, alt: "avatar" }),
                    React.createElement("span", { className: styles.name }, currentUser.name)))) : (React.createElement(Spin, { size: "small", style: { marginLeft: 8, marginRight: 8 } })),
            React.createElement(SelectLang, { className: styles.action })));
    }
}
//# sourceMappingURL=RightContent.js.map