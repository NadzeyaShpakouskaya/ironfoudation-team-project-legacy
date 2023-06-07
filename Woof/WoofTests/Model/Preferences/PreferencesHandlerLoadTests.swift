import XCTest

final class PreferencesHandlerLoadTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UserPreferencesStorage.removeAll()
    }

    override func tearDown() {
        UserPreferencesStorage.removeAll()
        super.tearDown()
    }

    func testLoadSelectedRoleExistsInAPI() {
        _ = PreferencesHandler.getRole()
    }

    func testLoadSelectedRoleReturnsExpectedRole() {
        // Given
        // When
        _ = PreferencesHandler.set(userRole: .owner)

        // Then
        XCTAssertEqual(PreferencesHandler.getRole(), .owner)
    }

    func testLoadSelectedRoleReturnsDefaultCaseForNonExistingPreferencesObject() {
        // Given
        // When
        // Then
        XCTAssertEqual(PreferencesHandler.getRole(), .none)
    }

    func testLoadSelectedRoleReturnsExpectedRoleWhenRewrittenByNonDefaultCase() {
        // Given
        let overriddenRole: Role = .sitter

        // When
        _ = PreferencesHandler.set(userRole: .owner)
        _ = PreferencesHandler.set(userRole: overriddenRole)

        // Then
        XCTAssertEqual(PreferencesHandler.getRole(), overriddenRole)
    }
}
