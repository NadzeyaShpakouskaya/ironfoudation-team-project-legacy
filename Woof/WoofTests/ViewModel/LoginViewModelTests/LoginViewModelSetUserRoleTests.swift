import XCTest

final class LoginViewModelSetUserRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private let testLoginViewModel = LoginViewModel()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        _ = testLoginViewModel.set(.sitter)
    }

    func testReturnsTrueWhenPassAllPossibleRoles() {
        Role.allCases.forEach {
            XCTAssertTrue(testLoginViewModel.set($0))
        }
    }

    func testOverridesThePreviouslySavedRole() {
        // Given
        let initialRole = Role.sitter
        let overriddenRole = Role.owner
        _ = testLoginViewModel.set(initialRole)

        // When
        _ = testLoginViewModel.set(overriddenRole)

        // Then
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), initialRole)
        XCTAssertEqual(PreferencesHandler.getUserRole(), overriddenRole)
    }
}
