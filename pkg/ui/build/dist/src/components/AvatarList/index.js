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
import { Tooltip, Avatar } from 'antd';
import classNames from 'classnames';
import styles from './index.less';
const avatarSizeToClassName = size => classNames(styles.avatarItem, {
    [styles.avatarItemLarge]: size === 'large',
    [styles.avatarItemSmall]: size === 'small',
    [styles.avatarItemMini]: size === 'mini',
});
const AvatarList = (_a) => {
    var { children, size, maxLength, excessItemsStyle } = _a, other = __rest(_a, ["children", "size", "maxLength", "excessItemsStyle"]);
    const numOfChildren = React.Children.count(children);
    const numToShow = maxLength >= numOfChildren ? numOfChildren : maxLength;
    const childrenWithProps = React.Children.toArray(children)
        .slice(0, numToShow)
        .map(child => React.cloneElement(child, {
        size,
    }));
    if (numToShow < numOfChildren) {
        const cls = avatarSizeToClassName(size);
        childrenWithProps.push(React.createElement("li", { key: "exceed", className: cls },
            React.createElement(Avatar, { size: size, style: excessItemsStyle }, `+${numOfChildren - maxLength}`)));
    }
    return (React.createElement("div", Object.assign({}, other, { className: styles.avatarList }),
        React.createElement("ul", null,
            " ",
            childrenWithProps,
            " ")));
};
const Item = ({ src, size, tips, onClick = () => { } }) => {
    const cls = avatarSizeToClassName(size);
    return (React.createElement("li", { className: cls, onClick: onClick }, tips ? (React.createElement(Tooltip, { title: tips },
        React.createElement(Avatar, { src: src, size: size, style: { cursor: 'pointer' } }))) : (React.createElement(Avatar, { src: src, size: size }))));
};
AvatarList.Item = Item;
export default AvatarList;
//# sourceMappingURL=index.js.map