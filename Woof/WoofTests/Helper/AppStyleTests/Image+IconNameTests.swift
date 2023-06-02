import Foundation
import XCTest

final class ImageIconNameTests: XCTestCase {
    func testAllIconNamesReturnCorrectValues() {
        let findSitterTabIconName = "magnifyingglass"
        let walkingsTabIconName = "pawprint"
        let profileTabIconName = "person.text.rectangle"
        let avatarPlaceholder = "person.circle"
        let filledStar = "star.fill"
        let unfilledStar = "star"
        let phone = "phone.fill"
        let filledPerson = "person.fill"
        let house = "house"

        XCTAssertEqual(findSitterTabIconName, String.IconName.findSitterTab)
        XCTAssertEqual(walkingsTabIconName, String.IconName.walkingsTab)
        XCTAssertEqual(profileTabIconName, String.IconName.profileTab)
        XCTAssertEqual(avatarPlaceholder, String.IconName.avatarPlaceholder)
        XCTAssertEqual(filledStar, String.IconName.filledStar)
        XCTAssertEqual(unfilledStar, String.IconName.unfilledStar)
        XCTAssertEqual(phone, String.IconName.phone)
        XCTAssertEqual(filledPerson, String.IconName.filledPerson)
        XCTAssertEqual(house, String.IconName.house)
    }
}
