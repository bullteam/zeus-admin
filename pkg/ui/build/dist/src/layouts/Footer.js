import React, { Fragment } from 'react';
import { Layout, Icon } from 'antd';
import GlobalFooter from '@/components/GlobalFooter';
const { Footer } = Layout;
const FooterView = () => (React.createElement(Footer, { style: { padding: 0 } },
    React.createElement(GlobalFooter, { links: [
            {
                key: 'ZEUS 权限管理后台',
                title: 'ZEUS 权限管理后台',
                href: 'http://admin.bullteam.cn/login',
                blankTarget: true,
            },
            {
                key: 'github',
                title: React.createElement(Icon, { type: "github" }),
                href: 'https://github.com/bullteam/zeus-admin-ui',
                blankTarget: true,
            },
        ], copyright: React.createElement(Fragment, null,
            "Copyright ",
            React.createElement(Icon, { type: "copyright" }),
            " 2019 \u516C\u725B\u5F00\u6E90\u8054\u76DF") })));
export default FooterView;
//# sourceMappingURL=Footer.js.map