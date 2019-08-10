var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component } from 'react';
import { connect } from 'dva';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
let Hello = class Hello extends Component {
    render() {
        const { loading } = this.props;
        return (React.createElement(PageHeaderWrapper, { title: "\u6B22\u8FCE\u9875", loading: loading, id: "app.auth.header" },
            React.createElement("p", { id: "app.auth.text" }, "Hello, world!")));
    }
};
Hello = __decorate([
    connect(({ loading }) => ({
        loading: loading.effects['profile/fetchBasic'],
    }))
], Hello);
export default Hello;
//# sourceMappingURL=Hello.js.map