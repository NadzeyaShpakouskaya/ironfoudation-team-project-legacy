import XCTest

final class PreferencesHandlerLoadTests: XCTestCase {
    override func setUp() {
        super.setUp()
        PreferencesHandlerTestHelper.cleanStorage()
    }

    override func tearDown() {
        PreferencesHandlerTestHelper.cleanStorage()
        super.tearDown()
    }

    func testLoadSelectedRoleExistInAPI() {
        _ = PreferencesHandler.loadSelectedRole()
    }

    func testLoadSelectedRoleReturnsExpectedRole() {
        _ = PreferencesHandler.saveSelectedRole(.owner)

        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), .owner)
    }

    func testLoadSelectedRoleReturnsDefaultCaseForNonExistingKey() {
        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), .none)
    }

    func testLoadSelectedRoleReturnsExpectedRoleWhenRewrittenByNonDefaultCase() {
        let rewrittenRole: Role = .sitter
        _ = PreferencesHandler.saveSelectedRole(.owner)
        _ = PreferencesHandler.saveSelectedRole(rewrittenRole)

        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), rewrittenRole)
    }
}
