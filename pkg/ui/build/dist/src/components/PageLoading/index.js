import React from 'react';
import { Spin } from 'antd';
// loading components from code split
// https://umijs.org/plugin/umi-plugin-react.html#dynamicimport
export default () => (React.createElement("div", { style: { paddingTop: 100, textAlign: 'center' } },
    React.createElement(Spin, { size: "large" })));
//# sourceMappingURL=index.js.map