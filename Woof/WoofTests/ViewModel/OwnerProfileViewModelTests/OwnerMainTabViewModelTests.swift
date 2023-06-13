import XCTest

final class OwnerMainTabViewModelTests: XCTestCase {
    func testOwnerMainTabViewModelExistsInAPI() {
        OwnerMainTabViewModel()
    }

    func testResertCurrentOwnerRoleMethodExistsInAPI() {
        OwnerMainTabViewModel().resertCurrentOwnerRole()
    }

    func testResertCurrentOwnerRoleMethod() {
        PreferencesHandler.set(userRole: .owner)
        XCTAssertNotNil(PreferencesHandler.set(userRole: .owner))

        OwnerMainTabViewModel().resertCurrentOwnerRole()
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }
}
