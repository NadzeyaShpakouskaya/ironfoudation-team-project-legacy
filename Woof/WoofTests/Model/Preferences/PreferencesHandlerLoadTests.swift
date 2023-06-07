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
        // Given
        // When
        // Then
        _ = PreferencesHandler.getUserRole()
    }

    func testLoadSelectedRoleReturnsExpectedRole() {
        // Given
        // When
        _ = PreferencesHandler.set(userRole: .owner)

        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), .owner)
    }

    func testLoadSelectedRoleReturnsDefaultCaseForNonExistingPreferencesObject() {
        // Given
        // When
        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), .none)
    }

    func testLoadSelectedRoleReturnsExpectedRoleWhenRewrittenByNonDefaultCase() {
        // Given
        let overriddenRole: Role = .sitter
        _ = PreferencesHandler.set(userRole: .owner)
        
        // When
        _ = PreferencesHandler.set(userRole: overriddenRole)

        // Then
        XCTAssertEqual(PreferencesHandler.getUserRole(), overriddenRole)
    }
}
