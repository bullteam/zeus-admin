var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) if (e.indexOf(p[i]) < 0)
            t[p[i]] = s[p[i]];
    return t;
};
import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import { Input, Icon, AutoComplete } from 'antd';
import classNames from 'classnames';
import Debounce from 'lodash-decorators/debounce';
import Bind from 'lodash-decorators/bind';
import styles from './index.less';
export default class HeaderSearch extends PureComponent {
    constructor(props) {
        super(props);
        this.onKeyDown = e => {
            if (e.key === 'Enter') {
                const { onPressEnter } = this.props;
                const { value } = this.state;
                this.timeout = setTimeout(() => {
                    onPressEnter(value); // Fix duplicate onPressEnter
                }, 0);
            }
        };
        this.onChange = value => {
            const { onSearch, onChange } = this.props;
            this.setState({ value });
            if (onSearch) {
                onSearch(value);
            }
            if (onChange) {
                onChange(value);
            }
        };
        this.enterSearchMode = () => {
            const { onVisibleChange } = this.props;
            onVisibleChange(true);
            this.setState({ searchMode: true }, () => {
                const { searchMode } = this.state;
                if (searchMode) {
                    this.input.focus();
                }
            });
        };
        this.leaveSearchMode = () => {
            this.setState({
                searchMode: false,
                value: '',
            });
        };
        this.state = {
            searchMode: props.defaultOpen,
            value: '',
        };
    }
    static getDerivedStateFromProps(props) {
        if ('open' in props) {
            return {
                searchMode: props.open,
            };
        }
        return null;
    }
    componentWillUnmount() {
        clearTimeout(this.timeout);
    }
    // NOTE: 不能小于500，如果长按某键，第一次触发auto repeat的间隔是500ms，小于500会导致触发2次
    debouncePressEnter() {
        const { onPressEnter } = this.props;
        const { value } = this.state;
        onPressEnter(value);
    }
    render() {
        const _a = this.props, { className, placeholder, open } = _a, restProps = __rest(_a, ["className", "placeholder", "open"]);
        const { searchMode, value } = this.state;
        delete restProps.defaultOpen; // for rc-select not affected
        const inputClass = classNames(styles.input, {
            [styles.show]: searchMode,
        });
        return (React.createElement("span", { className: classNames(className, styles.headerSearch), onClick: this.enterSearchMode, onTransitionEnd: ({ propertyName }) => {
                if (propertyName === 'width' && !searchMode) {
                    const { onVisibleChange } = this.props;
                    onVisibleChange(searchMode);
                }
            } },
            React.createElement(Icon, { type: "search", key: "Icon" }),
            React.createElement(AutoComplete, Object.assign({ key: "AutoComplete" }, restProps, { className: inputClass, value: value, onChange: this.onChange }),
                React.createElement(Input, { ref: node => {
                        this.input = node;
                    }, "aria-label": placeholder, placeholder: placeholder, onKeyDown: this.onKeyDown, onBlur: this.leaveSearchMode }))));
    }
}
HeaderSearch.propTypes = {
    className: PropTypes.string,
    placeholder: PropTypes.string,
    onSearch: PropTypes.func,
    onChange: PropTypes.func,
    onPressEnter: PropTypes.func,
    defaultActiveFirstOption: PropTypes.bool,
    dataSource: PropTypes.array,
    defaultOpen: PropTypes.bool,
    onVisibleChange: PropTypes.func,
};
HeaderSearch.defaultProps = {
    defaultActiveFirstOption: false,
    onPressEnter: () => { },
    onSearch: () => { },
    onChange: () => { },
    className: '',
    placeholder: '',
    dataSource: [],
    defaultOpen: false,
    onVisibleChange: () => { },
};
__decorate([
    Bind(),
    Debounce(500, {
        leading: true,
        trailing: false,
    })
], HeaderSearch.prototype, "debouncePressEnter", null);
//# sourceMappingURL=index.js.map