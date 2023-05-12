import XCTest

final class UIElementSizeTests: XCTestCase {
    func testAllUIElementsSizesReturnCorrectValues() {
        let stroke = 12.0
        let cornerRadius = 10.0
        let minPadding = 4.0
        let avatarSideSize = 80.0

        XCTAssertEqual(stroke, AppStyle.UIElementSize.stroke)
        XCTAssertEqual(cornerRadius, AppStyle.UIElementSize.cornerRadius)
        XCTAssertEqual(minPadding, AppStyle.UIElementSize.minPadding)
        XCTAssertEqual(avatarSideSize, AppStyle.UIElementSize.avatarSideSize)
    }
}
