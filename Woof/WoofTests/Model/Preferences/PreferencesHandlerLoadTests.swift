import XCTest

final class PreferencesHandlerLoadTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.preferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.removeAll()
    }

    override func tearDown() {
        userPreferencesStorage.removeAll()
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

    func testLoadSelectedRoleReturnsDefaultCaseForEmptyStorage() {
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
