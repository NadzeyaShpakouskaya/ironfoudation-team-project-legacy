import XCTest

final class RoleTests: XCTestCase {
    func testAllRolesExistInAPI() {
        XCTAssertTrue(Role.allCases.contains(.owner))
        XCTAssertTrue(Role.allCases.contains(.sitter))
        XCTAssertTrue(Role.allCases.contains(.none))
    }
}
