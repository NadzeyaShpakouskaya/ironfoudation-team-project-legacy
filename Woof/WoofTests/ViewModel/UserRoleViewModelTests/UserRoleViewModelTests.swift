import XCTest

final class UserRoleViewModelTests: XCTestCase {
    func testUserRoleViewModelExistInAPI() {
        _ = UserRoleViewModel()
    }

    func testUserRoleCanBeCalledInUserRoleViewModel() {
        _ = UserRoleViewModel().userRole
    }
}
