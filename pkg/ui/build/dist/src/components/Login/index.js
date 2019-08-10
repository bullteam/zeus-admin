import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Form, Tabs } from 'antd';
import classNames from 'classnames';
import LoginItem from './LoginItem';
import LoginTab from './LoginTab';
import LoginSubmit from './LoginSubmit';
import styles from './index.less';
import LoginContext from './loginContext';
class Login extends Component {
    constructor(props) {
        super(props);
        this.onSwitch = type => {
            this.setState({
                type,
            });
            const { onTabChange } = this.props;
            onTabChange(type);
        };
        this.getContext = () => {
            const { tabs } = this.state;
            const { form } = this.props;
            return {
                tabUtil: {
                    addTab: id => {
                        this.setState({
                            tabs: [...tabs, id],
                        });
                    },
                    removeTab: id => {
                        this.setState({
                            tabs: tabs.filter(currentId => currentId !== id),
                        });
                    },
                },
                form: Object.assign({}, form),
                updateActive: activeItem => {
                    const { type, active } = this.state;
                    if (active[type]) {
                        active[type].push(activeItem);
                    }
                    else {
                        active[type] = [activeItem];
                    }
                    this.setState({
                        active,
                    });
                },
            };
        };
        this.handleSubmit = e => {
            e.preventDefault();
            const { active, type } = this.state;
            const { form, onSubmit } = this.props;
            const activeFileds = active[type];
            form.validateFields(activeFileds, { force: true }, (err, values) => {
                onSubmit(err, values);
            });
        };
        this.state = {
            type: props.defaultActiveKey,
            tabs: [],
            active: {},
        };
    }
    render() {
        const { className, children } = this.props;
        const { type, tabs } = this.state;
        const TabChildren = [];
        const otherChildren = [];
        React.Children.forEach(children, item => {
            if (!item) {
                return;
            }
            // eslint-disable-next-line
            if (item.type.typeName === 'LoginTab') {
                TabChildren.push(item);
            }
            else {
                otherChildren.push(item);
            }
        });
        return (React.createElement(LoginContext.Provider, { value: this.getContext() },
            React.createElement("div", { className: classNames(className, styles.login) },
                React.createElement(Form, { onSubmit: this.handleSubmit }, tabs.length ? (React.createElement(React.Fragment, null,
                    React.createElement(Tabs, { animated: false, className: styles.tabs, activeKey: type, onChange: this.onSwitch }, TabChildren),
                    otherChildren)) : (children)))));
    }
}
Login.propTypes = {
    className: PropTypes.string,
    defaultActiveKey: PropTypes.string,
    onTabChange: PropTypes.func,
    onSubmit: PropTypes.func,
};
Login.defaultProps = {
    className: '',
    defaultActiveKey: '',
    onTabChange: () => { },
    onSubmit: () => { },
};
Login.Tab = LoginTab;
Login.Submit = LoginSubmit;
Object.keys(LoginItem).forEach(item => {
    Login[item] = LoginItem[item];
});
export default Form.create()(Login);
//# sourceMappingURL=index.js.map