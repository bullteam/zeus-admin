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
import { Button, Form } from 'antd';
import styles from './index.less';
const FormItem = Form.Item;
const LoginSubmit = (_a) => {
    var { className } = _a, rest = __rest(_a, ["className"]);
    const clsString = classNames(styles.submit, className);
    return (React.createElement(FormItem, null,
        React.createElement(Button, Object.assign({ size: "large", className: clsString, type: "primary", htmlType: "submit" }, rest))));
};
export default LoginSubmit;
//# sourceMappingURL=LoginSubmit.js.map