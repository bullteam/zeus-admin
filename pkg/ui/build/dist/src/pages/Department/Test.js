var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component } from 'react';
import { connect } from 'dva';
import List from '@/components/List';
let Test = class Test extends Component {
    constructor(props) {
        super(props);
        this.handleDelete = (id) => {
            this.props.dispatch({
                type: 'testList/delete',
                payload: id,
            });
        };
    }
    render() {
        return (React.createElement("div", null,
            React.createElement("h2", null, "\u90E8\u95E8\u7BA1\u7406"),
            React.createElement(List, { onDelete: (e) => this.handleDelete(e), data: this.props.testList })));
    }
};
Test = __decorate([
    connect(({ testList }) => ({
        testList
    }))
], Test);
export default Test;
//# sourceMappingURL=Test.js.map