import XCTest

final class StartScreenViewModelTests: XCTestCase {
    func testUserRoleManagerExistInAPI() {
        _ = UserRoleManager()
    }

    func testUserRoleCanBeCalledInUserRoleManager() {
        _ = UserRoleManager().userRole
    }
}
