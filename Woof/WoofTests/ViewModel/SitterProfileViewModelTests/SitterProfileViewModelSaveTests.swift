import XCTest

final class SitterProfileViewModelSaveTests: XCTestCase {
    func testSaveMethodExistsInAPI() {
        SitterProfileViewModel().save()
    }

    func testSaveMethodSuccessfullySavedChangedSitterProperties() throws {
        // Given
        let viewModel = SitterProfileViewModel()

        let newName = Sitter.Test.johnSmith.name
        let newSurname = Sitter.Test.johnSmith.surname
        let newPhone = try XCTUnwrap(Sitter.Test.johnSmith.phone)
        let newBio = Sitter.Test.johnSmith.bio
        let newPricePerHour = try XCTUnwrap(Sitter.Test.johnSmith.pricePerHour)

        viewModel.name = newName
        viewModel.surname = newSurname
        viewModel.phone = newPhone
        viewModel.bio = newBio
        viewModel.pricePerHour = String(newPricePerHour)

        // When
        viewModel.save()

        // Then
        let currentSitter = SitterProfileViewModel()

        XCTAssertEqual(currentSitter.name, newName)
        XCTAssertEqual(currentSitter.surname, newSurname)
        XCTAssertEqual(currentSitter.phone, newPhone)
        XCTAssertEqual(currentSitter.bio, newBio)
        XCTAssertEqual(currentSitter.pricePerHour, String(newPricePerHour))
    }
}
