import React from 'react';
import { formatMessage, FormattedMessage } from 'umi-plugin-react/locale';
import { Button } from 'antd';
import Link from 'umi/link';
import Result from '@/components/Result';
import styles from './RegisterResult.less';
const actions = (React.createElement("div", { className: styles.actions },
    React.createElement("a", { href: "" },
        React.createElement(Button, { size: "large", type: "primary" },
            React.createElement(FormattedMessage, { id: "app.register-result.view-mailbox" }))),
    React.createElement(Link, { to: "/" },
        React.createElement(Button, { size: "large" },
            React.createElement(FormattedMessage, { id: "app.register-result.back-home" })))));
const RegisterResult = ({ location }) => (React.createElement(Result, { className: styles.registerResult, type: "success", title: React.createElement("div", { className: styles.title },
        React.createElement(FormattedMessage, { id: "app.register-result.msg", values: { email: location.state ? location.state.account : 'AntDesign@example.com' } })), description: formatMessage({ id: 'app.register-result.activation-email' }), actions: actions, style: { marginTop: 56 } }));
export default RegisterResult;
//# sourceMappingURL=RegisterResult.js.map