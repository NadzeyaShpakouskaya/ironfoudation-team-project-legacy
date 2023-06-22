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
        XCTAssertFalse(viewModel.isTheOwnerRoleSelected)
        XCTAssertFalse(viewModel.isTheSitterRoleSelected)
    }

    func testWhenIsTheOwnerRoleSelectedSetToTrueTheNewOwnerIsCreatedIfTheCurrentOwnerDoesNotExist() {
        // Given
        let currentOwner = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner)

        // When
        viewModel.isTheOwnerRoleSelected = true

        let newOwner = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner)

        // Then
        XCTAssertNil(currentOwner)
        XCTAssertNotNil(newOwner)
    }

    func testWhenIsTheOwnerRoleSelectedSetToTrueNoNewOwnerIsCreatedIfTheCurrentOwnerAlreadyExist() {
        // Given
        viewModel.isTheOwnerRoleSelected = true

        let currentOwner = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner)

        // When
        let newViewModel = LoginViewModel()

        newViewModel.isTheOwnerRoleSelected = true

        let newOwner = KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .loadData(for: KeyValueStorage.Key.currentOwner)

        // Then
        XCTAssertEqual(currentOwner, newOwner)
    }

    func testWhenIsTheSitterRoleSelectedSetToTrueTheNewSitterIsCreatedIfTheCurrentSitterDoesNotExist() {
        // Given
        let currentSitter = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter)

        // When
        viewModel.isTheSitterRoleSelected = true

        let newSitter = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter)

        // Then
        XCTAssertNil(currentSitter)
        XCTAssertNotNil(newSitter)
    }

    func testWhenIsTheSitterRoleSelectedSetToTrueNoNewSitterIsCreatedIfTheCurrentSitterAlreadyExist() {
        // Given
        viewModel.isTheSitterRoleSelected = true

        let currentSitter = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter)

        // When
        let newViewModel = LoginViewModel()

        newViewModel.isTheSitterRoleSelected = true

        let newSitter = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter)

        // Then
        XCTAssertEqual(currentSitter, newSitter)
    }
}
