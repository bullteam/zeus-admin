import React, { PureComponent, Suspense } from 'react';
import { Layout } from 'antd';
import classNames from 'classnames';
import Link from 'umi/link';
import styles from './index.less';
import PageLoading from '../PageLoading';
import { getDefaultCollapsedSubMenus } from './SiderMenuUtils';
import { title } from '../../defaultSettings';
const BaseMenu = React.lazy(() => import('./BaseMenu'));
const { Sider } = Layout;
let firstMount = true;
export default class SiderMenu extends PureComponent {
    constructor(props) {
        super(props);
        this.isMainMenu = key => {
            const { menuData } = this.props;
            return menuData.some(item => {
                if (key) {
                    return item.key === key || item.path === key;
                }
                return false;
            });
        };
        this.handleOpenChange = openKeys => {
            const moreThanOne = openKeys.filter(openKey => this.isMainMenu(openKey)).length > 1;
            this.setState({
                openKeys: moreThanOne ? [openKeys.pop()] : [...openKeys],
            });
        };
        this.state = {
            openKeys: getDefaultCollapsedSubMenus(props),
        };
    }
    componentDidMount() {
        firstMount = false;
    }
    static getDerivedStateFromProps(props, state) {
        const { pathname, flatMenuKeysLen } = state;
        if (props.location.pathname !== pathname || props.flatMenuKeys.length !== flatMenuKeysLen) {
            return {
                pathname: props.location.pathname,
                flatMenuKeysLen: props.flatMenuKeys.length,
                openKeys: getDefaultCollapsedSubMenus(props),
            };
        }
        return null;
    }
    render() {
        const { logo, collapsed, onCollapse, fixSiderbar, theme, isMobile } = this.props;
        const { openKeys } = this.state;
        const defaultProps = collapsed ? {} : { openKeys };
        const siderClassName = classNames(styles.sider, {
            [styles.fixSiderBar]: fixSiderbar,
            [styles.light]: theme === 'light',
        });
        return (React.createElement(Sider, { trigger: null, collapsible: true, collapsed: collapsed, breakpoint: "lg", onCollapse: collapse => {
                if (firstMount || !isMobile) {
                    onCollapse(collapse);
                }
            }, width: 256, theme: theme, className: siderClassName },
            React.createElement("div", { className: styles.logo, id: "logo" },
                React.createElement(Link, { to: "/" },
                    React.createElement("img", { src: logo, alt: "logo" }),
                    React.createElement("h1", null, title))),
            React.createElement(Suspense, { fallback: React.createElement(PageLoading, null) },
                React.createElement(BaseMenu, Object.assign({}, this.props, { mode: "inline", handleOpenChange: this.handleOpenChange, onOpenChange: this.handleOpenChange, style: { padding: '16px 0', width: '100%' } }, defaultProps)))));
    }
}
//# sourceMappingURL=SiderMenu.js.map