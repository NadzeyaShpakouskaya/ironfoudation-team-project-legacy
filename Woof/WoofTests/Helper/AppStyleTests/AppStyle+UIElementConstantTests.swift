import XCTest

final class UIElementConstantTests: XCTestCase {
    func testAllUIElementsSizesReturnCorrectValues() {
        let borderStroke = 12.0
        let cornerRadius = 10.0
        let minPadding = 4.0
        let avatarSideSize = 80.0
        let spacingBetweenElements = 8.0

        XCTAssertEqual(borderStroke, AppStyle.UIElementConstant.borderStroke)
        XCTAssertEqual(cornerRadius, AppStyle.UIElementConstant.cornerRadius)
        XCTAssertEqual(minPadding, AppStyle.UIElementConstant.minPadding)
        XCTAssertEqual(avatarSideSize, AppStyle.UIElementConstant.avatarSideSize)
        XCTAssertEqual(spacingBetweenElements, AppStyle.UIElementConstant.spacingBetweenElements)
    }
}
