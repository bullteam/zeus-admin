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
    it('topmenu should have footer', () => __awaiter(this, void 0, void 0, function* () {
        const params = '/form/basic-form?navTheme=light&layout=topmenu';
        yield page.goto(`${BASE_URL}${params}`);
        yield page.waitForSelector('footer', {
            timeout: 2000,
        });
        const haveFooter = yield page.evaluate(() => document.getElementsByTagName('footer').length > 0);
        expect(haveFooter).toBeTruthy();
    }));
});
//# sourceMappingURL=topMenu.e2e.js.map