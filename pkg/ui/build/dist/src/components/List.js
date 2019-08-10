import { Table, Popconfirm, Button } from 'antd';
const List = ({ onDelete, data }) => {
    const columns = [
        {
            title: '名称',
            dataIndex: 'name',
        },
        {
            title: '操作',
            render: (text, record) => {
                return (React.createElement(Popconfirm, { title: "\u662F\u5426\u5220\u9664?", onConfirm: () => onDelete(record.id) },
                    React.createElement(Button, null, "\u5220\u9664")));
            },
        },
    ];
    return React.createElement(Table, { dataSource: data, columns: columns });
};
export default List;
//# sourceMappingURL=List.js.map