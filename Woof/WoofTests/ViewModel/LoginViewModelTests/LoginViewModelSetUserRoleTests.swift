import XCTest

final class LoginViewModelSetUserRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private let testLoginViewModel = LoginViewModel()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        _ = testLoginViewModel.set(.sitter)
    }

    func testReturnsTrueWhenSetEveryPossibleRole() {
        Role.allCases.forEach {
            XCTAssertTrue(testLoginViewModel.set($0))
        }
    }

    func testReturnsExpectedValueWhenOverridesThePreviouslySavedRole() {
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
