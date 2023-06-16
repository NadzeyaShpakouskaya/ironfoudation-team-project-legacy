import XCTest

final class OwnerMainTabViewModelTests: XCTestCase {
    override func setUp() {
        super.setUp()
        viewModel = OwnerMainTabViewModel()
    }

    func testResetCurrentRoleMethodExistsInAPI() {
        viewModel.resetCurrentRole()
    }

    func testResetCurrentRoleChangesUserRoleToNone() {
        // Given
        PreferencesHandler.set(userRole: .owner)

        // When
        viewModel.resetCurrentRole()

        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), Role.none)
    }

    func testAlertIsShownPropertyExistsInAPI() {
        _ = viewModel.alertIsShown
    }

    func testAlertIsShownReturnsAssignedValue() {
        viewModel.alertIsShown = true
        XCTAssertTrue(viewModel.alertIsShown)

        viewModel.alertIsShown = false
        XCTAssertFalse(viewModel.alertIsShown)
    }

    func testAlertIsShownReturnsFalseByDefault() {
        XCTAssertFalse(viewModel.alertIsShown)
    }

    func testLogoutIsConfirmedPropertyExistsInAPI() {
        _ = viewModel.logoutIsConfirmed
    }

    func testLogoutIsConfirmedReturnsAssignedValue() {
        viewModel.logoutIsConfirmed = true
        XCTAssertTrue(viewModel.logoutIsConfirmed)

        viewModel.logoutIsConfirmed = false
        XCTAssertFalse(viewModel.logoutIsConfirmed)
    }

    func testLogoutIsConfirmedReturnsFalseByDefault() {
        XCTAssertFalse(viewModel.logoutIsConfirmed)
    }

    // MARK: - Private interface

    private var viewModel = OwnerMainTabViewModel()
}
