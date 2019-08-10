import React, { Component, Fragment } from 'react';
import { formatMessage, FormattedMessage } from 'umi-plugin-react/locale';
import { List } from 'antd';
// import { getTimeDistance } from '@/utils/utils';
const passwordStrength = {
    strong: (React.createElement("font", { className: "strong" },
        React.createElement(FormattedMessage, { id: "app.settings.security.strong", defaultMessage: "Strong" }))),
    medium: (React.createElement("font", { className: "medium" },
        React.createElement(FormattedMessage, { id: "app.settings.security.medium", defaultMessage: "Medium" }))),
    weak: (React.createElement("font", { className: "weak" },
        React.createElement(FormattedMessage, { id: "app.settings.security.weak", defaultMessage: "Weak" }),
        "Weak")),
};
class SecurityView extends Component {
    constructor() {
        super(...arguments);
        this.getData = () => [
            {
                title: formatMessage({ id: 'app.settings.security.password' }, {}),
                description: (React.createElement(Fragment, null,
                    formatMessage({ id: 'app.settings.security.password-description' }),
                    "\uFF1A",
                    passwordStrength.strong)),
                actions: [
                    React.createElement("a", null,
                        React.createElement(FormattedMessage, { id: "app.settings.security.modify", defaultMessage: "Modify" })),
                ],
            },
            {
                title: formatMessage({ id: 'app.settings.security.phone' }, {}),
                description: `${formatMessage({ id: 'app.settings.security.phone-description' }, {})}：138****8293`,
                actions: [
                    React.createElement("a", null,
                        React.createElement(FormattedMessage, { id: "app.settings.security.modify", defaultMessage: "Modify" })),
                ],
            },
            {
                title: formatMessage({ id: 'app.settings.security.question' }, {}),
                description: formatMessage({ id: 'app.settings.security.question-description' }, {}),
                actions: [
                    React.createElement("a", null,
                        React.createElement(FormattedMessage, { id: "app.settings.security.set", defaultMessage: "Set" })),
                ],
            },
            {
                title: formatMessage({ id: 'app.settings.security.email' }, {}),
                description: `${formatMessage({ id: 'app.settings.security.email-description' }, {})}：ant***sign.com`,
                actions: [
                    React.createElement("a", null,
                        React.createElement(FormattedMessage, { id: "app.settings.security.modify", defaultMessage: "Modify" })),
                ],
            },
            {
                title: formatMessage({ id: 'app.settings.security.mfa' }, {}),
                description: formatMessage({ id: 'app.settings.security.mfa-description' }, {}),
                actions: [
                    React.createElement("a", null,
                        React.createElement(FormattedMessage, { id: "app.settings.security.bind", defaultMessage: "Bind" })),
                ],
            },
        ];
    }
    render() {
        return (React.createElement(Fragment, null,
            React.createElement(List, { itemLayout: "horizontal", dataSource: this.getData(), renderItem: item => (React.createElement(List.Item, { actions: item.actions },
                    React.createElement(List.Item.Meta, { title: item.title, description: item.description }))) })));
    }
}
export default SecurityView;
//# sourceMappingURL=SecurityView.js.map