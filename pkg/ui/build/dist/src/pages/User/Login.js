var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component } from 'react';
import { connect } from 'dva';
import { formatMessage, FormattedMessage } from 'umi-plugin-react/locale';
// import Link from 'umi/link';
// import { Checkbox, Alert, Modal, Icon } from 'antd';
import { Checkbox, Alert, Modal } from 'antd';
import Login from '@/components/Login';
import styles from './Login.less';
const { Tab, UserName, Password, Mobile, Captcha, Submit } = Login;
let LoginPage = class LoginPage extends Component {
    constructor() {
        super(...arguments);
        this.state = {
            type: 'account',
            autoLogin: true,
        };
        this.onTabChange = type => {
            this.setState({ type });
        };
        this.onGetCaptcha = () => new Promise((resolve, reject) => {
            this.loginForm.validateFields(['mobile'], {}, (err, values) => {
                if (err) {
                    reject(err);
                }
                else {
                    const { dispatch } = this.props;
                    dispatch({
                        type: 'login/getCaptcha',
                        payload: values.mobile,
                    })
                        .then(resolve)
                        .catch(reject);
                    Modal.info({
                        title: formatMessage({ id: 'app.login.verification-code-warning' }),
                    });
                }
            });
        });
        this.handleSubmit = (err, values) => {
            const { type } = this.state;
            if (!err) {
                const { dispatch } = this.props;
                dispatch({
                    type: 'login/login',
                    payload: Object.assign({}, values, { type }),
                });
            }
        };
        this.changeAutoLogin = e => {
            this.setState({
                autoLogin: e.target.checked,
            });
        };
        this.renderMessage = content => (React.createElement(Alert, { style: { marginBottom: 24 }, message: content, type: "error", showIcon: true }));
    }
    render() {
        const { login, submitting } = this.props;
        const { type, autoLogin } = this.state;
        return (React.createElement("div", { className: styles.main },
            React.createElement(Login, { defaultActiveKey: type, onTabChange: this.onTabChange, onSubmit: this.handleSubmit, ref: form => {
                    this.loginForm = form;
                } },
                React.createElement(Tab, { key: "account", tab: formatMessage({ id: 'app.login.tab-login-credentials' }) },
                    login.status === 'error' &&
                        login.type === 'account' &&
                        !submitting &&
                        this.renderMessage(formatMessage({ id: 'app.login.message-invalid-credentials' })),
                    React.createElement(UserName, { name: "userName", placeholder: `${formatMessage({ id: 'app.login.userName' })}: admin or user`, rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'validation.userName.required' }),
                            },
                        ] }),
                    React.createElement(Password, { name: "password", placeholder: `${formatMessage({ id: 'app.login.password' })}: ant.design`, rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'validation.password.required' }),
                            },
                        ], onPressEnter: e => {
                            e.preventDefault();
                            this.loginForm.validateFields(this.handleSubmit);
                        } })),
                React.createElement(Tab, { key: "mobile", tab: formatMessage({ id: 'app.login.tab-login-mobile' }) },
                    login.status === 'error' &&
                        login.type === 'mobile' &&
                        !submitting &&
                        this.renderMessage(formatMessage({ id: 'app.login.message-invalid-verification-code' })),
                    React.createElement(Mobile, { name: "mobile", placeholder: formatMessage({ id: 'form.phone-number.placeholder' }), rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'validation.phone-number.required' }),
                            },
                            {
                                pattern: /^1\d{10}$/,
                                message: formatMessage({ id: 'validation.phone-number.wrong-format' }),
                            },
                        ] }),
                    React.createElement(Captcha, { name: "captcha", placeholder: formatMessage({ id: 'form.verification-code.placeholder' }), countDown: 120, onGetCaptcha: this.onGetCaptcha, getCaptchaButtonText: formatMessage({ id: 'form.get-captcha' }), getCaptchaSecondText: formatMessage({ id: 'form.captcha.second' }), rules: [
                            {
                                required: true,
                                message: formatMessage({ id: 'validation.verification-code.required' }),
                            },
                        ] })),
                React.createElement("div", null,
                    React.createElement(Checkbox, { checked: autoLogin, onChange: this.changeAutoLogin },
                        React.createElement(FormattedMessage, { id: "app.login.remember-me" })),
                    React.createElement("a", { style: { float: 'right' }, href: "" },
                        React.createElement(FormattedMessage, { id: "app.login.forgot-password" }))),
                React.createElement(Submit, { loading: submitting },
                    React.createElement(FormattedMessage, { id: "app.login.login" })))));
    }
};
LoginPage = __decorate([
    connect(({ login, loading }) => ({
        login,
        submitting: loading.effects['login/login'],
    }))
], LoginPage);
export default LoginPage;
//# sourceMappingURL=Login.js.map