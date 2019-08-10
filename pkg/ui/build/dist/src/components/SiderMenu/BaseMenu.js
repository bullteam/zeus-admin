import React, { PureComponent } from 'react';
import classNames from 'classnames';
import { Menu, Icon } from 'antd';
import Link from 'umi/link';
import { urlToList } from '../_utils/pathTools';
import { getMenuMatches } from './SiderMenuUtils';
import { isUrl } from '@/utils/utils';
import styles from './index.less';
import IconFont from '@/components/IconFont';
const { SubMenu } = Menu;
// Allow menu.js config icon as string or ReactNode
//   icon: 'setting',
//   icon: 'icon-geren' #For Iconfont ,
//   icon: 'http://demo.com/icon.png',
//   icon: <Icon type="setting" />,
const getIcon = icon => {
    if (typeof icon === 'string') {
        if (isUrl(icon)) {
            return React.createElement(Icon, { component: () => React.createElement("img", { src: icon, alt: "icon", className: styles.icon }) });
        }
        if (icon.startsWith('icon-')) {
            return React.createElement(IconFont, { type: icon });
        }
        return React.createElement(Icon, { type: icon });
    }
    return icon;
};
export default class BaseMenu extends PureComponent {
    constructor() {
        super(...arguments);
        /**
         * 获得菜单子节点
         * @memberof SiderMenu
         */
        this.getNavMenuItems = menusData => {
            if (!menusData) {
                return [];
            }
            return menusData
                .filter(item => item.name && !item.hideInMenu)
                .map(item => this.getSubMenuOrItem(item))
                .filter(item => item);
        };
        // Get the currently selected menu
        this.getSelectedMenuKeys = pathname => {
            const { flatMenuKeys } = this.props;
            return urlToList(pathname).map(itemPath => getMenuMatches(flatMenuKeys, itemPath).pop());
        };
        /**
         * get SubMenu or Item
         */
        this.getSubMenuOrItem = item => {
            // doc: add hideChildrenInMenu
            if (item.children && !item.hideChildrenInMenu && item.children.some(child => child.name)) {
                const { name } = item;
                return (React.createElement(SubMenu, { title: item.icon ? (React.createElement("span", null,
                        getIcon(item.icon),
                        React.createElement("span", null, name))) : (name), key: item.path }, this.getNavMenuItems(item.children)));
            }
            return React.createElement(Menu.Item, { key: item.path }, this.getMenuItemPath(item));
        };
        /**
         * 判断是否是http链接.返回 Link 或 a
         * Judge whether it is http link.return a or Link
         * @memberof SiderMenu
         */
        this.getMenuItemPath = item => {
            const { name } = item;
            const itemPath = this.conversionPath(item.path);
            const icon = getIcon(item.icon);
            const { target } = item;
            // Is it a http link
            if (/^https?:\/\//.test(itemPath)) {
                return (React.createElement("a", { href: itemPath, target: target },
                    icon,
                    React.createElement("span", null, name)));
            }
            const { location, isMobile, onCollapse } = this.props;
            return (React.createElement(Link, { to: itemPath, target: target, replace: itemPath === location.pathname, onClick: isMobile
                    ? () => {
                        onCollapse(true);
                    }
                    : undefined },
                icon,
                React.createElement("span", null, name)));
        };
        this.conversionPath = path => {
            if (path && path.indexOf('http') === 0) {
                return path;
            }
            return `/${path || ''}`.replace(/\/+/g, '/');
        };
        this.getPopupContainer = (fixedHeader, layout) => {
            if (fixedHeader && layout === 'topmenu') {
                return this.wrap;
            }
            return document.body;
        };
        this.getRef = ref => {
            this.wrap = ref;
        };
    }
    render() {
        const { openKeys, theme, mode, location: { pathname }, className, collapsed, fixedHeader, layout, } = this.props;
        // if pathname can't match, use the nearest parent's key
        let selectedKeys = this.getSelectedMenuKeys(pathname);
        if (!selectedKeys.length && openKeys) {
            selectedKeys = [openKeys[openKeys.length - 1]];
        }
        let props = {};
        if (openKeys && !collapsed) {
            props = {
                openKeys: openKeys.length === 0 ? [...selectedKeys] : openKeys,
            };
        }
        const { handleOpenChange, style, menuData } = this.props;
        const cls = classNames(className, {
            'top-nav-menu': mode === 'horizontal',
        });
        return (React.createElement(React.Fragment, null,
            React.createElement(Menu, Object.assign({ key: "Menu", mode: mode, theme: theme, onOpenChange: handleOpenChange, selectedKeys: selectedKeys, style: style, className: cls }, props, { getPopupContainer: () => this.getPopupContainer(fixedHeader, layout) }), this.getNavMenuItems(menuData)),
            React.createElement("div", { ref: this.getRef })));
    }
}
//# sourceMappingURL=BaseMenu.js.map