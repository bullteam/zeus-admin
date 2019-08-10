import { queryProvince, queryCity } from '@/services/geographic';
export default {
    namespace: 'geographic',
    state: {
        province: [],
        city: [],
        isLoading: false,
    },
    effects: {
        *fetchProvince(_, { call, put }) {
            yield put({
                type: 'changeLoading',
                payload: true,
            });
            const response = yield call(queryProvince);
            yield put({
                type: 'setProvince',
                payload: response,
            });
            yield put({
                type: 'changeLoading',
                payload: false,
            });
        },
        *fetchCity({ payload }, { call, put }) {
            yield put({
                type: 'changeLoading',
                payload: true,
            });
            const response = yield call(queryCity, payload);
            yield put({
                type: 'setCity',
                payload: response,
            });
            yield put({
                type: 'changeLoading',
                payload: false,
            });
        },
    },
    reducers: {
        setProvince(state, action) {
            return Object.assign({}, state, { province: action.payload });
        },
        setCity(state, action) {
            return Object.assign({}, state, { city: action.payload });
        },
        changeLoading(state, action) {
            return Object.assign({}, state, { isLoading: action.payload });
        },
    },
};
//# sourceMappingURL=geographic.js.map