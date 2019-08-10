import { query as queryUsers, queryCurrent } from '@/services/user';
export default {
    namespace: 'user',
    state: {
        list: [],
        currentUser: {},
    },
    effects: {
        *fetch(_, { call, put }) {
            const response = yield call(queryUsers);
            yield put({
                type: 'save',
                payload: response,
            });
        },
        *fetchCurrent(_, { call, put }) {
            const response = yield call(queryCurrent);
            yield put({
                type: 'saveCurrentUser',
                payload: response,
            });
        },
    },
    reducers: {
        save(state, action) {
            return Object.assign({}, state, { list: action.payload });
        },
        saveCurrentUser(state, action) {
            return Object.assign({}, state, { currentUser: action.payload || {} });
        },
        changeNotifyCount(state, action) {
            return Object.assign({}, state, { currentUser: Object.assign({}, state.currentUser, { notifyCount: action.payload.totalCount, unreadCount: action.payload.unreadCount }) });
        },
    },
};
//# sourceMappingURL=user.js.map