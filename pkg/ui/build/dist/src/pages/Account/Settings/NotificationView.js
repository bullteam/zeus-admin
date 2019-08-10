import React, { Component, Fragment } from 'react';
import { formatMessage } from 'umi-plugin-react/locale';
import { Switch, List } from 'antd';
class NotificationView extends Component {
    constructor() {
        super(...arguments);
        this.getData = () => {
            const Action = (React.createElement(Switch, { checkedChildren: formatMessage({ id: 'app.settings.open' }), unCheckedChildren: formatMessage({ id: 'app.settings.close' }), defaultChecked: true }));
            return [
                {
                    title: formatMessage({ id: 'app.settings.notification.password' }, {}),
                    description: formatMessage({ id: 'app.settings.notification.password-description' }, {}),
                    actions: [Action],
                },
                {
                    title: formatMessage({ id: 'app.settings.notification.messages' }, {}),
                    description: formatMessage({ id: 'app.settings.notification.messages-description' }, {}),
                    actions: [Action],
                },
                {
                    title: formatMessage({ id: 'app.settings.notification.todo' }, {}),
                    description: formatMessage({ id: 'app.settings.notification.todo-description' }, {}),
                    actions: [Action],
                },
            ];
        };
    }
    render() {
        return (React.createElement(Fragment, null,
            React.createElement(List, { itemLayout: "horizontal", dataSource: this.getData(), renderItem: item => (React.createElement(List.Item, { actions: item.actions },
                    React.createElement(List.Item.Meta, { title: item.title, description: item.description }))) })));
    }
}
export default NotificationView;
//# sourceMappingURL=NotificationView.js.map