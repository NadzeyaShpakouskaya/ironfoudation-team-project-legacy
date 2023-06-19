import XCTest

final class UserRoleManagerSetSitterRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private var userRoleManager = UserRoleManager()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        userRoleManager.setSitterRole()
    }

    func testMethodSetsSitterRole() {
        // Given
        userRoleManager.resetCurrentRole()

        // When
        userRoleManager.setSitterRole()

        // Then
        XCTAssertEqual(userRoleManager.userRole, .sitter)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .sitter)
    }

    func testMethodOverridesTheSetOwnerRole() {
        // Given
        userRoleManager.setOwnerRole()

        // When
        userRoleManager.setSitterRole()

        // Then
        XCTAssertEqual(userRoleManager.userRole, .sitter)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .sitter)
    }
}
