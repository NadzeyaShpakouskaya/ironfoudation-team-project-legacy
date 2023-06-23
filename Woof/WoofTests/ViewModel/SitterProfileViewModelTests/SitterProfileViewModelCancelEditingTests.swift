import XCTest

final class SitterProfileViewModelCancelEditingTests: XCTestCase {
    func testCancelEditingMethodExistsInAPI() {
        SitterProfileViewModel().cancelEditing()
    }

    func testCancelEditingMethodSuccessfullyRestoresOriginalSitterProperties() {
        // Given
        let viewModel = SitterProfileViewModel()

        let originalName = viewModel.name
        let originalSurname = viewModel.surname
        let originalPhone = viewModel.phone
        let originalBio = viewModel.bio
        let originalPricePerHour = viewModel.pricePerHour

        viewModel.name = Sitter.Test.johnSmith.name
        viewModel.surname = Sitter.Test.johnSmith.surname
        viewModel.phone = Sitter.Test.johnSmith.phone
        viewModel.bio = Sitter.Test.johnSmith.bio
        viewModel.pricePerHour = String(Sitter.Test.johnSmith.pricePerHour)

        // When
        viewModel.cancelEditing()

        // Then
        XCTAssertEqual(viewModel.name, originalName)
        XCTAssertEqual(viewModel.surname, originalSurname)
        XCTAssertEqual(viewModel.phone, originalPhone)
        XCTAssertEqual(viewModel.bio, originalBio)
        XCTAssertEqual(viewModel.pricePerHour, String(originalPricePerHour))
    }
}
