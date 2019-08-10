import { queryFakeList, removeFakeList, addFakeList, updateFakeList } from '@/services/api';
export default {
    namespace: 'list',
    state: {
        list: [],
    },
    effects: {
        *fetch({ payload }, { call, put }) {
            const response = yield call(queryFakeList, payload);
            yield put({
                type: 'queryList',
                payload: Array.isArray(response) ? response : [],
            });
        },
        *appendFetch({ payload }, { call, put }) {
            const response = yield call(queryFakeList, payload);
            yield put({
                type: 'appendList',
                payload: Array.isArray(response) ? response : [],
            });
        },
        *submit({ payload }, { call, put }) {
            let callback;
            if (payload.id) {
                callback = Object.keys(payload).length === 1 ? removeFakeList : updateFakeList;
            }
            else {
                callback = addFakeList;
            }
            const response = yield call(callback, payload); // post
            yield put({
                type: 'queryList',
                payload: response,
            });
        },
    },
    reducers: {
        queryList(state, action) {
            return Object.assign({}, state, { list: action.payload });
        },
        appendList(state, action) {
            return Object.assign({}, state, { list: state.list.concat(action.payload) });
        },
    },
};
//# sourceMappingURL=list.js.map