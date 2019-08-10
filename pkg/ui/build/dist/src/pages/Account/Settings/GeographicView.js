var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import React, { PureComponent } from 'react';
import { Select, Spin } from 'antd';
import { connect } from 'dva';
import styles from './GeographicView.less';
const { Option } = Select;
const nullSlectItem = {
    label: '',
    key: '',
};
let GeographicView = class GeographicView extends PureComponent {
    constructor() {
        super(...arguments);
        this.componentDidMount = () => {
            const { dispatch } = this.props;
            dispatch({
                type: 'geographic/fetchProvince',
            });
        };
        this.getCityOption = () => {
            const { city } = this.props;
            return this.getOption(city);
        };
        this.getOption = list => {
            if (!list || list.length < 1) {
                return (React.createElement(Option, { key: 0, value: 0 }, "\u6CA1\u6709\u627E\u5230\u9009\u9879"));
            }
            return list.map(item => (React.createElement(Option, { key: item.id, value: item.id }, item.name)));
        };
        this.selectProvinceItem = item => {
            const { dispatch, onChange } = this.props;
            dispatch({
                type: 'geographic/fetchCity',
                payload: item.key,
            });
            onChange({
                province: item,
                city: nullSlectItem,
            });
        };
        this.selectCityItem = item => {
            const { value, onChange } = this.props;
            onChange({
                province: value.province,
                city: item,
            });
        };
    }
    componentDidUpdate(props) {
        const { dispatch, value } = this.props;
        if (!props.value && !!value && !!value.province) {
            dispatch({
                type: 'geographic/fetchCity',
                payload: value.province.key,
            });
        }
    }
    getProvinceOption() {
        const { province } = this.props;
        return this.getOption(province);
    }
    conversionObject() {
        const { value } = this.props;
        if (!value) {
            return {
                province: nullSlectItem,
                city: nullSlectItem,
            };
        }
        const { province, city } = value;
        return {
            province: province || nullSlectItem,
            city: city || nullSlectItem,
        };
    }
    render() {
        const { province, city } = this.conversionObject();
        const { isLoading } = this.props;
        return (React.createElement(Spin, { spinning: isLoading, wrapperClassName: styles.row },
            React.createElement(Select, { className: styles.item, value: province, labelInValue: true, showSearch: true, onSelect: this.selectProvinceItem }, this.getProvinceOption()),
            React.createElement(Select, { className: styles.item, value: city, labelInValue: true, showSearch: true, onSelect: this.selectCityItem }, this.getCityOption())));
    }
};
GeographicView = __decorate([
    connect(({ geographic }) => {
        const { province, isLoading, city } = geographic;
        return {
            province,
            city,
            isLoading,
        };
    })
], GeographicView);
export default GeographicView;
//# sourceMappingURL=GeographicView.js.map