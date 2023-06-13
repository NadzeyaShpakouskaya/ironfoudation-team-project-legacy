import XCTest

final class SitterMainTabViewModelTests: XCTestCase {
    func testResetCurrentRoleMethodExistsInAPI() {
        SitterMainTabViewModel().resetCurrentRole()
    }

    func testResetCurrentRoleSuccessfullyChangesUserRoleToNone() {
        // Given
        let initialRole = PreferencesHandler.set(userRole: .sitter)
        XCTAssertNotNil(initialRole)

        // When
        SitterMainTabViewModel().resetCurrentRole()

        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }
}
