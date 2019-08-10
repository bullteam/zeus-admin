import React from 'react';
import moment from 'moment';
import { Avatar } from 'antd';
import styles from './index.less';
const ArticleListContent = ({ data: { content, updatedAt, avatar, owner, href } }) => (React.createElement("div", { className: styles.listContent },
    React.createElement("div", { className: styles.description }, content),
    React.createElement("div", { className: styles.extra },
        React.createElement(Avatar, { src: avatar, size: "small" }),
        React.createElement("a", { href: href }, owner),
        " \u53D1\u5E03\u5728 ",
        React.createElement("a", { href: href }, href),
        React.createElement("em", null, moment(updatedAt).format('YYYY-MM-DD HH:mm')))));
export default ArticleListContent;
//# sourceMappingURL=index.js.map