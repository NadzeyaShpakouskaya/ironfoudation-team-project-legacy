import XCTest

final class SitterProfileViewModelCancelEditingTests: XCTestCase {
    func testCancelEditingMethodExistsInAPI() {
        SitterProfileViewModel().cancelEditing()
    }

    func testCancelEditingMethodSuccessfullyRestoresOriginalSitterProperties() {
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
        viewModel.cancelEditing()

        // Than
        let testSitter = SitterProfileViewModel()

        XCTAssertEqual(viewModel.name, testSitter.name)
        XCTAssertEqual(viewModel.surname, testSitter.surname)
        XCTAssertEqual(viewModel.phone, testSitter.phone)
        XCTAssertEqual(viewModel.bio, testSitter.bio)
        XCTAssertEqual(viewModel.pricePerHour, String(testSitter.pricePerHour))
    }
}
