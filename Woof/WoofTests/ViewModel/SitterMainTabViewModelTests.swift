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

    func testAlertIsShownPropertyExistsInAPI() {
        _ = viewModel.alertIsShown
    }

    func testAlertIsShownPropertyReturnsAssignedValue() {
        viewModel.alertIsShown = true
        XCTAssertTrue(viewModel.alertIsShown)

        viewModel.alertIsShown = false
        XCTAssertFalse(viewModel.alertIsShown)
    }

    func testAlertIsShownPropertyReturnsFalseByDefault() {
        XCTAssertFalse(viewModel.alertIsShown)
    }

    func testLogoutIsConfirmedPropertyExistsInAPI() {
        _ = viewModel.logoutIsConfirmed
    }

    func testLogoutIsConfirmedPropertyReturnsAssignedValue() {
        viewModel.logoutIsConfirmed = true
        XCTAssertTrue(viewModel.logoutIsConfirmed)

        viewModel.logoutIsConfirmed = false
        XCTAssertFalse(viewModel.logoutIsConfirmed)
    }

    func testLogoutIsConfirmedPropertyReturnsFalseByDefault() {
        XCTAssertFalse(viewModel.logoutIsConfirmed)
    }

    // MARK: - Private interface

    private var viewModel = SitterMainTabViewModel()
}
