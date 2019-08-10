import React from 'react';
import { yuan } from '@/components/Charts';
/**
 * 减少使用 dangerouslySetInnerHTML
 */
export default class Yuan extends React.PureComponent {
    constructor() {
        super(...arguments);
        this.rendertoHtml = () => {
            const { children } = this.props;
            if (this.main) {
                this.main.innerHTML = yuan(children);
            }
        };
    }
    componentDidMount() {
        this.rendertoHtml();
    }
    componentDidUpdate() {
        this.rendertoHtml();
    }
    render() {
        return (React.createElement("span", { ref: ref => {
                this.main = ref;
            } }));
    }
}
//# sourceMappingURL=Yuan.js.map