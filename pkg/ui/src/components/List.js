import {Table, Popconfirm, Button} from 'antd';

const List = ({onDelete, data}) => {
  const columns = [
    {
      title: '名称',
      dataIndex: 'name',
    },
    {
      title: '操作',
      render: (text, record) => {
        return (
          <Popconfirm title="是否删除?" onConfirm={() => onDelete(record.id)}>
            <Button>删除</Button>
          </Popconfirm>
        );
      },
    },
  ];
  return <Table dataSource={data} columns={columns}/>;
};

export default List;