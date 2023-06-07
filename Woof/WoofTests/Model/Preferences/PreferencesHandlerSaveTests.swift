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

    func testSaveSelectedRoleReturnsTrueWhenUsing() {
        XCTAssertTrue(PreferencesHandler.saveSelectedRole(.sitter))
    }
}
