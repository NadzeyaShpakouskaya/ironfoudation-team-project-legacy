import XCTest

final class SetSitterWillBeModifiedFirstTimeTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        _ = PreferencesHandler.setSitterWillBeModifiedFirstTime(to: true)
    }

    func testOverridesTheInitialValueToFalse() {
        // Given
        XCTAssertTrue(PreferencesHandler.getAppSettings().isSitterModifiedFirstTime)

        // When
        PreferencesHandler.setSitterWillBeModifiedFirstTime(to: false)

        // Then
        XCTAssertFalse(PreferencesHandler.getAppSettings().isSitterModifiedFirstTime)
    }

    func testOverridesTheInitialValueCorrectly() {
        // Given
        XCTAssertTrue(PreferencesHandler.getAppSettings().isSitterModifiedFirstTime)

        // When
        PreferencesHandler.setSitterWillBeModifiedFirstTime(to: false)
        XCTAssertFalse(PreferencesHandler.getAppSettings().isSitterModifiedFirstTime)
        PreferencesHandler.setSitterWillBeModifiedFirstTime(to: true)

        // Then
        XCTAssertTrue(PreferencesHandler.getAppSettings().isSitterModifiedFirstTime)
    }
}
