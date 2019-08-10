import React, { Component, Fragment } from 'react';
import { formatMessage, FormattedMessage } from 'umi-plugin-react/locale';
import { Icon, List } from 'antd';
class BindingView extends Component {
    constructor() {
        super(...arguments);
        this.getData = () => [
            {
                title: formatMessage({ id: 'app.settings.binding.taobao' }, {}),
                description: formatMessage({ id: 'app.settings.binding.taobao-description' }, {}),
                actions: [
                    React.createElement("a", null,
                        React.createElement(FormattedMessage, { id: "app.settings.binding.bind", defaultMessage: "Bind" })),
                ],
                avatar: React.createElement(Icon, { type: "taobao", className: "taobao" }),
            },
            {
                title: formatMessage({ id: 'app.settings.binding.alipay' }, {}),
                description: formatMessage({ id: 'app.settings.binding.alipay-description' }, {}),
                actions: [
                    React.createElement("a", null,
                        React.createElement(FormattedMessage, { id: "app.settings.binding.bind", defaultMessage: "Bind" })),
                ],
                avatar: React.createElement(Icon, { type: "alipay", className: "alipay" }),
            },
            {
                title: formatMessage({ id: 'app.settings.binding.dingding' }, {}),
                description: formatMessage({ id: 'app.settings.binding.dingding-description' }, {}),
                actions: [
                    React.createElement("a", null,
                        React.createElement(FormattedMessage, { id: "app.settings.binding.bind", defaultMessage: "Bind" })),
                ],
                avatar: React.createElement(Icon, { type: "dingding", className: "dingding" }),
            },
        ];
    }
    render() {
        return (React.createElement(Fragment, null,
            React.createElement(List, { itemLayout: "horizontal", dataSource: this.getData(), renderItem: item => (React.createElement(List.Item, { actions: item.actions },
                    React.createElement(List.Item.Meta, { avatar: item.avatar, title: item.title, description: item.description }))) })));
    }
}
export default BindingView;
//# sourceMappingURL=BindingView.js.map