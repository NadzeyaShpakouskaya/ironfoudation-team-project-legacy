import XCTest

final class UserRoleManagerSetOwnerRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private var userRoleManager = UserRoleManager()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        userRoleManager.setOwnerRole()
    }

    func testMethodSetsTheOwnerRole() {
        // Given
        userRoleManager.resetCurrentRole()

        // When
        userRoleManager.setOwnerRole()

        // Then
        XCTAssertEqual(userRoleManager.userRole, .owner)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .owner)
    }

    func testMethodOverridesTheSetSitterRole() {
        // Given
        userRoleManager.setSitterRole()

        // When
        userRoleManager.setOwnerRole()

        // Then
        XCTAssertEqual(userRoleManager.userRole, .owner)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .owner)
    }
}
