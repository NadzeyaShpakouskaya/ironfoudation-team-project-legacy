import XCTest

final class RoleTests: XCTestCase {
    func testAllRolesExistsInAPI() {
        _ = Role.owner
        _ = Role.sitter
    }
}
