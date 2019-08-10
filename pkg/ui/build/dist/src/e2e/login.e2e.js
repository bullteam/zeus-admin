var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
const BASE_URL = `http://localhost:${process.env.PORT || 8000}`;
describe('Login', () => {
    beforeAll(() => __awaiter(this, void 0, void 0, function* () {
        jest.setTimeout(1000000);
    }));
    beforeEach(() => __awaiter(this, void 0, void 0, function* () {
        yield page.goto(`${BASE_URL}/user/login`, { waitUntil: 'networkidle2' });
        yield page.evaluate(() => window.localStorage.setItem('antd-pro-authority', 'guest'));
    }));
    it('should login with failure', () => __awaiter(this, void 0, void 0, function* () {
        yield page.waitForSelector('#userName', {
            timeout: 2000,
        });
        yield page.type('#userName', 'mockuser');
        yield page.type('#password', 'wrong_password');
        yield page.click('button[type="submit"]');
        yield page.waitForSelector('.ant-alert-error'); // should display error
    }));
    it('should login successfully', () => __awaiter(this, void 0, void 0, function* () {
        yield page.waitForSelector('#userName', {
            timeout: 2000,
        });
        yield page.type('#userName', 'admin');
        yield page.type('#password', 'ant.design');
        yield page.click('button[type="submit"]');
        yield page.waitForSelector('.ant-layout-sider h1'); // should display error
        const text = yield page.evaluate(() => document.body.innerHTML);
        expect(text).toContain('<h1>Ant Design Pro</h1>');
    }));
});
//# sourceMappingURL=login.e2e.js.map