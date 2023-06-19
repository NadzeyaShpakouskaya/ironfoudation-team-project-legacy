import XCTest

final class SitterMainTabViewModelTests: XCTestCase {
    override func setUp() {
        super.setUp()
        viewModel = SitterMainTabViewModel()
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

    private var viewModel = SitterMainTabViewModel()
}
