var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component } from 'react';
import { connect } from 'dva';
import { formatMessage, FormattedMessage } from 'umi-plugin-react/locale';
import Link from 'umi/link';
import router from 'umi/router';
import { Form, Input, Button, Modal, Select, Row, Col, Popover, Progress } from 'antd';
import styles from './Register.less';
const FormItem = Form.Item;
const { Option } = Select;
const InputGroup = Input.Group;
const passwordStatusMap = {
    ok: (React.createElement("div", { className: styles.success },
        React.createElement(FormattedMessage, { id: "validation.password.strength.strong" }))),
    pass: (React.createElement("div", { className: styles.warning },
        React.createElement(FormattedMessage, { id: "validation.password.strength.medium" }))),
    poor: (React.createElement("div", { className: styles.error },
        React.createElement(FormattedMessage, { id: "validation.password.strength.short" }))),
};
const passwordProgressMap = {
    ok: 'success',
    pass: 'normal',
    poor: 'exception',
};
let Register = class Register extends Component {
    constructor() {
        super(...arguments);
        this.state = {
            count: 0,
            confirmDirty: false,
            visible: false,
            help: '',
            prefix: '86',
        };
        this.onGetCaptcha = () => {
            let count = 59;
            this.setState({ count });
            this.interval = setInterval(() => {
                count -= 1;
                this.setState({ count });
                if (count === 0) {
                    clearInterval(this.interval);
                }
            }, 1000);
            Modal.info({
                title: formatMessage({ id: 'app.login.verification-code-warning' }),
            });
        };
        this.getPasswordStatus = () => {
            const { form } = this.props;
            const value = form.getFieldValue('password');
            if (value && value.length > 9) {
                return 'ok';
            }
            if (value && value.length > 5) {
                return 'pass';
            }
            return 'poor';
        };
        this.handleSubmit = e => {
            e.preventDefault();
            const { form, dispatch } = this.props;
            form.validateFields({ force: true }, (err, values) => {
                if (!err) {
                    const { prefix } = this.state;
                    dispatch({
                        type: 'register/submit',
                        payload: Object.assign({}, values, { prefix }),
                    });
                }
            });
        };
        this.handleConfirmBlur = e => {
            const { value } = e.target;
            const { confirmDirty } = this.state;
            this.setState({ confirmDirty: confirmDirty || !!value });
        };
        this.checkConfirm = (rule, value, callback) => {
            const { form } = this.props;
            if (value && value !== form.getFieldValue('password')) {
                callback(formatMessage({ id: 'validation.password.twice' }));
            }
            else {
                callback();
            }
        };
        this.checkPassword = (rule, value, callback) => {
            const { visible, confirmDirty } = this.state;
            if (!value) {
                this.setState({
                    help: formatMessage({ id: 'validation.password.required' }),
                    visible: !!value,
                });
                callback('error');
            }
            else {
                this.setState({
                    help: '',
                });
                if (!visible) {
                    this.setState({
                        visible: !!value,
                    });
                }
                if (value.length < 6) {
                    callback('error');
                }
                else {
                    const { form } = this.props;
                    if (value && confirmDirty) {
                        form.validateFields(['confirm'], { force: true });
                    }
                    callback();
                }
            }
        };
        this.changePrefix = value => {
            this.setState({
                prefix: value,
            });
        };
        this.renderPasswordProgress = () => {
            const { form } = this.props;
            const value = form.getFieldValue('password');
            const passwordStatus = this.getPasswordStatus();
            return value && value.length ? (React.createElement("div", { className: styles[`progress-${passwordStatus}`] },
                React.createElement(Progress, { status: passwordProgressMap[passwordStatus], className: styles.progress, strokeWidth: 6, percent: value.length * 10 > 100 ? 100 : value.length * 10, showInfo: false }))) : null;
        };
    }
    componentDidUpdate() {
        const { form, register } = this.props;
        const account = form.getFieldValue('mail');
        if (register.status === 'ok') {
            router.push({
                pathname: '/user/register-result',
                state: {
                    account,
                },
            });
        }
    }
    componentWillUnmount() {
        clearInterval(this.interval);
    }
    render() {
        const { form, submitting } = this.props;
        const { getFieldDecorator } = form;
        const { count, prefix, help, visible } = this.state;
        return (React.createElement("div", { className: styles.main },
            React.createElement("h3", null,
                React.createElement(FormattedMessage, { id: "app.register.register" })),
            React.createElement(Form, { onSubmit: this.handleSubmit },
                React.createElement(FormItem, null, getFieldDecorator('mail', {
                    rules: [
                        {
                            required: true,
                            message: formatMessage({ id: 'validation.email.required' }),
                        },
                        {
                            type: 'email',
                            message: formatMessage({ id: 'validation.email.wrong-format' }),
                        },
                    ],
                })(React.createElement(Input, { size: "large", placeholder: formatMessage({ id: 'form.email.placeholder' }) }))),
                React.createElement(FormItem, { help: help },
                    React.createElement(Popover, { getPopupContainer: node => node.parentNode, content: React.createElement("div", { style: { padding: '4px 0' } },
                            passwordStatusMap[this.getPasswordStatus()],
                            this.renderPasswordProgress(),
                            React.createElement("div", { style: { marginTop: 10 } },
                                React.createElement(FormattedMessage, { id: "validation.password.strength.msg" }))), overlayStyle: { width: 240 }, placement: "right", visible: visible }, getFieldDecorator('password', {
                        rules: [
                            {
                                validator: this.checkPassword,
                            },
                        ],
                    })(React.createElement(Input, { size: "large", type: "password", placeholder: formatMessage({ id: 'form.password.placeholder' }) })))),
                React.createElement(FormItem, null, getFieldDecorator('confirm', {
                    rules: [
                        {
                            required: true,
                            message: formatMessage({ id: 'validation.confirm-password.required' }),
                        },
                        {
                            validator: this.checkConfirm,
                        },
                    ],
                })(React.createElement(Input, { size: "large", type: "password", placeholder: formatMessage({ id: 'form.confirm-password.placeholder' }) }))),
                React.createElement(FormItem, null,
                    React.createElement(InputGroup, { compact: true },
                        React.createElement(Select, { size: "large", value: prefix, onChange: this.changePrefix, style: { width: '20%' } },
                            React.createElement(Option, { value: "86" }, "+86"),
                            React.createElement(Option, { value: "87" }, "+87")),
                        getFieldDecorator('mobile', {
                            rules: [
                                {
                                    required: true,
                                    message: formatMessage({ id: 'validation.phone-number.required' }),
                                },
                                {
                                    pattern: /^\d{11}$/,
                                    message: formatMessage({ id: 'validation.phone-number.wrong-format' }),
                                },
                            ],
                        })(React.createElement(Input, { size: "large", style: { width: '80%' }, placeholder: formatMessage({ id: 'form.phone-number.placeholder' }) })))),
                React.createElement(FormItem, null,
                    React.createElement(Row, { gutter: 8 },
                        React.createElement(Col, { span: 16 }, getFieldDecorator('captcha', {
                            rules: [
                                {
                                    required: true,
                                    message: formatMessage({ id: 'validation.verification-code.required' }),
                                },
                            ],
                        })(React.createElement(Input, { size: "large", placeholder: formatMessage({ id: 'form.verification-code.placeholder' }) }))),
                        React.createElement(Col, { span: 8 },
                            React.createElement(Button, { size: "large", disabled: count, className: styles.getCaptcha, onClick: this.onGetCaptcha }, count
                                ? `${count} s`
                                : formatMessage({ id: 'app.register.get-verification-code' }))))),
                React.createElement(FormItem, null,
                    React.createElement(Button, { size: "large", loading: submitting, className: styles.submit, type: "primary", htmlType: "submit" },
                        React.createElement(FormattedMessage, { id: "app.register.register" })),
                    React.createElement(Link, { className: styles.login, to: "/User/Login" },
                        React.createElement(FormattedMessage, { id: "app.register.sign-in" }))))));
    }
};
Register = __decorate([
    connect(({ register, loading }) => ({
        register,
        submitting: loading.effects['register/submit'],
    })),
    Form.create()
], Register);
export default Register;
//# sourceMappingURL=Register.js.map