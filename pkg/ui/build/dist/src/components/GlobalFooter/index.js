import React from 'react';
import classNames from 'classnames';
import styles from './index.less';
const GlobalFooter = ({ className, links, copyright }) => {
    const clsString = classNames(styles.globalFooter, className);
    return (React.createElement("footer", { className: clsString },
        links && (React.createElement("div", { className: styles.links }, links.map(link => (React.createElement("a", { key: link.key, title: link.key, target: link.blankTarget ? '_blank' : '_self', href: link.href }, link.title))))),
        copyright && React.createElement("div", { className: styles.copyright }, copyright)));
};
export default GlobalFooter;
//# sourceMappingURL=index.js.map