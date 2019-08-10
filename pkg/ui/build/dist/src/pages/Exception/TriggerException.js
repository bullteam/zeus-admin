var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { Button, Spin, Card } from 'antd';
import { connect } from 'dva';
import styles from './style.less';
let TriggerException = class TriggerException extends PureComponent {
    constructor() {
        super(...arguments);
        this.state = {
            isloading: false,
        };
        this.triggerError = code => {
            this.setState({
                isloading: true,
            });
            const { dispatch } = this.props;
            dispatch({
                type: 'error/query',
                payload: {
                    code,
                },
            });
        };
    }
    render() {
        const { isloading } = this.state;
        return (React.createElement(Card, null,
            React.createElement(Spin, { spinning: isloading, wrapperClassName: styles.trigger },
                React.createElement(Button, { type: "danger", onClick: () => this.triggerError(401) }, "\u89E6\u53D1401"),
                React.createElement(Button, { type: "danger", onClick: () => this.triggerError(403) }, "\u89E6\u53D1403"),
                React.createElement(Button, { type: "danger", onClick: () => this.triggerError(500) }, "\u89E6\u53D1500"),
                React.createElement(Button, { type: "danger", onClick: () => this.triggerError(404) }, "\u89E6\u53D1404"))));
    }
};
TriggerException = __decorate([
    connect(state => ({
        isloading: state.error.isloading,
    }))
], TriggerException);
export default TriggerException;
//# sourceMappingURL=TriggerException.js.map