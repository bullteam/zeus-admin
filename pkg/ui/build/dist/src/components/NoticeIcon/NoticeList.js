import React from 'react';
import { Avatar, List } from 'antd';
import classNames from 'classnames';
import styles from './NoticeList.less';
export default function NoticeList({ data = [], onClick, onClear, title, locale, emptyText, emptyImage, onViewMore = null, showClear = true, showViewMore = false, }) {
    if (data.length === 0) {
        return (React.createElement("div", { className: styles.notFound },
            emptyImage ? React.createElement("img", { src: emptyImage, alt: "not found" }) : null,
            React.createElement("div", null, emptyText || locale.emptyText)));
    }
    return (React.createElement("div", null,
        React.createElement(List, { className: styles.list }, data.map((item, i) => {
            const itemCls = classNames(styles.item, {
                [styles.read]: item.read,
            });
            // eslint-disable-next-line no-nested-ternary
            const leftIcon = item.avatar ? (typeof item.avatar === 'string' ? (React.createElement(Avatar, { className: styles.avatar, src: item.avatar })) : (React.createElement("span", { className: styles.iconElement }, item.avatar))) : null;
            return (React.createElement(List.Item, { className: itemCls, key: item.key || i, onClick: () => onClick(item) },
                React.createElement(List.Item.Meta, { className: styles.meta, avatar: leftIcon, title: React.createElement("div", { className: styles.title },
                        item.title,
                        React.createElement("div", { className: styles.extra }, item.extra)), description: React.createElement("div", null,
                        React.createElement("div", { className: styles.description, title: item.description }, item.description),
                        React.createElement("div", { className: styles.datetime }, item.datetime)) })));
        })),
        React.createElement("div", { className: styles.bottomBar },
            showClear ? (React.createElement("div", { onClick: onClear },
                locale.clear,
                " ",
                locale[title] || title)) : null,
            showViewMore ? React.createElement("div", { onClick: onViewMore }, locale.viewMore) : null)));
}
//# sourceMappingURL=NoticeList.js.map