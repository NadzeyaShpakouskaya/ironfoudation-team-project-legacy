import XCTest

final class PreferencesHandlerGetUserRoleTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.preferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testExistsInAPI() {
        PreferencesHandler.getUserRole()
    }

    func testReturnsNoneForEmptyStorage() {
        XCTAssertEqual(PreferencesHandler.getUserRole(), .none)
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
        let repeatedRoles = Array(repeating: Role.allCases, count: 4).flatMap { $0 }
        repeatedRoles.forEach {
            PreferencesHandler.set(userRole: $0)
        }

        // When
        let lastRole = PreferencesHandler.getUserRole()

        // Then
        XCTAssertEqual(lastRole, repeatedRoles.last)
    }
}
