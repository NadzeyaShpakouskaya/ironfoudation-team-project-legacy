import XCTest

final class LoginViewModelTests: XCTestCase {
    private var viewModel = LoginViewModel()

    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()

        KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .deleteData(for: KeyValueStorage.Key.currentOwner)
        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .deleteData(for: KeyValueStorage.Key.currentSitter)
    }

    func testLoginViewModelExistInAPI() {
        _ = viewModel
    }

    func testLoginViewModelIsInitializedWithExpectedValues() {
        XCTAssertFalse(viewModel.isOwnerRoleSelected)
        XCTAssertFalse(viewModel.isSitterRoleSelected)
    }

    func testWhenIsOwnerRoleSelectedSetToTrueTheNewOwnerIsCreatedIfTheCurrentOwnerDoesNotExist() {
        // Given
        let currentOwner = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner)

        // When
        viewModel.isOwnerRoleSelected = true

        let newOwner = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner)

        // Then
        XCTAssertNil(currentOwner)
        XCTAssertNotNil(newOwner)
    }

    func testWhenIsOwnerRoleSelectedSetToTrueNoNewOwnerIsCreatedIfTheCurrentOwnerAlreadyExist() {
        // Given
        viewModel.isOwnerRoleSelected = true

        let currentOwner = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner)

        // When
        let newViewModel = LoginViewModel()

        newViewModel.isOwnerRoleSelected = true

        let newOwner = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner)

        // Then
        XCTAssertEqual(currentOwner, newOwner)
    }

    func testWhenIsSitterRoleSelectedSetToTrueTheNewSitterIsCreatedIfTheCurrentSitterDoesNotExist() {
        // Given
        let currentSitter = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter)

        // When
        viewModel.isSitterRoleSelected = true

        let newSitter = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter)

        // Then
        XCTAssertNil(currentSitter)
        XCTAssertNotNil(newSitter)
    }

    func testWhenIsSitterRoleSelectedSetToTrueNoNewSitterIsCreatedIfTheCurrentSitterAlreadyExist() {
        // Given
        viewModel.isSitterRoleSelected = true

        let currentSitter = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter)

        // When
        let newViewModel = LoginViewModel()

        newViewModel.isSitterRoleSelected = true

        let newSitter = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter)

        // Then
        XCTAssertEqual(currentSitter, newSitter)
    }
}
