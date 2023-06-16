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

    func testIsAlertShownPropertyExistsInAPI() {
        _ = viewModel.isAlertShown
    }

    func testIsAlertShownPropertyReturnsAssignedValue() {
        // Given // When
        viewModel.isAlertShown = true

        // Then
        XCTAssertTrue(viewModel.isAlertShown)

        // Given // When
        viewModel.isAlertShown = false

        // Then
        XCTAssertFalse(viewModel.isAlertShown)
    }

    func testIsAlertShownPropertyReturnsFalseByDefault() {
        XCTAssertFalse(viewModel.isAlertShown)
    }

    func testIsLogoutConfirmedPropertyExistsInAPI() {
        _ = viewModel.isLogoutConfirmed
    }

    func testIsLogoutConfirmedPropertyReturnsAssignedValue() {
        // Given // When
        viewModel.isLogoutConfirmed = true

        // Then
        XCTAssertTrue(viewModel.isLogoutConfirmed)

        // Given // When
        viewModel.isLogoutConfirmed = false

        // Then
        XCTAssertFalse(viewModel.isLogoutConfirmed)
    }

    func testIsLogoutConfirmedPropertyReturnsFalseByDefault() {
        XCTAssertFalse(viewModel.isLogoutConfirmed)
    }

    // MARK: - Private interface

    private var viewModel = OwnerMainTabViewModel()
}
