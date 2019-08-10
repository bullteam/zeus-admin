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
import classNames from 'classnames';
import { Icon } from 'antd';
import styles from './index.less';
export default function Result(_a) {
    var { className, type, title, description, extra, actions } = _a, restProps = __rest(_a, ["className", "type", "title", "description", "extra", "actions"]);
    const iconMap = {
        error: React.createElement(Icon, { className: styles.error, type: "close-circle", theme: "filled" }),
        success: React.createElement(Icon, { className: styles.success, type: "check-circle", theme: "filled" }),
    };
    const clsString = classNames(styles.result, className);
    return (React.createElement("div", Object.assign({ className: clsString }, restProps),
        React.createElement("div", { className: styles.icon }, iconMap[type]),
        React.createElement("div", { className: styles.title }, title),
        description && React.createElement("div", { className: styles.description }, description),
        extra && React.createElement("div", { className: styles.extra }, extra),
        actions && React.createElement("div", { className: styles.actions }, actions)));
}
//# sourceMappingURL=index.js.map