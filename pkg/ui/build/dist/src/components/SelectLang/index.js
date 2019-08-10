import React, { PureComponent } from 'react';
import { formatMessage, setLocale, getLocale } from 'umi-plugin-react/locale';
import { Menu, Icon } from 'antd';
import classNames from 'classnames';
import HeaderDropdown from '../HeaderDropdown';
import styles from './index.less';
export default class SelectLang extends PureComponent {
    constructor() {
        super(...arguments);
        this.changeLang = ({ key }) => {
            setLocale(key);
        };
    }
    render() {
        const { className } = this.props;
        const selectedLang = getLocale();
        const locales = ['zh-CN', 'zh-TW', 'en-US', 'pt-BR'];
        const languageLabels = {
            'zh-CN': '简体中文',
            'zh-TW': '繁体中文',
            'en-US': 'English',
            'pt-BR': 'Português',
        };
        const languageIcons = {
            'zh-CN': '🇨🇳',
            'zh-TW': '🇭🇰',
            'en-US': '🇬🇧',
            'pt-BR': '🇧🇷',
        };
        const langMenu = (React.createElement(Menu, { className: styles.menu, selectedKeys: [selectedLang], onClick: this.changeLang }, locales.map(locale => (React.createElement(Menu.Item, { key: locale },
            React.createElement("span", { role: "img", "aria-label": languageLabels[locale] }, languageIcons[locale]),
            ' ',
            languageLabels[locale])))));
        return (React.createElement(HeaderDropdown, { overlay: langMenu, placement: "bottomRight" },
            React.createElement("span", { className: classNames(styles.dropDown, className) },
                React.createElement(Icon, { type: "global", title: formatMessage({ id: 'navBar.lang' }) }))));
    }
}
//# sourceMappingURL=index.js.map