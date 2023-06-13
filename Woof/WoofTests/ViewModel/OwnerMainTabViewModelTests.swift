import XCTest

final class OwnerMainTabViewModelTests: XCTestCase {
    func testOwnerMainTabViewModelExistsInAPI() {
        _ = OwnerMainTabViewModel()
    }

    func testResetCurrentOwnerRoleMethodExistsInAPI() {
        OwnerMainTabViewModel().resetCurrentRole()
    }

    func testResetCurrentOwnerRoleSuccessfullyChangesUserRoleToNone() {
        PreferencesHandler.set(userRole: .owner)
        XCTAssertNotNil(PreferencesHandler.set(userRole: .owner))

        OwnerMainTabViewModel().resetCurrentRole()
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }
}
