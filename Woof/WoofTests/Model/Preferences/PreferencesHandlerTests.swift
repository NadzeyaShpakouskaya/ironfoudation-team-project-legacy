import XCTest

final class PreferencesHandlerTests: XCTestCase {
    func testSaveSelectedRoleExistInAPI() {
        _ = PreferencesHandler.saveSelectedRole(.sitter)
    }

    func testLoadSelectedRoleExistInAPI() {
        _ = PreferencesHandler.loadSelectedRole()
    }

    func testSaveSelectedRoleReturnsTrue() {
        XCTAssertTrue(PreferencesHandler.saveSelectedRole(.owner))
    }

    func testLoadSelectedRoleReturnsExpectedRole() {
        let selectedRole: Role = .owner
        _ = PreferencesHandler.saveSelectedRole(selectedRole)

        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), selectedRole)
    }

    func testLoadSelectedRoleReturnsRewrittenNil() {
        let selectedRole: Role = .sitter
        _ = PreferencesHandler.saveSelectedRole(selectedRole)
        _ = PreferencesHandler.saveSelectedRole(nil)

        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), nil)
    }
}
