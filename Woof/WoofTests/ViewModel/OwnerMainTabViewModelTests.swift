import XCTest

final class OwnerMainTabViewModelTests: XCTestCase {
    func testResetCurrentRoleMethodExistsInAPI() {
        OwnerMainTabViewModel().resetCurrentRole()
    }

    func testResetCurrentRoleChangesUserRoleToNone() {
        // Given
        PreferencesHandler.set(userRole: .owner)

        // When
        OwnerMainTabViewModel().resetCurrentRole()

        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }
}
