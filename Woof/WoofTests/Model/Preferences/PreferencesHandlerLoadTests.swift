import XCTest

final class PreferencesHandlerLoadTests: XCTestCase {
    override func setUp() {
        super.setUp()
        PreferencesHandler.cleanStorage()
    }

    override func tearDown() {
        PreferencesHandler.cleanStorage()
        super.tearDown()
    }

    func testLoadSelectedRoleExistsInAPI() {
        _ = PreferencesHandler.loadSelectedRole()
    }

    func testLoadSelectedRoleReturnsExpectedRole() {
        _ = PreferencesHandler.saveSelectedRole(.owner)

        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), .owner)
    }

    func testLoadSelectedRoleReturnsDefaultCaseForNonExistingPreferencesobject() {
        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), .none)
    }

    func testLoadSelectedRoleReturnsExpectedRoleWhenRewrittenByNonDefaultCase() {
        let rewrittenRole: Role = .sitter
        _ = PreferencesHandler.saveSelectedRole(.owner)
        _ = PreferencesHandler.saveSelectedRole(rewrittenRole)

        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), rewrittenRole)
    }
}
