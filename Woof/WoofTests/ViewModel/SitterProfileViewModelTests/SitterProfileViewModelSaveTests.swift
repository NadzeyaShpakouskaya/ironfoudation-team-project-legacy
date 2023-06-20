import XCTest

final class SitterProfileViewModelSaveTests: XCTestCase {
    func testSaveMethodExistsInAPI() {
        SitterProfileViewModel().save()
    }

    func testSaveMethodSuccessfullySavedChangedSitterProperties() {
        // Given
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
        viewModel.pricePerHour = String(newPricePerHour)

        // When
        viewModel.save()

        // Then
        guard let data = KeyValueStorage(KeyValueStorage.Name.currentSitter)
            .loadData(for: KeyValueStorage.Key.currentSitter) else {
            XCTFail("Unexpected storage error")
            return
        }
        guard let currentSitter = try? JSONDecoder().decode(Sitter.self, from: data) else {
            XCTFail("Unexpected decoding error")
            return
        }

        XCTAssertEqual(currentSitter.name, newName)
        XCTAssertEqual(currentSitter.surname, newSurname)
        XCTAssertEqual(currentSitter.phone, newPhone)
        XCTAssertEqual(currentSitter.bio, newBio)
        XCTAssertEqual(currentSitter.pricePerHour, newPricePerHour)
    }
}
