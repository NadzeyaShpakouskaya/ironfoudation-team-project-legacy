import XCTest

final class SitterProfileViewModelSaveTests: XCTestCase {
    func testSaveMethodExistsInAPI() {
        SitterProfileViewModel().save()
    }

    func testSaveMethodSuccessfullySavedModifiedSitterProperties() {
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
        XCTAssertEqual(loadedSitter.pricePerHour, newPricePerHour)
    }
}
