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

    func testSuccessfullyOverwritesTheDefaultValueForTheOwnerRole() {
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

    func testSuccessfullyOverwritesTheDefaultValueForTheSitterRole() {
        // Given
        let initialRole = Role.none
        let overriddenRole = Role.sitter
        testLoginViewModel.set(initialRole)

        // When
        testLoginViewModel.set(overriddenRole)

        // Then
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), initialRole)
        XCTAssertEqual(PreferencesHandler.getUserRole(), overriddenRole)
    }

    func testSuccessfullyOverwritesTheSitterRoleValueForDefault() {
        // Given
        let initialRole = Role.sitter
        let overriddenRole = Role.none
        testLoginViewModel.set(initialRole)

        // When
        testLoginViewModel.set(overriddenRole)

        // Then
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), initialRole)
        XCTAssertEqual(PreferencesHandler.getUserRole(), overriddenRole)
    }

    func testReturnsExpectedValueWhenOverridesThePreviouslySavedRole() {
        // Given
        let initialRole = Role.sitter
        let overriddenRole = Role.owner
        testLoginViewModel.set(initialRole)

        // When
        testLoginViewModel.set(overriddenRole)

        // Then
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), initialRole)
        XCTAssertEqual(PreferencesHandler.getUserRole(), overriddenRole)
    }
}
