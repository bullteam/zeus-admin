import React, { Fragment } from 'react';
import { formatMessage, FormattedMessage } from 'umi-plugin-react/locale';
import { Button, Icon, Card } from 'antd';
import Result from '@/components/Result';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
const extra = (React.createElement(Fragment, null,
    React.createElement("div", { style: {
            fontSize: 16,
            color: 'rgba(0, 0, 0, 0.85)',
            fontWeight: '500',
            marginBottom: 16,
        } },
        React.createElement(FormattedMessage, { id: "app.result.error.hint-title", defaultMessage: "The content you submitted has the following error:" })),
    React.createElement("div", { style: { marginBottom: 16 } },
        React.createElement(Icon, { style: { color: '#f5222d', marginRight: 8 }, type: "close-circle-o" }),
        React.createElement(FormattedMessage, { id: "app.result.error.hint-text1", defaultMessage: "Your account has been frozen" }),
        React.createElement("a", { style: { marginLeft: 16 } },
            React.createElement(FormattedMessage, { id: "app.result.error.hint-btn1", defaultMessage: "Thaw immediately" }),
            React.createElement(Icon, { type: "right" }))),
    React.createElement("div", null,
        React.createElement(Icon, { style: { color: '#f5222d', marginRight: 8 }, type: "close-circle-o" }),
        React.createElement(FormattedMessage, { id: "app.result.error.hint-text2", defaultMessage: "Your account is not yet eligible to apply" }),
        React.createElement("a", { style: { marginLeft: 16 } },
            React.createElement(FormattedMessage, { id: "app.result.error.hint-btn2", defaultMessage: "Upgrade immediately" }),
            React.createElement(Icon, { type: "right" })))));
const actions = (React.createElement(Button, { type: "primary" },
    React.createElement(FormattedMessage, { id: "app.result.error.btn-text", defaultMessage: "Return to modify" })));
export default () => (React.createElement(PageHeaderWrapper, null,
    React.createElement(Card, { bordered: false },
        React.createElement(Result, { type: "error", title: formatMessage({ id: 'app.result.error.title' }), description: formatMessage({ id: 'app.result.error.description' }), extra: extra, actions: actions, style: { marginTop: 48, marginBottom: 16 } }))));
//# sourceMappingURL=Error.js.map