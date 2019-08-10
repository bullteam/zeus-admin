import React from 'react';
import { Drawer } from 'antd';
import SiderMenu from './SiderMenu';
import { getFlatMenuKeys } from './SiderMenuUtils';
const SiderMenuWrapper = React.memo(props => {
    const { isMobile, menuData, collapsed, onCollapse } = props;
    const flatMenuKeys = getFlatMenuKeys(menuData);
    return isMobile ? (React.createElement(Drawer, { visible: !collapsed, placement: "left", onClose: () => onCollapse(true), style: {
            padding: 0,
            height: '100vh',
        } },
        React.createElement(SiderMenu, Object.assign({}, props, { flatMenuKeys: flatMenuKeys, collapsed: isMobile ? false : collapsed })))) : (React.createElement(SiderMenu, Object.assign({}, props, { flatMenuKeys: flatMenuKeys })));
});
export default SiderMenuWrapper;
//# sourceMappingURL=index.js.map