import React, { PureComponent, Fragment } from 'react';
import ReactDOM from 'react-dom';
import { Icon, Tabs, Badge, Spin } from 'antd';
import classNames from 'classnames';
import HeaderDropdown from '../HeaderDropdown';
import List from './NoticeList';
import styles from './index.less';
const { TabPane } = Tabs;
export default class NoticeIcon extends PureComponent {
    constructor() {
        super(...arguments);
        this.state = {
            visible: false,
        };
        this.onItemClick = (item, tabProps) => {
            const { onItemClick } = this.props;
            const { clickClose } = item;
            onItemClick(item, tabProps);
            if (clickClose) {
                this.popover.click();
            }
        };
        this.onClear = name => {
            const { onClear, clearClose } = this.props;
            onClear(name);
            if (clearClose) {
                this.popover.click();
            }
        };
        this.onTabChange = tabType => {
            const { onTabChange } = this.props;
            onTabChange(tabType);
        };
        this.onViewMore = (tabProps, event) => {
            const { onViewMore } = this.props;
            onViewMore(tabProps, event);
        };
        this.handleVisibleChange = visible => {
            const { onPopupVisibleChange } = this.props;
            this.setState({ visible });
            onPopupVisibleChange(visible);
        };
    }
    getNotificationBox() {
        const { children, loading, locale } = this.props;
        if (!children) {
            return null;
        }
        const panes = React.Children.map(children, child => {
            const { list, title, count, emptyText, emptyImage, showClear, showViewMore } = child.props;
            const len = list && list.length ? list.length : 0;
            const msgCount = count || count === 0 ? count : len;
            const localeTitle = locale[title] || title;
            const tabTitle = msgCount > 0 ? `${localeTitle} (${msgCount})` : localeTitle;
            return (React.createElement(TabPane, { tab: tabTitle, key: title },
                React.createElement(List, { data: list, emptyImage: emptyImage, emptyText: emptyText, locale: locale, onClear: () => this.onClear(title), onClick: item => this.onItemClick(item, child.props), onViewMore: event => this.onViewMore(child.props, event), showClear: showClear, showViewMore: showViewMore, title: title })));
        });
        return (React.createElement(Fragment, null,
            React.createElement(Spin, { spinning: loading, delay: 0 },
                React.createElement(Tabs, { className: styles.tabs, onChange: this.onTabChange }, panes))));
    }
    render() {
        const { className, count, popupVisible, bell } = this.props;
        const { visible } = this.state;
        const noticeButtonClass = classNames(className, styles.noticeButton);
        const notificationBox = this.getNotificationBox();
        const NoticeBellIcon = bell || React.createElement(Icon, { type: "bell", className: styles.icon });
        const trigger = (React.createElement("span", { className: classNames(noticeButtonClass, { opened: visible }) },
            React.createElement(Badge, { count: count, style: { boxShadow: 'none' }, className: styles.badge }, NoticeBellIcon)));
        if (!notificationBox) {
            return trigger;
        }
        const popoverProps = {};
        if ('popupVisible' in this.props) {
            popoverProps.visible = popupVisible;
        }
        return (React.createElement(HeaderDropdown, Object.assign({ placement: "bottomRight", overlay: notificationBox, overlayClassName: styles.popover, trigger: ['click'], visible: visible, onVisibleChange: this.handleVisibleChange }, popoverProps, { ref: node => (this.popover = ReactDOM.findDOMNode(node)) }), trigger));
    }
}
NoticeIcon.Tab = TabPane;
NoticeIcon.defaultProps = {
    onItemClick: () => { },
    onPopupVisibleChange: () => { },
    onTabChange: () => { },
    onClear: () => { },
    onViewMore: () => { },
    loading: false,
    clearClose: false,
    locale: {
        emptyText: 'No notifications',
        clear: 'Clear',
        viewMore: 'More',
    },
    emptyImage: 'https://gw.alipayobjects.com/zos/rmsportal/wAhyIChODzsoKIOBHcBk.svg',
};
//# sourceMappingURL=index.js.map