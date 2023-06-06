import XCTest

final class KeyValueStorageNameTests: XCTestCase {
    func testAllStorageNameReturnExpectedValues() {
        XCTAssertEqual(KeyValueStorage.Name.currentOwner, "CurrentOwnerStorage")
        XCTAssertEqual(KeyValueStorage.Name.currentSitter, "CurrentSitterStorage")
        XCTAssertEqual(KeyValueStorage.Name.preferences, "PreferencesStorage")
    }
}
