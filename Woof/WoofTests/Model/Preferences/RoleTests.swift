import XCTest

final class RoleTests: XCTestCase {
    func testAllRolesExistInAPI() {
        XCTAssertTrue(Role.allCases.contains(.owner))
        XCTAssertTrue(Role.allCases.contains(.sitter))
        XCTAssertTrue(Role.allCases.contains(.none))
    }

    func testExpectedRolesEqualToIncludedInAllCases() {
        XCTAssertEqual(Set(Role.allCases), Set([Role.owner, Role.sitter, Role.none]))
    }
}
