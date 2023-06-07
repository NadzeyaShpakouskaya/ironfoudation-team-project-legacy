import XCTest

final class PreferencesHandlerSaveTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UserPreferencesStorage.removeAll()
    }

    override func tearDown() {
        UserPreferencesStorage.removeAll()
        super.tearDown()
    }

    func testSaveSelectedRoleExistsInAPI() {
        _ = PreferencesHandler.set(userRole: .sitter)
    }

    func testSaveSelectedRoleReturnsTrueForPossibleRoleCase() {
        // Given
        // When
        // Then
        XCTAssertTrue(PreferencesHandler.set(userRole: .owner))
    }
}
