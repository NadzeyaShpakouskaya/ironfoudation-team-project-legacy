import XCTest

final class RoleFlowManagerTests: XCTestCase {
    private var userPreferencesStorage = KeyValueStorage.testPreferencesStorage
    private var roleFlowManager = RoleFlowManager()

    override func setUp() {
        super.setUp()
        userPreferencesStorage.deleteData(for: KeyValueStorage.Key.userPreferences)
    }

    func testRoleFlowManagerExistInAPI() {
        _ = roleFlowManager
    }

    func testUserRoleCanBeCalledInRoleFlowManager() {
        _ = RoleFlowManager().userRole
    }

    func testResetCurrentRoleMethodExistsInAPI() {
        roleFlowManager.resetCurrentRole()
    }

    func testResetCurrentRoleMethodResetsTheOwnerRole() {
        // Given
        roleFlowManager.setOwnerRole()

        // When
        roleFlowManager.resetCurrentRole()

        // Then
        XCTAssertEqual(roleFlowManager.userRole, .none)
    }

    func testResetCurrentRoleMethodResetsTheSitterRole() {
        // Given
        roleFlowManager.setSitterRole()

        // When
        roleFlowManager.resetCurrentRole()

        // Then
        XCTAssertEqual(roleFlowManager.userRole, .none)
    }

    func testSetOwnerRoleMethodExistsInAPI() {
        roleFlowManager.setOwnerRole()
    }

    func testSetOwnerRoleMethodSetsTheOwnerRole() {
        // Given
        roleFlowManager.resetCurrentRole()

        // When
        roleFlowManager.setOwnerRole()

        // Then
        XCTAssertEqual(roleFlowManager.userRole, .owner)
    }

    func testSetOwnerRoleMethodOverridesTheSetSitterRole() {
        // Given
        roleFlowManager.setSitterRole()

        // When
        roleFlowManager.setOwnerRole()

        // Then
        XCTAssertEqual(roleFlowManager.userRole, .owner)
    }

    func testSetSitterRoleMethodExistsInAPI() {
        roleFlowManager.setOwnerRole()
    }

    func testSetSitterRoleMethodSetsSitterRole() {
        // Given
        roleFlowManager.resetCurrentRole()

        // When
        roleFlowManager.setSitterRole()

        // Then
        XCTAssertEqual(roleFlowManager.userRole, .sitter)
    }

    func testSetSitterRoleMethodOverridesTheSetOwnerRole() {
        // Given
        roleFlowManager.setOwnerRole()

        // When
        roleFlowManager.setSitterRole()

        // Then
        XCTAssertEqual(roleFlowManager.userRole, .sitter)
    }
}
