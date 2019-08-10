import React from 'react';
import { Tooltip, Icon } from 'antd';
import style from './index.less';
const BlockChecbox = ({ value, onChange, list }) => (React.createElement("div", { className: style.blockChecbox, key: value }, list.map(item => (React.createElement(Tooltip, { title: item.title, key: item.key },
    React.createElement("div", { className: style.item, onClick: () => onChange(item.key) },
        React.createElement("img", { src: item.url, alt: item.key }),
        React.createElement("div", { className: style.selectIcon, style: {
                display: value === item.key ? 'block' : 'none',
            } },
            React.createElement(Icon, { type: "check" }))))))));
export default BlockChecbox;
//# sourceMappingURL=BlockCheckbox.js.map