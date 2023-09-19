import XCTest

class SitterCodingKeysTests: XCTestCase {
    func testCodingKeysHasExpectedValues() {
        XCTAssertEqual(Sitter.CodingKeys.id.rawValue, "id")
        XCTAssertEqual(Sitter.CodingKeys.name.rawValue, "name")
        XCTAssertEqual(Sitter.CodingKeys.surname.rawValue, "surname")
        XCTAssertEqual(Sitter.CodingKeys.phone.rawValue, "phone")
        XCTAssertEqual(Sitter.CodingKeys.avatarUrl.rawValue, "avatarUrl")
        XCTAssertEqual(Sitter.CodingKeys.bio.rawValue, "bio")
        XCTAssertEqual(Sitter.CodingKeys.rating.rawValue, "rating")
        XCTAssertEqual(Sitter.CodingKeys.pricePerHour.rawValue, "rate_per_hour")
    }
}
