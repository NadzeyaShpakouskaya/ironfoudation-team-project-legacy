import XCTest

final class SitterMainTabViewModelTests: XCTestCase {
    override func setUp() {
        super.setUp()
        viewModel = SitterMainTabViewModel()
    }

    func testResetCurrentRoleMethodExistsInAPI() {
        viewModel.resetCurrentRole()
    }

    func testResetCurrentRoleChangesUserRoleToNone() {
        // Given
        PreferencesHandler.set(userRole: .sitter)

        // When
        viewModel.resetCurrentRole()

        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }

    func testIsAlertShownPropertyExistsInAPI() {
        _ = viewModel.isAlertShown
    }

    func testIsAlertShownPropertyReturnsAssignedValue() {
        viewModel.isAlertShown = true
        XCTAssertTrue(viewModel.isAlertShown)

        viewModel.isAlertShown = false
        XCTAssertFalse(viewModel.isAlertShown)
    }

    func testIsAlertShownPropertyReturnsFalseByDefault() {
        XCTAssertFalse(viewModel.isAlertShown)
    }

    func testIsLogoutConfirmedPropertyExistsInAPI() {
        _ = viewModel.isLogoutConfirmed
    }

    func testIsLogoutConfirmedPropertyReturnsAssignedValue() {
        viewModel.isLogoutConfirmed = true
        XCTAssertTrue(viewModel.isLogoutConfirmed)

        viewModel.isLogoutConfirmed = false
        XCTAssertFalse(viewModel.isLogoutConfirmed)
    }

    func testIsLogoutConfirmedPropertyReturnsFalseByDefault() {
        XCTAssertFalse(viewModel.isLogoutConfirmed)
    }

    // MARK: - Private interface

    private var viewModel = SitterMainTabViewModel()
}
