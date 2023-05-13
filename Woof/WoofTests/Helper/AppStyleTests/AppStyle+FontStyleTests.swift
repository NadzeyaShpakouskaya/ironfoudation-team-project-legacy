import XCTest

final class FontStyleTests: XCTestCase {
    func testAllFontSizesReturnCorrectValues() {
        let heading = 22.0
        let body = 18.0
        let footnote = 14.0

        XCTAssertEqual(heading, AppStyle.FontStyle.heading)
        XCTAssertEqual(body, AppStyle.FontStyle.body)
        XCTAssertEqual(footnote, AppStyle.FontStyle.footnote)
    }
}
