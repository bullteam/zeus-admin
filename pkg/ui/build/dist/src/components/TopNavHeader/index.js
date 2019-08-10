import React, { PureComponent } from 'react';
import Link from 'umi/link';
import RightContent from '../GlobalHeader/RightContent';
import BaseMenu from '../SiderMenu/BaseMenu';
import { getFlatMenuKeys } from '../SiderMenu/SiderMenuUtils';
import styles from './index.less';
import { title } from '../../defaultSettings';
export default class TopNavHeader extends PureComponent {
    constructor() {
        super(...arguments);
        this.state = {
            maxWidth: undefined,
        };
    }
    static getDerivedStateFromProps(props) {
        return {
            maxWidth: (props.contentWidth === 'Fixed' && window.innerWidth > 1200 ? 1200 : window.innerWidth) -
                280 -
                120 -
                40,
        };
    }
    render() {
        const { theme, contentWidth, menuData, logo } = this.props;
        const { maxWidth } = this.state;
        const flatMenuKeys = getFlatMenuKeys(menuData);
        return (React.createElement("div", { className: `${styles.head} ${theme === 'light' ? styles.light : ''}` },
            React.createElement("div", { ref: ref => {
                    this.maim = ref;
                }, className: `${styles.main} ${contentWidth === 'Fixed' ? styles.wide : ''}` },
                React.createElement("div", { className: styles.left },
                    React.createElement("div", { className: styles.logo, key: "logo", id: "logo" },
                        React.createElement(Link, { to: "/" },
                            React.createElement("img", { src: logo, alt: "logo" }),
                            React.createElement("h1", null, title))),
                    React.createElement("div", { style: {
                            maxWidth,
                        } },
                        React.createElement(BaseMenu, Object.assign({}, this.props, { flatMenuKeys: flatMenuKeys, className: styles.menu })))),
                React.createElement(RightContent, Object.assign({}, this.props)))));
    }
}
//# sourceMappingURL=index.js.map