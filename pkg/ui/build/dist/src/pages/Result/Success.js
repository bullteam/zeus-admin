import React, { Fragment } from 'react';
import { formatMessage, FormattedMessage } from 'umi-plugin-react/locale';
import { Button, Row, Col, Icon, Steps, Card } from 'antd';
import Result from '@/components/Result';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
const { Step } = Steps;
const desc1 = (React.createElement("div", { style: {
        fontSize: 12,
        color: 'rgba(0, 0, 0, 0.45)',
        position: 'relative',
        left: 42,
        textAlign: 'left',
    } },
    React.createElement("div", { style: { margin: '8px 0 4px' } },
        React.createElement(FormattedMessage, { id: "app.result.success.step1-operator", defaultMessage: "Qu Lili" }),
        React.createElement(Icon, { style: { marginLeft: 8 }, type: "dingding-o" })),
    React.createElement("div", null, "2016-12-12 12:32")));
const desc2 = (React.createElement("div", { style: { fontSize: 12, position: 'relative', left: 42, textAlign: 'left' } },
    React.createElement("div", { style: { margin: '8px 0 4px' } },
        React.createElement(FormattedMessage, { id: "app.result.success.step2-operator", defaultMessage: "Zhou Maomao" }),
        React.createElement(Icon, { type: "dingding-o", style: { color: '#00A0E9', marginLeft: 8 } })),
    React.createElement("div", null,
        React.createElement("a", { href: "" },
            React.createElement(FormattedMessage, { id: "app.result.success.step2-extra", defaultMessage: "Urge" })))));
const extra = (React.createElement(Fragment, null,
    React.createElement("div", { style: {
            fontSize: 16,
            color: 'rgba(0, 0, 0, 0.85)',
            fontWeight: '500',
            marginBottom: 20,
        } },
        React.createElement(FormattedMessage, { id: "app.result.success.operate-title", defaultMessage: "Project Name" })),
    React.createElement(Row, { style: { marginBottom: 16 } },
        React.createElement(Col, { xs: 24, sm: 12, md: 12, lg: 12, xl: 6 },
            React.createElement("span", { style: { color: 'rgba(0, 0, 0, 0.85)' } },
                React.createElement(FormattedMessage, { id: "app.result.success.operate-id", defaultMessage: "Project ID\uFF1A" })),
            "23421"),
        React.createElement(Col, { xs: 24, sm: 12, md: 12, lg: 12, xl: 6 },
            React.createElement("span", { style: { color: 'rgba(0, 0, 0, 0.85)' } },
                React.createElement(FormattedMessage, { id: "app.result.success.principal", defaultMessage: "Principal\uFF1A" })),
            React.createElement(FormattedMessage, { id: "app.result.success.step1-operator", defaultMessage: "Qu Lili" })),
        React.createElement(Col, { xs: 24, sm: 24, md: 24, lg: 24, xl: 12 },
            React.createElement("span", { style: { color: 'rgba(0, 0, 0, 0.85)' } },
                React.createElement(FormattedMessage, { id: "app.result.success.operate-time", defaultMessage: "Effective time\uFF1A" })),
            "2016-12-12 ~ 2017-12-12")),
    React.createElement(Steps, { style: { marginLeft: -42, width: 'calc(100% + 84px)' }, progressDot: true, current: 1 },
        React.createElement(Step, { title: React.createElement("span", { style: { fontSize: 14 } },
                React.createElement(FormattedMessage, { id: "app.result.success.step1-title", defaultMessage: "Create project" })), description: desc1 }),
        React.createElement(Step, { title: React.createElement("span", { style: { fontSize: 14 } },
                React.createElement(FormattedMessage, { id: "app.result.success.step2-title", defaultMessage: "Departmental preliminary review" })), description: desc2 }),
        React.createElement(Step, { title: React.createElement("span", { style: { fontSize: 14 } },
                React.createElement(FormattedMessage, { id: "app.result.success.step3-title", defaultMessage: "Financial review" })) }),
        React.createElement(Step, { title: React.createElement("span", { style: { fontSize: 14 } },
                React.createElement(FormattedMessage, { id: "app.result.success.step4-title", defaultMessage: "Finish" })) }))));
const actions = (React.createElement(Fragment, null,
    React.createElement(Button, { type: "primary" },
        React.createElement(FormattedMessage, { id: "app.result.success.btn-return", defaultMessage: "Back to list" })),
    React.createElement(Button, null,
        React.createElement(FormattedMessage, { id: "app.result.success.btn-project", defaultMessage: "View project" })),
    React.createElement(Button, null,
        React.createElement(FormattedMessage, { id: "app.result.success.btn-print", defaultMessage: "Print" }))));
export default () => (React.createElement(PageHeaderWrapper, null,
    React.createElement(Card, { bordered: false },
        React.createElement(Result, { type: "success", title: formatMessage({ id: 'app.result.success.title' }), description: formatMessage({ id: 'app.result.success.description' }), extra: extra, actions: actions, style: { marginTop: 48, marginBottom: 16 } }))));
//# sourceMappingURL=Success.js.map