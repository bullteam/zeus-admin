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
import { Tooltip, Icon } from 'antd';
import { formatMessage } from 'umi-plugin-react/locale';
import styles from './ThemeColor.less';
const Tag = (_a) => {
    var { color, check } = _a, rest = __rest(_a, ["color", "check"]);
    return (React.createElement("div", Object.assign({}, rest, { style: {
            backgroundColor: color,
        } }), check ? React.createElement(Icon, { type: "check" }) : ''));
};
const ThemeColor = ({ colors, title, value, onChange }) => {
    let colorList = colors;
    if (!colors) {
        colorList = [
            {
                key: 'dust',
                color: '#F5222D',
            },
            {
                key: 'volcano',
                color: '#FA541C',
            },
            {
                key: 'sunset',
                color: '#FAAD14',
            },
            {
                key: 'cyan',
                color: '#13C2C2',
            },
            {
                key: 'green',
                color: '#52C41A',
            },
            {
                key: 'daybreak',
                color: '#1890FF',
            },
            {
                key: 'geekblue',
                color: '#2F54EB',
            },
            {
                key: 'purple',
                color: '#722ED1',
            },
        ];
    }
    return (React.createElement("div", { className: styles.themeColor },
        React.createElement("h3", { className: styles.title }, title),
        React.createElement("div", { className: styles.content }, colorList.map(({ key, color }) => (React.createElement(Tooltip, { key: color, title: formatMessage({ id: `app.setting.themecolor.${key}` }) },
            React.createElement(Tag, { className: styles.colorBlock, color: color, check: value === color, onClick: () => onChange && onChange(color) })))))));
};
export default ThemeColor;
//# sourceMappingURL=ThemeColor.js.map