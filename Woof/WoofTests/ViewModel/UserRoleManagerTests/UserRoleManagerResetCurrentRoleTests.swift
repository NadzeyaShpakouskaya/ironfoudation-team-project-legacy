import XCTest

final class UserRoleManagerResetCurrentRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private var userRoleManager = UserRoleManager()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        userRoleManager.resetCurrentRole()
    }

    func testMethodResetsTheOwnerRole() {
        // Given
        userRoleManager.setOwnerRole()

        // When
        userRoleManager.resetCurrentRole()

        // Then
        XCTAssertEqual(userRoleManager.userRole, .none)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .none)
    }

    func testMethodResetsTheSitterRole() {
        // Given
        userRoleManager.setSitterRole()

        // When
        userRoleManager.resetCurrentRole()

        // Then
        XCTAssertEqual(userRoleManager.userRole, .none)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .none)
    }
}
