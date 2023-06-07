import XCTest

final class PreferencesHandlerSaveTests: XCTestCase {
    override func setUp() {
        super.setUp()
        PreferencesHandlerTestHelper.cleanStorage()
    }

    override func tearDown() {
        PreferencesHandlerTestHelper.cleanStorage()
        super.tearDown()
    }

    func testSaveSelectedRoleExistInAPI() {
        _ = PreferencesHandler.saveSelectedRole(.sitter)
    }

    func testSaveSelectedRoleReturnsTrueWhenUsingWithAllCases() {
        Role.allCases.forEach { role in
            XCTAssertTrue(PreferencesHandler.saveSelectedRole(role))
        }
    }
}
