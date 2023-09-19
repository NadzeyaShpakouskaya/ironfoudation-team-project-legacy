import XCTest

final class GetAppSettingsTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        _ = PreferencesHandler.getAppSettings()
    }

    func testReturnsExpectedPropertyValuesForEmptyStorage() {
        // Given
        // the empty storage

        // When
        let settings = PreferencesHandler.getAppSettings()

        // Then
        XCTAssertEqual(settings.selectedRole, .none)
        XCTAssertTrue(settings.isSitterModifiedFirstTime)
    }

    func testReturnsExpectedValuesWhenRoleWasUpdated() {
        // Given
        PreferencesHandler.set(userRole: .owner)

        // When
        let settings = PreferencesHandler.getAppSettings()

        // Then
        XCTAssertEqual(settings.selectedRole, .owner)
    }

    func testReturnsExpectedValuesWhenIsSitterModifiedFirstTimeWasUpdated() {
        // Given
        PreferencesHandler.setSitterWillBeModifiedFirstTime(to: false)

        // When
        let settings = PreferencesHandler.getAppSettings()

        // Then
        XCTAssertFalse(settings.isSitterModifiedFirstTime)
    }

    func testReturnsExpectedValuesWhenMultipleParametersWereUpdated() {
        // Given
        PreferencesHandler.setSitterWillBeModifiedFirstTime(to: false)
        PreferencesHandler.set(userRole: .sitter)

        // When
        let settings = PreferencesHandler.getAppSettings()

        // Then
        XCTAssertFalse(settings.isSitterModifiedFirstTime)
        XCTAssertEqual(settings.selectedRole, .sitter)
    }
}
