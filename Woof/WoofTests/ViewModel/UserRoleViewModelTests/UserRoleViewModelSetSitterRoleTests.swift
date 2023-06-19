import XCTest

final class UserRoleManagerSetSitterRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private var userRoleViewModel = UserRoleViewModel()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        userRoleViewModel.setSitterRole()
    }

    func testMethodSetsSitterRole() {
        // Given
        userRoleViewModel.resetCurrentRole()

        // When
        userRoleViewModel.setSitterRole()

        // Then
        XCTAssertEqual(userRoleViewModel.userRole, .sitter)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .sitter)
    }

    func testMethodOverridesTheSetOwnerRole() {
        // Given
        userRoleViewModel.setOwnerRole()

        // When
        userRoleViewModel.setSitterRole()

        // Then
        XCTAssertEqual(userRoleViewModel.userRole, .sitter)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .sitter)
    }
}
