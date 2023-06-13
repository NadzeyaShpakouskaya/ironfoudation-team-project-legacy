import XCTest

final class PreferencesHandlerSetUserRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        PreferencesHandler.set(userRole: .sitter)
    }

    func testReturnsTrueWhenPassAllPossibleRoles() {
        Role.allCases.forEach {
            XCTAssertTrue(PreferencesHandler.set(userRole: $0))
        }
    }

    func testOverridesThePreviouslySavedRole() {
        // Given
        let initialRole = Role.owner
        let overriddenRole = Role.sitter
        PreferencesHandler.set(userRole: initialRole)

        // When
        PreferencesHandler.set(userRole: overriddenRole)

        // Then
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), initialRole)
        XCTAssertEqual(PreferencesHandler.getUserRole(), overriddenRole)
    }
}
