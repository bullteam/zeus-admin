export const dva = {
  config: {
    onError(err) {
      err.preventDefault();
      console.error(err.message);
    },
    initialState: {
      testList: [{name: 'dva', id: 1}, {name: 'antd', id: 2}],
    },
  },
};

export function render(oldRender) {
  oldRender();
}
