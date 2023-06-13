import XCTest

final class SitterMainTabViewModelTests: XCTestCase {
    func testSitterMainTabViewModelExistsInAPI() {
        SitterMainTabViewModel()
    }

    func testResertCurrentSitterRoleMethodExistsInAPI() {
        SitterMainTabViewModel().resertCurrentSitterRole()
    }

    func testResertCurrentSitterRoleMethod() {
        PreferencesHandler.set(userRole: .sitter)
        XCTAssertNotNil(PreferencesHandler.set(userRole: .sitter))

        SitterMainTabViewModel().resertCurrentSitterRole()
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }
}
