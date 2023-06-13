import XCTest

final class LoginViewModelTests: XCTestCase {
    func testLoginViewModelCanBeInitialized() {
        _ = LoginViewModel()
    }
    
    func testSetUserRoleReturnsTrueWhenPassAllPossibleRoles() {
        Role.allCases.forEach {
            XCTAssertTrue(LoginViewModel().setUserRole(userRole: $0))
        }
    }
}
