import XCTest

final class PreferencesHandlerSaveTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.preferencesStorage

    override func setUp() {
        super.setUp()
        userPreferencesStorage.removeAll()
    }

    override func tearDown() {
        userPreferencesStorage.removeAll()
        super.tearDown()
    }

    func testSaveSelectedRoleExistsInAPI() {
        // Given
        // When
        // Then
        _ = PreferencesHandler.set(userRole: .sitter)
    }

    func testSaveSelectedRoleReturnsTrueForAvailableRoleCases() {
        // Given
        // When
        // Then
        XCTAssertTrue(PreferencesHandler.set(userRole: .owner))
    }
}
