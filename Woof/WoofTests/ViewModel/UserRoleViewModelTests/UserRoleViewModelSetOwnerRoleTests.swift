import XCTest

final class UserRoleManagerSetOwnerRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private var userRoleViewModel = UserRoleViewModel()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        userRoleViewModel.setOwnerRole()
    }

    func testMethodSetsTheOwnerRole() {
        // Given
        userRoleViewModel.resetCurrentRole()

        // When
        userRoleViewModel.setOwnerRole()

        // Then
        XCTAssertEqual(userRoleViewModel.userRole, .owner)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .owner)
    }

    func testMethodOverridesTheSetSitterRole() {
        // Given
        userRoleViewModel.setSitterRole()

        // When
        userRoleViewModel.setOwnerRole()

        // Then
        XCTAssertEqual(userRoleViewModel.userRole, .owner)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .owner)
    }
}
