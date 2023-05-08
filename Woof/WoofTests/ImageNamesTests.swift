import SwiftUI
import XCTest

final class ImageNamesTests: XCTestCase {
    func testAllIconNamesReturnCorrectValues() {
        let findSitterTabIconName = "magnifyingglass"
        let walkingsTabIconName = "pawprint"
        let profileTabIconName = "person.text.rectangle"

        XCTAssertEqual(findSitterTabIconName, Image.IconName.findSitterTab)
        XCTAssertEqual(walkingsTabIconName, Image.IconName.walkingsTab)
        XCTAssertEqual(profileTabIconName, Image.IconName.profileTab)
    }
}
