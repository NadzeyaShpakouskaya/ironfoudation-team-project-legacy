import XCTest

final class DetailPetSitterViewModelTests: XCTestCase {
    func testDetailPetSitterViewModelExistsInAPI() {
        let sitter = Sitter(
            id: UUID(),
            name: "Ann",
            surname: "Anderson",
            phone: "132451",
            bio: "Some random text",
            rating: 4.7,
            pricePerHour: 14
        )

        _ = DetailSitterViewModel(sitter: sitter)
    }

    func testDetailPetSitterViewModelPropertiesReturnsExpectedValues() {
        let sitter = Sitter(
            id: UUID(),
            name: "Ann",
            surname: "Anderson",
            phone: "132451",
            bio: "Some random text",
            rating: 4.0,
            pricePerHour: 14
        )

        let viewModel = DetailSitterViewModel(sitter: sitter)

        XCTAssertEqual(viewModel.fullName, "\(sitter.name) \(sitter.surname)")
        XCTAssertEqual(viewModel.phoneNumber, sitter.phone)
        XCTAssertEqual(viewModel.bio, sitter.bio)
        XCTAssertEqual(viewModel.rating, .rated(.fourStars))
        XCTAssertNil(viewModel.imageURL)
    }
}
