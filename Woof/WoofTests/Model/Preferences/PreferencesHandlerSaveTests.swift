import XCTest

final class PreferencesHandlerSaveTests: XCTestCase {
    override func setUp() {
        super.setUp()
        PreferencesHandler.cleanStorage()
    }

    override func tearDown() {
        PreferencesHandler.cleanStorage()
        super.tearDown()
    }

    func testSaveSelectedRoleExistsInAPI() {
        _ = PreferencesHandler.saveSelectedRole(.sitter)
    }

    func testSaveSelectedRoleReturnsTrueWhenUsingWithAllCases() {
        Role.allCases.forEach { role in
            XCTAssertTrue(PreferencesHandler.saveSelectedRole(role))
        }
    }
}
