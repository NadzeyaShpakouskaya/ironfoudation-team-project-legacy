import XCTest

final class StartScreenViewModelTests: XCTestCase {
    func testStartScreenViewModelExistInAPI() {
        _ = StartScreenViewModel()
    }

    func testUserRoleCanBeCalledInStartScreenViewModel() {
        _ = StartScreenViewModel().userRole
    }
}
