var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) if (e.indexOf(p[i]) < 0)
            t[p[i]] = s[p[i]];
    return t;
};
import React from 'react';
import { FormattedMessage } from 'umi-plugin-react/locale';
import Link from 'umi/link';
import { PageHeader, Tabs, Typography } from 'antd';
import { connect } from 'dva';
import classNames from 'classnames';
import GridContent from './GridContent';
import styles from './index.less';
import MenuContext from '@/layouts/MenuContext';
import { conversionBreadcrumbList } from './breadcrumb';
const { Title } = Typography;
/**
 * render Footer tabList
 * In order to be compatible with the old version of the PageHeader
 * basically all the functions are implemented.
 */
const renderFooter = ({ tabList, tabActiveKey, onTabChange, tabBarExtraContent }) => {
    return tabList && tabList.length ? (React.createElement(Tabs, { className: styles.tabs, activeKey: tabActiveKey, onChange: key => {
            if (onTabChange) {
                onTabChange(key);
            }
        }, tabBarExtraContent: tabBarExtraContent }, tabList.map(item => (React.createElement(Tabs.TabPane, { tab: item.tab, key: item.key }))))) : null;
};
const PageHeaderWrapper = (_a) => {
    var { children, contentWidth, fluid, wrapperClassName, home, top, title, content, logo, extraContent, hiddenBreadcrumb } = _a, restProps = __rest(_a, ["children", "contentWidth", "fluid", "wrapperClassName", "home", "top", "title", "content", "logo", "extraContent", "hiddenBreadcrumb"]);
    return (React.createElement("div", { style: { margin: '-24px -24px 0' }, className: classNames(wrapperClassName, styles.main) },
        top,
        React.createElement(MenuContext.Consumer, null, value => {
            return (React.createElement("div", { className: styles.wrapper },
                React.createElement("div", { className: classNames({
                        [styles.wide]: !fluid && contentWidth === 'Fixed',
                    }) },
                    React.createElement(PageHeader, Object.assign({ title: React.createElement(React.Fragment, null,
                            logo && React.createElement("span", { className: styles.logo }, logo),
                            React.createElement(Title, { level: 4, style: {
                                    marginBottom: 0,
                                    display: 'inline-block',
                                } }, title)), key: "pageheader" }, restProps, { breadcrumb: !hiddenBreadcrumb &&
                            conversionBreadcrumbList(Object.assign({}, value, restProps, (home !== null && {
                                home: React.createElement(FormattedMessage, { id: "menu.home", defaultMessage: "Home" }),
                            }))), className: styles.pageHeader, linkElement: Link, footer: renderFooter(restProps) }),
                        React.createElement("div", { className: styles.detail },
                            React.createElement("div", { className: styles.main },
                                React.createElement("div", { className: styles.row },
                                    content && React.createElement("div", { className: styles.content }, content),
                                    extraContent && React.createElement("div", { className: styles.extraContent }, extraContent))))))));
        }),
        children ? (React.createElement("div", { className: styles['children-content'] },
            React.createElement(GridContent, null, children))) : null));
};
export default connect(({ setting }) => ({
    contentWidth: setting.contentWidth,
}))(PageHeaderWrapper);
//# sourceMappingURL=index.js.map