import XCTest

final class PreferencesHandlerGetUserRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        _ = PreferencesHandler.getUserRole()
    }

    func testReturnsNoneForEmptyStorage() {
        // Given
        // the empty storage

        // When
        let loadedRole = PreferencesHandler.getUserRole()

        // Then
        XCTAssertEqual(loadedRole, .none)
    }

    func testReturnsSavedRole() {
        // Given
        let role = Role.owner
        PreferencesHandler.set(userRole: role)

        // When
        let loadedRole = PreferencesHandler.getUserRole()

        // Then
        XCTAssertEqual(loadedRole, role)
    }

    func testSavesLastRoleWhenSetMethodCalledMultiplyTimes() {
        // Given
        Role.allCases.forEach {
            PreferencesHandler.set(userRole: $0)
        }

        // When
        let loadedRole = PreferencesHandler.getUserRole()

        // Then
        XCTAssertEqual(loadedRole, Role.none)
    }
}
