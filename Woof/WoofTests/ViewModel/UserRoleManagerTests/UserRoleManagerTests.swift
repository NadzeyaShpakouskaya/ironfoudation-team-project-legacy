import XCTest

final class UserRoleManagerTests: XCTestCase {
    func testUserRoleManagerExistInAPI() {
        _ = UserRoleManager()
    }

    func testUserRoleCanBeCalledInUserRoleManager() {
        _ = UserRoleManager().userRole
    }
}
