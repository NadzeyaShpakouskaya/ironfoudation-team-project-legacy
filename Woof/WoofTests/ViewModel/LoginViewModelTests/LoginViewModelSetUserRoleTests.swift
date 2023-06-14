import XCTest

final class LoginViewModelSetUserRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private let testLoginViewModel = LoginViewModel()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testMethodExistsInAPI() {
        testLoginViewModel.setUserRole(.none)
    }

    func testSetsUserRoleOnOwner() {
        // Given
        // When
        let result = testLoginViewModel.setUserRole(.owner)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .owner)
    }

    func testSetsUserRoleOnSitter() {
        // Given
        // When
        let result = testLoginViewModel.setUserRole(.sitter)

        // Then
        XCTAssertTrue(result)
        XCTAssertEqual(PreferencesHandler.getUserRole(), .sitter)
    }

    func testSetsUserRoleWithNone() {
        // Given
        // When
        let result = testLoginViewModel.setUserRole(.none)

        // Then
        XCTAssertFalse(result)
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), .owner)
        XCTAssertNotEqual(PreferencesHandler.getUserRole(), .sitter)
    }
}
