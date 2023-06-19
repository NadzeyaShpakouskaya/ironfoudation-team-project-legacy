import XCTest

final class UserRoleViewModelTests: XCTestCase {
    func testUserRoleManagerExistInAPI() {
        _ = UserRoleViewModel()
    }

    func testUserRoleCanBeCalledInUserRoleManager() {
        _ = UserRoleViewModel().userRole
    }
}
