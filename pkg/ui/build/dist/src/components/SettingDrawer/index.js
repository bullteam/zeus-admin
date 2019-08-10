var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component } from 'react';
import { Select, message, Drawer, List, Switch, Divider, Icon, Button, Alert, Tooltip } from 'antd';
import { formatMessage } from 'umi-plugin-react/locale';
import { CopyToClipboard } from 'react-copy-to-clipboard';
import { connect } from 'dva';
import omit from 'omit.js';
import styles from './index.less';
import ThemeColor from './ThemeColor';
import BlockCheckbox from './BlockCheckbox';
const { Option } = Select;
const Body = ({ children, title, style }) => (React.createElement("div", { style: Object.assign({}, style, { marginBottom: 24 }) },
    React.createElement("h3", { className: styles.title }, title),
    children));
let SettingDrawer = class SettingDrawer extends Component {
    constructor() {
        super(...arguments);
        this.state = {
            collapse: false,
        };
        this.getLayoutSetting = () => {
            const { setting: { contentWidth, fixedHeader, layout, autoHideHeader, fixSiderbar }, } = this.props;
            return [
                {
                    title: formatMessage({ id: 'app.setting.content-width' }),
                    action: (React.createElement(Select, { value: contentWidth, size: "small", onSelect: value => this.changeSetting('contentWidth', value), style: { width: 80 } },
                        layout === 'sidemenu' ? null : (React.createElement(Option, { value: "Fixed" }, formatMessage({ id: 'app.setting.content-width.fixed' }))),
                        React.createElement(Option, { value: "Fluid" }, formatMessage({ id: 'app.setting.content-width.fluid' })))),
                },
                {
                    title: formatMessage({ id: 'app.setting.fixedheader' }),
                    action: (React.createElement(Switch, { size: "small", checked: !!fixedHeader, onChange: checked => this.changeSetting('fixedHeader', checked) })),
                },
                {
                    title: formatMessage({ id: 'app.setting.hideheader' }),
                    disabled: !fixedHeader,
                    disabledReason: formatMessage({ id: 'app.setting.hideheader.hint' }),
                    action: (React.createElement(Switch, { size: "small", checked: !!autoHideHeader, onChange: checked => this.changeSetting('autoHideHeader', checked) })),
                },
                {
                    title: formatMessage({ id: 'app.setting.fixedsidebar' }),
                    disabled: layout === 'topmenu',
                    disabledReason: formatMessage({ id: 'app.setting.fixedsidebar.hint' }),
                    action: (React.createElement(Switch, { size: "small", checked: !!fixSiderbar, onChange: checked => this.changeSetting('fixSiderbar', checked) })),
                },
            ];
        };
        this.changeSetting = (key, value) => {
            const { setting } = this.props;
            const nextState = Object.assign({}, setting);
            nextState[key] = value;
            if (key === 'layout') {
                nextState.contentWidth = value === 'topmenu' ? 'Fixed' : 'Fluid';
            }
            else if (key === 'fixedHeader' && !value) {
                nextState.autoHideHeader = false;
            }
            this.setState(nextState, () => {
                const { dispatch } = this.props;
                dispatch({
                    type: 'setting/changeSetting',
                    payload: this.state,
                });
            });
        };
        this.togglerContent = () => {
            const { collapse } = this.state;
            this.setState({ collapse: !collapse });
        };
        this.renderLayoutSettingItem = item => {
            const action = React.cloneElement(item.action, {
                disabled: item.disabled,
            });
            return (React.createElement(Tooltip, { title: item.disabled ? item.disabledReason : '', placement: "left" },
                React.createElement(List.Item, { actions: [action] },
                    React.createElement("span", { style: { opacity: item.disabled ? '0.5' : '' } }, item.title))));
        };
    }
    render() {
        const { setting } = this.props;
        const { navTheme, primaryColor, layout, colorWeak } = setting;
        const { collapse } = this.state;
        return (React.createElement(Drawer, { visible: collapse, width: 300, onClose: this.togglerContent, placement: "right", handler: React.createElement("div", { className: styles.handle, onClick: this.togglerContent },
                React.createElement(Icon, { type: collapse ? 'close' : 'setting', style: {
                        color: '#fff',
                        fontSize: 20,
                    } })), style: {
                zIndex: 999,
            } },
            React.createElement("div", { className: styles.content },
                React.createElement(Body, { title: formatMessage({ id: 'app.setting.pagestyle' }) },
                    React.createElement(BlockCheckbox, { list: [
                            {
                                key: 'dark',
                                url: 'https://gw.alipayobjects.com/zos/rmsportal/LCkqqYNmvBEbokSDscrm.svg',
                                title: formatMessage({ id: 'app.setting.pagestyle.dark' }),
                            },
                            {
                                key: 'light',
                                url: 'https://gw.alipayobjects.com/zos/rmsportal/jpRkZQMyYRryryPNtyIC.svg',
                                title: formatMessage({ id: 'app.setting.pagestyle.light' }),
                            },
                        ], value: navTheme, onChange: value => this.changeSetting('navTheme', value) })),
                React.createElement(ThemeColor, { title: formatMessage({ id: 'app.setting.themecolor' }), value: primaryColor, onChange: color => this.changeSetting('primaryColor', color) }),
                React.createElement(Divider, null),
                React.createElement(Body, { title: formatMessage({ id: 'app.setting.navigationmode' }) },
                    React.createElement(BlockCheckbox, { list: [
                            {
                                key: 'sidemenu',
                                url: 'https://gw.alipayobjects.com/zos/rmsportal/JopDzEhOqwOjeNTXkoje.svg',
                                title: formatMessage({ id: 'app.setting.sidemenu' }),
                            },
                            {
                                key: 'topmenu',
                                url: 'https://gw.alipayobjects.com/zos/rmsportal/KDNDBbriJhLwuqMoxcAr.svg',
                                title: formatMessage({ id: 'app.setting.topmenu' }),
                            },
                        ], value: layout, onChange: value => this.changeSetting('layout', value) })),
                React.createElement(List, { split: false, dataSource: this.getLayoutSetting(), renderItem: this.renderLayoutSettingItem }),
                React.createElement(Divider, null),
                React.createElement(Body, { title: formatMessage({ id: 'app.setting.othersettings' }) },
                    React.createElement(List, { split: false, renderItem: this.renderLayoutSettingItem, dataSource: [
                            {
                                title: formatMessage({ id: 'app.setting.weakmode' }),
                                action: (React.createElement(Switch, { size: "small", checked: !!colorWeak, onChange: checked => this.changeSetting('colorWeak', checked) })),
                            },
                        ] })),
                React.createElement(Divider, null),
                React.createElement(CopyToClipboard, { text: JSON.stringify(omit(setting, ['colorWeak']), null, 2), onCopy: () => message.success(formatMessage({ id: 'app.setting.copyinfo' })) },
                    React.createElement(Button, { block: true, icon: "copy" }, formatMessage({ id: 'app.setting.copy' }))),
                React.createElement(Alert, { type: "warning", className: styles.productionHint, message: React.createElement("div", null,
                        formatMessage({ id: 'app.setting.production.hint' }),
                        ' ',
                        React.createElement("a", { href: "https://u.ant.design/pro-v2-default-settings", target: "_blank", rel: "noopener noreferrer" }, "src/defaultSettings.js")) }))));
    }
};
SettingDrawer = __decorate([
    connect(({ setting }) => ({ setting }))
], SettingDrawer);
export default SettingDrawer;
//# sourceMappingURL=index.js.map