import XCTest

final class RoleFlowManagerTests: XCTestCase {
    func testRoleFlowManagerExistInAPI() {
        _ = RoleFlowManager()
    }

    func testCurrentRoleCanBeCalledInRoleFlowManager() {
        _ = RoleFlowManager().currentRole
    }
}
