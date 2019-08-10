var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) if (e.indexOf(p[i]) < 0)
            t[p[i]] = s[p[i]];
    return t;
};
import { Spin } from 'antd';
import isEqual from 'lodash/isEqual';
import React from 'react';
// eslint-disable-next-line import/no-cycle
import { isComponentClass } from './Secured';
export default class PromiseRender extends React.Component {
    constructor() {
        super(...arguments);
        this.state = {
            component: null,
        };
        this.shouldComponentUpdate = (nextProps, nextState) => {
            const { component } = this.state;
            if (!isEqual(nextProps, this.props)) {
                this.setRenderComponent(nextProps);
            }
            if (nextState.component !== component)
                return true;
            return false;
        };
        // Determine whether the incoming component has been instantiated
        // AuthorizedRoute is already instantiated
        // Authorized  render is already instantiated, children is no instantiated
        // Secured is not instantiated
        this.checkIsInstantiation = target => {
            if (isComponentClass(target)) {
                const Target = target;
                return props => React.createElement(Target, Object.assign({}, props));
            }
            if (React.isValidElement(target)) {
                return props => React.cloneElement(target, props);
            }
            return () => target;
        };
    }
    componentDidMount() {
        this.setRenderComponent(this.props);
    }
    // set render Component : ok or error
    setRenderComponent(props) {
        const ok = this.checkIsInstantiation(props.ok);
        const error = this.checkIsInstantiation(props.error);
        props.promise
            .then(() => {
            this.setState({
                component: ok,
            });
        })
            .catch(() => {
            this.setState({
                component: error,
            });
        });
    }
    render() {
        const { component: Component } = this.state;
        const _a = this.props, { ok, error, promise } = _a, rest = __rest(_a, ["ok", "error", "promise"]);
        return Component ? (React.createElement(Component, Object.assign({}, rest))) : (React.createElement("div", { style: {
                width: '100%',
                height: '100%',
                margin: 'auto',
                paddingTop: 50,
                textAlign: 'center',
            } },
            React.createElement(Spin, { size: "large" })));
    }
}
//# sourceMappingURL=PromiseRender.js.map