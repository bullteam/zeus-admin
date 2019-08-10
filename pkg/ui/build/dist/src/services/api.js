var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) if (e.indexOf(p[i]) < 0)
            t[p[i]] = s[p[i]];
    return t;
};
import { stringify } from 'qs';
import request from '@/utils/request';
export function queryProjectNotice() {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/project/notice');
    });
}
export function queryActivities() {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/activities');
    });
}
export function queryRule(params) {
    return __awaiter(this, void 0, void 0, function* () {
        return request(`/api/rule?${stringify(params)}`);
    });
}
export function removeRule(params) {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/rule', {
            method: 'POST',
            data: Object.assign({}, params, { method: 'delete' }),
        });
    });
}
export function addRule(params) {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/rule', {
            method: 'POST',
            data: Object.assign({}, params, { method: 'post' }),
        });
    });
}
export function updateRule(params = {}) {
    return __awaiter(this, void 0, void 0, function* () {
        return request(`/api/rule?${stringify(params.query)}`, {
            method: 'POST',
            data: Object.assign({}, params.body, { method: 'update' }),
        });
    });
}
export function fakeSubmitForm(params) {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/forms', {
            method: 'POST',
            data: params,
        });
    });
}
export function fakeChartData() {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/fake_chart_data');
    });
}
export function queryTags() {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/tags');
    });
}
export function queryBasicProfile(id) {
    return __awaiter(this, void 0, void 0, function* () {
        return request(`/api/profile/basic?id=${id}`);
    });
}
export function queryAdvancedProfile() {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/profile/advanced');
    });
}
export function queryFakeList(params) {
    return __awaiter(this, void 0, void 0, function* () {
        return request(`/api/fake_list?${stringify(params)}`);
    });
}
export function removeFakeList(params) {
    return __awaiter(this, void 0, void 0, function* () {
        const { count = 5 } = params, restParams = __rest(params, ["count"]);
        return request(`/api/fake_list?count=${count}`, {
            method: 'POST',
            data: Object.assign({}, restParams, { method: 'delete' }),
        });
    });
}
export function addFakeList(params) {
    return __awaiter(this, void 0, void 0, function* () {
        const { count = 5 } = params, restParams = __rest(params, ["count"]);
        return request(`/api/fake_list?count=${count}`, {
            method: 'POST',
            data: Object.assign({}, restParams, { method: 'post' }),
        });
    });
}
export function updateFakeList(params) {
    return __awaiter(this, void 0, void 0, function* () {
        const { count = 5 } = params, restParams = __rest(params, ["count"]);
        return request(`/api/fake_list?count=${count}`, {
            method: 'POST',
            data: Object.assign({}, restParams, { method: 'update' }),
        });
    });
}
export function fakeAccountLogin(params) {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/login/account', {
            method: 'POST',
            data: params,
        });
    });
}
export function fakeRegister(params) {
    return __awaiter(this, void 0, void 0, function* () {
        return request('/api/register', {
            method: 'POST',
            data: params,
        });
    });
}
export function queryNotices(params = {}) {
    return __awaiter(this, void 0, void 0, function* () {
        return request(`/api/notices?${stringify(params)}`);
    });
}
export function getFakeCaptcha(mobile) {
    return __awaiter(this, void 0, void 0, function* () {
        return request(`/api/captcha?mobile=${mobile}`);
    });
}
//# sourceMappingURL=api.js.map