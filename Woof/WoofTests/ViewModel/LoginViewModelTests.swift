import XCTest

final class LoginViewModelTests: XCTestCase {
    func testLoginViewModelExistInAPI() {
        _ = LoginViewModel()
    }

    func testLoginViewModelIsInitializedWithExpectedValues() {
        // Given // When
        let viewModel = LoginViewModel()

        // Then
        XCTAssertEqual(viewModel.isTheOwnerRoleSelected, false)
        XCTAssertEqual(viewModel.isTheSitterRoleSelected, false)
    }
}
