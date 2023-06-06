import XCTest

final class KeyValueStorageKeyTests: XCTestCase {
    func testAllKeysExists() {
        let currentOwner = "owner"
        let currentSitter = "sitter"
        let preferences = "preferences"

        XCTAssertEqual(KeyValueStorage.Key.currentOwner, currentOwner)
        XCTAssertEqual(KeyValueStorage.Key.currentSitter, currentSitter)
        XCTAssertEqual(KeyValueStorage.Key.preferences, preferences)
    }
}
