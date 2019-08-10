import React, { Component } from 'react';
import { Tabs } from 'antd';
import LoginContext from './loginContext';
const { TabPane } = Tabs;
const generateId = (() => {
    let i = 0;
    return (prefix = '') => {
        i += 1;
        return `${prefix}${i}`;
    };
})();
class LoginTab extends Component {
    constructor(props) {
        super(props);
        this.uniqueId = generateId('login-tab-');
    }
    componentDidMount() {
        const { tabUtil } = this.props;
        tabUtil.addTab(this.uniqueId);
    }
    render() {
        const { children } = this.props;
        return React.createElement(TabPane, Object.assign({}, this.props), children);
    }
}
const wrapContext = props => (React.createElement(LoginContext.Consumer, null, value => React.createElement(LoginTab, Object.assign({ tabUtil: value.tabUtil }, props))));
// 标志位 用来判断是不是自定义组件
wrapContext.typeName = 'LoginTab';
export default wrapContext;
//# sourceMappingURL=LoginTab.js.map