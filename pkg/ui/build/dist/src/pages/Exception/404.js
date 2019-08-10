import React from 'react';
import { formatMessage } from 'umi-plugin-react/locale';
import Link from 'umi/link';
import Exception from '@/components/Exception';
const Exception404 = () => (React.createElement(Exception, { type: "404", desc: formatMessage({ id: 'app.exception.description.404' }), linkElement: Link, backText: formatMessage({ id: 'app.exception.back' }) }));
export default Exception404;
//# sourceMappingURL=404.js.map