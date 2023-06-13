import XCTest

final class OwnerMainTabViewModelTests: XCTestCase {
    func testResetCurrentRoleMethodExistsInAPI() {
        OwnerMainTabViewModel().resetCurrentRole()
    }

    func testResetCurrentRoleSuccessfullyChangesUserRoleToNone() {
        // Given
        let initialRole = PreferencesHandler.set(userRole: .owner)
        XCTAssertNotNil(initialRole)

        // When
        OwnerMainTabViewModel().resetCurrentRole()

        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }
}
