var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) if (e.indexOf(p[i]) < 0)
            t[p[i]] = s[p[i]];
    return t;
};
import React, { Component } from 'react';
import { Form, Input, Button, Row, Col } from 'antd';
import omit from 'omit.js';
import styles from './index.less';
import ItemMap from './map';
import LoginContext from './loginContext';
const FormItem = Form.Item;
class WrapFormItem extends Component {
    constructor(props) {
        super(props);
        this.onGetCaptcha = () => {
            const { onGetCaptcha } = this.props;
            const result = onGetCaptcha ? onGetCaptcha() : null;
            if (result === false) {
                return;
            }
            if (result instanceof Promise) {
                result.then(this.runGetCaptchaCountDown);
            }
            else {
                this.runGetCaptchaCountDown();
            }
        };
        this.getFormItemOptions = ({ onChange, defaultValue, customprops, rules }) => {
            const options = {
                rules: rules || customprops.rules,
            };
            if (onChange) {
                options.onChange = onChange;
            }
            if (defaultValue) {
                options.initialValue = defaultValue;
            }
            return options;
        };
        this.runGetCaptchaCountDown = () => {
            const { countDown } = this.props;
            let count = countDown || 59;
            this.setState({ count });
            this.interval = setInterval(() => {
                count -= 1;
                this.setState({ count });
                if (count === 0) {
                    clearInterval(this.interval);
                }
            }, 1000);
        };
        this.state = {
            count: 0,
        };
    }
    componentDidMount() {
        const { updateActive, name } = this.props;
        if (updateActive) {
            updateActive(name);
        }
    }
    componentWillUnmount() {
        clearInterval(this.interval);
    }
    render() {
        const { count } = this.state;
        const { form: { getFieldDecorator }, } = this.props;
        // 这么写是为了防止restProps中 带入 onChange, defaultValue, rules props
        const _a = this.props, { onChange, customprops, defaultValue, rules, name, getCaptchaButtonText, getCaptchaSecondText, updateActive, type } = _a, restProps = __rest(_a, ["onChange", "customprops", "defaultValue", "rules", "name", "getCaptchaButtonText", "getCaptchaSecondText", "updateActive", "type"]);
        // get getFieldDecorator props
        const options = this.getFormItemOptions(this.props);
        const otherProps = restProps || {};
        if (type === 'Captcha') {
            const inputProps = omit(otherProps, ['onGetCaptcha', 'countDown']);
            return (React.createElement(FormItem, null,
                React.createElement(Row, { gutter: 8 },
                    React.createElement(Col, { span: 16 }, getFieldDecorator(name, options)(React.createElement(Input, Object.assign({}, customprops, inputProps)))),
                    React.createElement(Col, { span: 8 },
                        React.createElement(Button, { disabled: count, className: styles.getCaptcha, size: "large", onClick: this.onGetCaptcha }, count ? `${count} ${getCaptchaSecondText}` : getCaptchaButtonText)))));
        }
        return (React.createElement(FormItem, null, getFieldDecorator(name, options)(React.createElement(Input, Object.assign({}, customprops, otherProps)))));
    }
}
WrapFormItem.defaultProps = {
    getCaptchaButtonText: 'captcha',
    getCaptchaSecondText: 'second',
};
const LoginItem = {};
Object.keys(ItemMap).forEach(key => {
    const item = ItemMap[key];
    LoginItem[key] = props => (React.createElement(LoginContext.Consumer, null, context => (React.createElement(WrapFormItem, Object.assign({ customprops: item.props, rules: item.rules }, props, { type: key, updateActive: context.updateActive, form: context.form })))));
});
export default LoginItem;
//# sourceMappingURL=LoginItem.js.map