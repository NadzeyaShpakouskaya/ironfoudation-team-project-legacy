import XCTest

final class SitterMainTabViewModelTests: XCTestCase {
    func testResetCurrentRoleMethodExistsInAPI() {
        SitterMainTabViewModel().resetCurrentRole()
    }

    func testResetCurrentRoleChangesUserRoleToNone() {
        // Given
        PreferencesHandler.set(userRole: .sitter)

        // When
        SitterMainTabViewModel().resetCurrentRole()

        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }
}
