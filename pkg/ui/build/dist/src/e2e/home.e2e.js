var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
const BASE_URL = `http://localhost:${process.env.PORT || 8000}`;
describe('Homepage', () => {
    beforeAll(() => __awaiter(this, void 0, void 0, function* () {
        jest.setTimeout(1000000);
    }));
    it('it should have logo text', () => __awaiter(this, void 0, void 0, function* () {
        yield page.goto(BASE_URL);
        yield page.waitForSelector('h1', {
            timeout: 5000,
        });
        const text = yield page.evaluate(() => document.getElementsByTagName('h1')[0].innerText);
        expect(text).toContain('Ant Design Pro');
    }));
});
//# sourceMappingURL=home.e2e.js.map