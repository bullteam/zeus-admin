var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) if (e.indexOf(p[i]) < 0)
            t[p[i]] = s[p[i]];
    return t;
};
import React, { createElement } from 'react';
import classNames from 'classnames';
import { Button } from 'antd';
import config from './typeConfig';
import styles from './index.less';
class Exception extends React.PureComponent {
    constructor(props) {
        super(props);
        this.state = {};
    }
    render() {
        const _a = this.props, { className, backText, linkElement = 'a', type, title, desc, img, actions, redirect } = _a, rest = __rest(_a, ["className", "backText", "linkElement", "type", "title", "desc", "img", "actions", "redirect"]);
        const pageType = type in config ? type : '404';
        const clsString = classNames(styles.exception, className);
        return (React.createElement("div", Object.assign({ className: clsString }, rest),
            React.createElement("div", { className: styles.imgBlock },
                React.createElement("div", { className: styles.imgEle, style: { backgroundImage: `url(${img || config[pageType].img})` } })),
            React.createElement("div", { className: styles.content },
                React.createElement("h1", null, title || config[pageType].title),
                React.createElement("div", { className: styles.desc }, desc || config[pageType].desc),
                React.createElement("div", { className: styles.actions }, actions ||
                    createElement(linkElement, {
                        to: redirect,
                        href: redirect,
                    }, React.createElement(Button, { type: "primary" }, backText))))));
    }
}
Exception.defaultProps = {
    backText: 'back to home',
    redirect: '/',
};
export default Exception;
//# sourceMappingURL=index.js.map