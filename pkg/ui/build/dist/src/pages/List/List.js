var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { Component } from 'react';
import router from 'umi/router';
import { connect } from 'dva';
import { Input } from 'antd';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';
let SearchList = class SearchList extends Component {
    constructor() {
        super(...arguments);
        this.handleTabChange = key => {
            const { match } = this.props;
            switch (key) {
                case 'articles':
                    router.push(`${match.url}/articles`);
                    break;
                case 'applications':
                    router.push(`${match.url}/applications`);
                    break;
                case 'projects':
                    router.push(`${match.url}/projects`);
                    break;
                default:
                    break;
            }
        };
        this.handleFormSubmit = value => {
            // eslint-disable-next-line
            console.log(value);
        };
    }
    render() {
        const tabList = [
            {
                key: 'articles',
                tab: '文章',
            },
            {
                key: 'projects',
                tab: '项目',
            },
            {
                key: 'applications',
                tab: '应用',
            },
        ];
        const mainSearch = (React.createElement("div", { style: { textAlign: 'center' } },
            React.createElement(Input.Search, { placeholder: "\u8BF7\u8F93\u5165", enterButton: "\u641C\u7D22", size: "large", onSearch: this.handleFormSubmit, style: { maxWidth: 522, width: '100%' } })));
        const { match, children, location } = this.props;
        return (React.createElement(PageHeaderWrapper, { title: "\u641C\u7D22\u5217\u8868", content: mainSearch, tabList: tabList, tabActiveKey: location.pathname.replace(`${match.path}/`, ''), onTabChange: this.handleTabChange }, children));
    }
};
SearchList = __decorate([
    connect()
], SearchList);
export default SearchList;
//# sourceMappingURL=List.js.map