import XCTest

final class RoleFlowManagerTests: XCTestCase {
    func testRoleFlowManagerExistInAPI() {
        _ = RoleFlowManager()
    }

    func testUserRoleCanBeCalledInStartScreenViewModel() {
        _ = RoleFlowManager().currentRole
    }
}
