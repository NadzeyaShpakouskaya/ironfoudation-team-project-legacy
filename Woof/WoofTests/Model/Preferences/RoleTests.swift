import XCTest

final class RoleTests: XCTestCase {
    func testAllRolesExistInAPI() {
        _ = Role.owner
        _ = Role.sitter
    }
}
