var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) if (e.indexOf(p[i]) < 0)
            t[p[i]] = s[p[i]];
    return t;
};
import React, { PureComponent } from 'react';
import { Dropdown } from 'antd';
import classNames from 'classnames';
import styles from './index.less';
export default class HeaderDropdown extends PureComponent {
    render() {
        const _a = this.props, { overlayClassName } = _a, props = __rest(_a, ["overlayClassName"]);
        return (React.createElement(Dropdown, Object.assign({ overlayClassName: classNames(styles.container, overlayClassName) }, props)));
    }
}
//# sourceMappingURL=index.js.map