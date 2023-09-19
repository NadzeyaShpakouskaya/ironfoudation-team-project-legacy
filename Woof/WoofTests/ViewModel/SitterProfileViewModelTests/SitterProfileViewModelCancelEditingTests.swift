import XCTest

final class SitterProfileViewModelCancelEditingTests: XCTestCase {
    func testCancelEditingMethodExistsInAPI() {
        SitterProfileViewModel().cancelEditing()
    }

    func testCancelEditingMethodSuccessfullyRestoresOriginalSitterProperties() throws {
        // Given
        let viewModel = SitterProfileViewModel()

        let originalName = viewModel.name
        let originalSurname = viewModel.surname
        let originalPhone = viewModel.phone
        let originalBio = viewModel.bio
        let originalPricePerHour = viewModel.pricePerHour

        viewModel.name = Sitter.Test.johnSmith.name
        viewModel.surname = Sitter.Test.johnSmith.surname
        viewModel.phone = try XCTUnwrap(Sitter.Test.johnSmith.phone)
        viewModel.bio = Sitter.Test.johnSmith.bio
        let pricePerHour = try XCTUnwrap(Sitter.Test.johnSmith.pricePerHour)
        viewModel.pricePerHour = String(pricePerHour)

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
