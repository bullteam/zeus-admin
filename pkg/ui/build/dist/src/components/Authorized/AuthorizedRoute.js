var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) if (e.indexOf(p[i]) < 0)
            t[p[i]] = s[p[i]];
    return t;
};
import React from 'react';
import { Route, Redirect } from 'umi';
import Authorized from './Authorized';
// TODO: umi只会返回render和rest
const AuthorizedRoute = (_a) => {
    var { component: Component, render, authority, redirectPath } = _a, rest = __rest(_a, ["component", "render", "authority", "redirectPath"]);
    return (React.createElement(Authorized, { authority: authority, noMatch: React.createElement(Route, Object.assign({}, rest, { render: () => React.createElement(Redirect, { to: { pathname: redirectPath } }) })) },
        React.createElement(Route, Object.assign({}, rest, { render: props => (Component ? React.createElement(Component, Object.assign({}, props)) : render(props)) }))));
};
export default AuthorizedRoute;
//# sourceMappingURL=AuthorizedRoute.js.map