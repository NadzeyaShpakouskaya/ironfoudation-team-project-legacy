import XCTest

final class LoginViewModelSetUserRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private let testLoginViewModel = LoginViewModel()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        testLoginViewModel.setUserRole()
    }

    func testSetsUserRoleOnOwner() {
        // Given
        testLoginViewModel.selectedRole = SelectedRole.owner

        // When
        let result = testLoginViewModel.setUserRole()

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .owner)
    }

    func testSetsUserRoleOnSitter() {
        // Given
        testLoginViewModel.selectedRole = .sitter

        // When
        let result = testLoginViewModel.setUserRole()

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .sitter)
    }

    func testSetsUserRoleWithNone() {
        // Given
        testLoginViewModel.selectedRole = .none

        // When
        let result = testLoginViewModel.setUserRole()

        // Then
        XCTAssertFalse(result)
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), .owner)
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), .sitter)
    }
}
