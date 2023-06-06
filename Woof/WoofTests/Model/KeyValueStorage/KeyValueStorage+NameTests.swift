import XCTest

final class KeyValueStorageNameTests: XCTestCase {
    func testAllStorageNameExists() {
        let ownerStorage = "CurrentOwnerStorage"
        let sitterStorage = "CurrentSitterStorage"
        let preferencesStorage = "PreferencesStorage"

        XCTAssertEqual(KeyValueStorage.Name.currentOwner, ownerStorage)
        XCTAssertEqual(KeyValueStorage.Name.currentSitter, sitterStorage)
        XCTAssertEqual(KeyValueStorage.Name.preferences, preferencesStorage)
    }
}
