import XCTest

final class SitterMainTabViewModelTests: XCTestCase {
    func testSitterMainTabViewModelExistsInAPI() {
        _ = SitterMainTabViewModel()
    }

    func testResetCurrentSitterRoleMethodExistsInAPI() {
        SitterMainTabViewModel().resetCurrentRole()
    }

    func testResetCurrentRoleMethod() {
        PreferencesHandler.set(userRole: .sitter)
        XCTAssertNotNil(PreferencesHandler.set(userRole: .sitter))

        SitterMainTabViewModel().resetCurrentRole()
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }
}
