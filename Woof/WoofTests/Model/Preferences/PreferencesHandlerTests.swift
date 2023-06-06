import XCTest

final class PreferencesHandlerTests: XCTestCase {
    override func setUp() {
        super.setUp()
        cleanStorage()
    }

    override func tearDown() {
        cleanStorage()
        super.tearDown()
    }

    func testSaveSelectedRoleExistInAPI() {
        _ = PreferencesHandler.saveSelectedRole(.sitter)
    }

    func testLoadSelectedRoleExistInAPI() {
        _ = PreferencesHandler.loadSelectedRole()
    }

    func testSaveSelectedRoleReturnsTrueWhenUsing() {
        XCTAssertTrue(PreferencesHandler.saveSelectedRole(.sitter))
    }

    func testLoadSelectedRoleReturnsExpectedRole() {
        _ = PreferencesHandler.saveSelectedRole(.owner)

        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), .owner)
    }

    func testLoadSelectedRoleReturnsNilForNonExistingKey() {
        XCTAssertNil(PreferencesHandler.loadSelectedRole())
    }

    func testLoadSelectedRoleReturnsNilWhenRoleRewrittenByNil() {
        let rewrittenRole: Role = .sitter
        _ = PreferencesHandler.saveSelectedRole(.owner)
        _ = PreferencesHandler.saveSelectedRole(rewrittenRole)

        XCTAssertEqual(PreferencesHandler.loadSelectedRole(), rewrittenRole)
    }

    private func cleanStorage() {
        let keyValueStorage = KeyValueStorage(KeyValueStorage.Name.preferences)
        keyValueStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }
}
