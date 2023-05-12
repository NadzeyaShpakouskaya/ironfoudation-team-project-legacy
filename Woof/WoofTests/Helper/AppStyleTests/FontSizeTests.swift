import XCTest

final class FontSizeTests: XCTestCase {
    func testAllFontSizesReturnCorrectValues() {
        let heading = 22.0
        let body = 18.0
        let footnote = 14.0

        XCTAssertEqual(heading, AppStyle.FontSize.heading)
        XCTAssertEqual(body, AppStyle.FontSize.body)
        XCTAssertEqual(footnote, AppStyle.FontSize.footnote)
    }
}
