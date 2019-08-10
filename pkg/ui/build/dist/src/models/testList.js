export default {
    namespace: 'testList',
    state: [],
    reducers: {
        delete(state, { payload: id }) {
            return state.filter(item => item.id !== id);
        },
    },
};
//# sourceMappingURL=testList.js.map