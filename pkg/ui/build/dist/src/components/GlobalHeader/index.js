var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { Icon } from 'antd';
import Link from 'umi/link';
import Debounce from 'lodash-decorators/debounce';
import styles from './index.less';
import RightContent from './RightContent';
export default class GlobalHeader extends PureComponent {
    constructor() {
        super(...arguments);
        this.toggle = () => {
            const { collapsed, onCollapse } = this.props;
            onCollapse(!collapsed);
            this.triggerResizeEvent();
        };
    }
    componentWillUnmount() {
        this.triggerResizeEvent.cancel();
    }
    /* eslint-disable*/
    triggerResizeEvent() {
        // eslint-disable-line
        const event = document.createEvent('HTMLEvents');
        event.initEvent('resize', true, false);
        window.dispatchEvent(event);
    }
    render() {
        const { collapsed, isMobile, logo } = this.props;
        return (React.createElement("div", { className: styles.header },
            isMobile && (React.createElement(Link, { to: "/", className: styles.logo, key: "logo" },
                React.createElement("img", { src: logo, alt: "logo", width: "32" }))),
            React.createElement("span", { className: styles.trigger, onClick: this.toggle },
                React.createElement(Icon, { type: collapsed ? 'menu-unfold' : 'menu-fold' })),
            React.createElement(RightContent, Object.assign({}, this.props))));
    }
}
__decorate([
    Debounce(600)
], GlobalHeader.prototype, "triggerResizeEvent", null);
//# sourceMappingURL=index.js.map