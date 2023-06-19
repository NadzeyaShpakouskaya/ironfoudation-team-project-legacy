import XCTest

final class UserRoleViewModelResetCurrentRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private var userRoleViewModel = UserRoleViewModel()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        userRoleViewModel.resetCurrentRole()
    }

    func testMethodResetsTheOwnerRole() {
        // Given
        userRoleViewModel.setOwnerRole()

        // When
        userRoleViewModel.resetCurrentRole()

        // Then
        XCTAssertEqual(userRoleViewModel.userRole, .none)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .none)
    }

    func testMethodResetsTheSitterRole() {
        // Given
        userRoleViewModel.setSitterRole()

        // When
        userRoleViewModel.resetCurrentRole()

        // Then
        XCTAssertEqual(userRoleViewModel.userRole, .none)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .none)
    }
}
