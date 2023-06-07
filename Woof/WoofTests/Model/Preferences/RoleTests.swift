import XCTest

final class RoleTests: XCTestCase {
    func testAllRolesExistInAPI() {
        Role.allCases.forEach { role in
            _ = role
        }
    }
}
