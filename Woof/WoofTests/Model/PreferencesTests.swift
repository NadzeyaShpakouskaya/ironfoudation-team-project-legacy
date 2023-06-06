import XCTest

final class PreferencesTests: XCTestCase {
    func testPreferencesExistsInAPI() {
        _ = Preferences()
    }

    func testPreferencesReturnsNilForSelectedRoleWhenNewInstancePreferencesInitialized() {
        let preferences = Preferences()

        XCTAssertNil(preferences.selectedRole)
    }

    func testPreferencesReturnsExpectedValueForSelectedRoleWhenItChangedToSitterRole() {
        var preferences = Preferences()
        preferences.selectedRole = .sitter

        XCTAssertEqual(preferences.selectedRole, Role.sitter)
    }

    func testPreferencesReturnsExpectedValueForSelectedRoleWhenItChangedToOwnerRole() {
        var preferences = Preferences()
        preferences.selectedRole = .owner

        XCTAssertEqual(preferences.selectedRole, Role.owner)
    }
}
