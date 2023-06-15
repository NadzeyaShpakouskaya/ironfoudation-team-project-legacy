import XCTest

final class LoginViewModelSetUserRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private let testLoginViewModel = LoginViewModel()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        testLoginViewModel.set(.sitter)
    }

    func testSetsEveryPossibleRole() {
        Role.allCases.forEach {
            // Given When
            testLoginViewModel.set($0)
            
            // Then
            XCTAssertEqual($0, PreferencesHandler.getUserRole())
        }
    }

    func testOverridesSavedNoneRoleValueWithOwnerRoleValue() {
        // Given
        let initialRole = Role.none
        let overriddenRole = Role.owner
        testLoginViewModel.set(initialRole)

        // When
        testLoginViewModel.set(overriddenRole)

        // Then
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), initialRole)
        XCTAssertEqual(PreferencesHandler.getUserRole(), overriddenRole)
    }
}
