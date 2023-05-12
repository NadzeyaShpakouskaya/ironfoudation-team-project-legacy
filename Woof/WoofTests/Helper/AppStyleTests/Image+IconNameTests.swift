import SwiftUI
import XCTest

final class ImageIconNameTests: XCTestCase {
    func testAllIconNamesReturnCorrectValues() {
        let findSitterTabIconName = "magnifyingglass"
        let walkingsTabIconName = "pawprint"
        let profileTabIconName = "person.text.rectangle"
        let avatarPlaceholder = "person.circle"
        let filledStar = "star.fill"
        let unfilledStar = "star"

        XCTAssertEqual(findSitterTabIconName, Image.IconName.findSitterTab)
        XCTAssertEqual(walkingsTabIconName, Image.IconName.walkingsTab)
        XCTAssertEqual(profileTabIconName, Image.IconName.profileTab)
        XCTAssertEqual(avatarPlaceholder, Image.IconName.avatarPlaceholder)
        XCTAssertEqual(filledStar, Image.IconName.filledStar)
        XCTAssertEqual(unfilledStar, Image.IconName.unfilledStar)
    }
}
