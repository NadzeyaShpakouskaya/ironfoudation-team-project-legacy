import SwiftUI
import XCTest

final class ImageIconNameTests: XCTestCase {
    func testAllIconNamesReturnCorrectValues() {
        let findSitterTabIconName = "magnifyingglass"
        let walkingsTabIconName = "pawprint"
        let profileTabIconName = "person.text.rectangle"
        let ownerCardIconName = "person.circle"

        XCTAssertEqual(findSitterTabIconName, Image.IconName.findSitterTab)
        XCTAssertEqual(walkingsTabIconName, Image.IconName.walkingsTab)
        XCTAssertEqual(profileTabIconName, Image.IconName.profileTab)
        XCTAssertEqual(ownerCardIconName, Image.IconName.ownerCard)
    }
}
