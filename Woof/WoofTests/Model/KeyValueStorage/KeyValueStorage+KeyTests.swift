import XCTest

final class KeyValueStorageKeyTests: XCTestCase {
    func testAllKeysReturnExpectedValues() {
        XCTAssertEqual(KeyValueStorage.Key.currentOwner, "currentOwner")
        XCTAssertEqual(KeyValueStorage.Key.currentSitter, "currentSitter")
        XCTAssertEqual(KeyValueStorage.Key.userPreferences, "userPreferences")
    }
}
