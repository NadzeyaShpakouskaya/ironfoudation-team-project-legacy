import XCTest

final class SitterProfileViewModelGetTests: XCTestCase {
    func testGetSitterMethodExistsInAPI() {
        _ = SitterProfileViewModel().getCurrentSitter()
    }

    func testGetSitterMethodReturnsNewSitterInstanceWhenThereIsNoSavedSitterInformation() {
        KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .deleteData(for: KeyValueStorage.Key.currentSitter)

        let sitter = SitterProfileViewModel().getCurrentSitter()

        XCTAssertEqual(sitter.name, Sitter().name)
        XCTAssertEqual(sitter.surname, Sitter().surname)
        XCTAssertEqual(sitter.phone, Sitter().phone)
        XCTAssertEqual(sitter.bio, Sitter().bio)
        XCTAssertEqual(sitter.pricePerHour, Sitter().pricePerHour)
    }

    func testLoadMethodReturnsExpectedValuesWhenModifiedSitterPropertiesWasSaved() {
        let viewModel = SitterProfileViewModel()

        let newName = Sitter.Test.johnSmith.name
        let newSurname = Sitter.Test.johnSmith.surname
        let newPhone = Sitter.Test.johnSmith.phone
        let newBio = Sitter.Test.johnSmith.bio
        let newPricePerHour = Sitter.Test.johnSmith.pricePerHour

        viewModel.name = newName
        viewModel.surname = newSurname
        viewModel.phone = newPhone
        viewModel.bio = newBio
        viewModel.pricePerHour = newPricePerHour

        viewModel.save()

        let loadedSitter = viewModel.getCurrentSitter()

        XCTAssertEqual(loadedSitter.name, newName)
        XCTAssertEqual(loadedSitter.surname, newSurname)
        XCTAssertEqual(loadedSitter.phone, newPhone)
        XCTAssertEqual(loadedSitter.bio, newBio)
    }
}
