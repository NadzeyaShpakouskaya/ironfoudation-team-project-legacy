import XCTest

final class PreferencesTests: XCTestCase {
    func testPreferencesExistInAPI() {
        _ = Preferences()
    }

    func testPreferencesReturnNilForSelectedRoleWhenNewInstancePreferencesInitialized() {
        let preferences = Preferences()

        XCTAssertNil(preferences.selectedRole)
    }

    func testPreferencesReturnExpectedValueForSelectedRoleWhenItChangedToSitterRole() {
        var preferences = Preferences()
        preferences.selectedRole = .sitter

        XCTAssertEqual(preferences.selectedRole, Role.sitter)
    }

    func testPreferencesReturnExpectedValueForSelectedRoleWhenItChangedToOwnerRole() {
        var preferences = Preferences()
        preferences.selectedRole = .owner

        XCTAssertEqual(preferences.selectedRole, Role.owner)
    }
}
