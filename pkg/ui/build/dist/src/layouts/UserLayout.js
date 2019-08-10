import React, { Component, Fragment } from 'react';
// import { formatMessage } from 'umi-plugin-react/locale';
import { connect } from 'dva';
import Link from 'umi/link';
import { Icon } from 'antd';
import GlobalFooter from '@/components/GlobalFooter';
import DocumentTitle from 'react-document-title';
import SelectLang from '@/components/SelectLang';
import styles from './UserLayout.less';
import logo from '../assets/logo.png';
import getPageTitle from '@/utils/getPageTitle';
const links = [
// {
//   key: 'help',
//   title: formatMessage({ id: 'layout.user.link.help' }),
//   href: '',
// },
// {
//   key: 'privacy',
//   title: formatMessage({ id: 'layout.user.link.privacy' }),
//   href: '',
// },
// {
//   key: 'terms',
//   title: formatMessage({ id: 'layout.user.link.terms' }),
//   href: '',
// },
];
const copyright = (React.createElement(Fragment, null,
    "Copyright ",
    React.createElement(Icon, { type: "copyright" }),
    " 2019 \u516C\u725B\u5F00\u6E90\u8054\u76DF"));
class UserLayout extends Component {
    componentDidMount() {
        const { dispatch, route: { routes, authority }, } = this.props;
        dispatch({
            type: 'menu/getMenuData',
            payload: { routes, authority },
        });
    }
    render() {
        const { children, location: { pathname }, breadcrumbNameMap, } = this.props;
        return (React.createElement(DocumentTitle, { title: getPageTitle(pathname, breadcrumbNameMap) },
            React.createElement("div", { className: styles.container },
                React.createElement("div", { className: styles.lang },
                    React.createElement(SelectLang, null)),
                React.createElement("div", { className: styles.content },
                    React.createElement("div", { className: styles.top },
                        React.createElement("div", { className: styles.header },
                            React.createElement(Link, { to: "/" },
                                React.createElement("img", { alt: "logo", className: styles.logo, src: logo }),
                                React.createElement("span", { className: styles.title }, "ZEUS"))),
                        React.createElement("div", { className: styles.desc }, "\u6743\u9650\u7BA1\u7406\u7CFB\u7EDF")),
                    children),
                React.createElement(GlobalFooter, { links: links, copyright: copyright }))));
    }
}
export default connect(({ menu: menuModel }) => ({
    menuData: menuModel.menuData,
    breadcrumbNameMap: menuModel.breadcrumbNameMap,
}))(UserLayout);
//# sourceMappingURL=UserLayout.js.map