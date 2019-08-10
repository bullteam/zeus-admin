var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import RouterConfig from '../../config/router.config';
const BASE_URL = `http://localhost:${process.env.PORT || 8000}`;
function formatter(data) {
    return data
        .reduce((pre, item) => {
        pre.push(item.path);
        return pre;
    }, [])
        .filter(item => item);
}
describe('Homepage', () => {
    const testPage = path => () => __awaiter(this, void 0, void 0, function* () {
        yield page.goto(`${BASE_URL}${path}`);
        yield page.waitForSelector('footer', {
            timeout: 2000,
        });
        const haveFooter = yield page.evaluate(() => document.getElementsByTagName('footer').length > 0);
        expect(haveFooter).toBeTruthy();
    });
    beforeAll(() => __awaiter(this, void 0, void 0, function* () {
        jest.setTimeout(1000000);
    }));
    formatter(RouterConfig[0].routes).forEach(route => {
        it(`test pages ${route}`, testPage(route));
    });
});
//# sourceMappingURL=userLayout.e2e.js.map