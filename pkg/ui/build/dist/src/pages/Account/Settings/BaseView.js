var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component, Fragment } from 'react';
import { formatMessage, FormattedMessage } from 'umi-plugin-react/locale';
import { Form, Input, Upload, Select, Button } from 'antd';
import { connect } from 'dva';
import styles from './BaseView.less';
import GeographicView from './GeographicView';
import PhoneView from './PhoneView';
// import { getTimeDistance } from '@/utils/utils';
const FormItem = Form.Item;
const { Option } = Select;
// 头像组件 方便以后独立，增加裁剪之类的功能
const AvatarView = ({ avatar }) => (React.createElement(Fragment, null,
    React.createElement("div", { className: styles.avatar_title },
        React.createElement(FormattedMessage, { id: "app.settings.basic.avatar", defaultMessage: "Avatar" })),
    React.createElement("div", { className: styles.avatar },
        React.createElement("img", { src: avatar, alt: "avatar" })),
    React.createElement(Upload, { fileList: [] },
        React.createElement("div", { className: styles.button_view },
            React.createElement(Button, { icon: "upload" },
                React.createElement(FormattedMessage, { id: "app.settings.basic.change-avatar", defaultMessage: "Change avatar" }))))));
const validatorGeographic = (rule, value, callback) => {
    const { province, city } = value;
    if (!province.key) {
        callback('Please input your province!');
    }
    if (!city.key) {
        callback('Please input your city!');
    }
    callback();
};
const validatorPhone = (rule, value, callback) => {
    const values = value.split('-');
    if (!values[0]) {
        callback('Please input your area code!');
    }
    if (!values[1]) {
        callback('Please input your phone number!');
    }
    callback();
};
let BaseView = class BaseView extends Component {
    constructor() {
        super(...arguments);
        this.setBaseInfo = () => {
            const { currentUser, form } = this.props;
            Object.keys(form.getFieldsValue()).forEach(key => {
                const obj = {};
                obj[key] = currentUser[key] || null;
                form.setFieldsValue(obj);
            });
        };
        this.getViewDom = ref => {
            this.view = ref;
        };
    }
    componentDidMount() {
        this.setBaseInfo();
    }
    getAvatarURL() {
        const { currentUser } = this.props;
        if (currentUser.avatar) {
            return currentUser.avatar;
        }
        const url = 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png';
        return url;
    }
    render() {
        const { form: { getFieldDecorator }, } = this.props;
        return (React.createElement("div", { className: styles.baseView, ref: this.getViewDom },
            React.createElement("div", { className: styles.left },
                React.createElement(Form, { layout: "vertical", onSubmit: this.handleSubmit, hideRequiredMark: true },
                    React.createElement(FormItem, { label: formatMessage({ id: 'app.settings.basic.email' }) }, getFieldDecorator('email', {
                        rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'app.settings.basic.email-message' }, {}),
                            },
                        ],
                    })(React.createElement(Input, null))),
                    React.createElement(FormItem, { label: formatMessage({ id: 'app.settings.basic.nickname' }) }, getFieldDecorator('name', {
                        rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'app.settings.basic.nickname-message' }, {}),
                            },
                        ],
                    })(React.createElement(Input, null))),
                    React.createElement(FormItem, { label: formatMessage({ id: 'app.settings.basic.profile' }) }, getFieldDecorator('profile', {
                        rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'app.settings.basic.profile-message' }, {}),
                            },
                        ],
                    })(React.createElement(Input.TextArea, { placeholder: formatMessage({ id: 'app.settings.basic.profile-placeholder' }), rows: 4 }))),
                    React.createElement(FormItem, { label: formatMessage({ id: 'app.settings.basic.country' }) }, getFieldDecorator('country', {
                        rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'app.settings.basic.country-message' }, {}),
                            },
                        ],
                    })(React.createElement(Select, { style: { maxWidth: 220 } },
                        React.createElement(Option, { value: "China" }, "\u4E2D\u56FD")))),
                    React.createElement(FormItem, { label: formatMessage({ id: 'app.settings.basic.geographic' }) }, getFieldDecorator('geographic', {
                        rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'app.settings.basic.geographic-message' }, {}),
                            },
                            {
                                validator: validatorGeographic,
                            },
                        ],
                    })(React.createElement(GeographicView, null))),
                    React.createElement(FormItem, { label: formatMessage({ id: 'app.settings.basic.address' }) }, getFieldDecorator('address', {
                        rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'app.settings.basic.address-message' }, {}),
                            },
                        ],
                    })(React.createElement(Input, null))),
                    React.createElement(FormItem, { label: formatMessage({ id: 'app.settings.basic.phone' }) }, getFieldDecorator('phone', {
                        rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'app.settings.basic.phone-message' }, {}),
                            },
                            { validator: validatorPhone },
                        ],
                    })(React.createElement(PhoneView, null))),
                    React.createElement(Button, { type: "primary" },
                        React.createElement(FormattedMessage, { id: "app.settings.basic.update", defaultMessage: "Update Information" })))),
            React.createElement("div", { className: styles.right },
                React.createElement(AvatarView, { avatar: this.getAvatarURL() }))));
    }
};
BaseView = __decorate([
    connect(({ user }) => ({
        currentUser: user.currentUser,
    })),
    Form.create()
], BaseView);
export default BaseView;
//# sourceMappingURL=BaseView.js.map