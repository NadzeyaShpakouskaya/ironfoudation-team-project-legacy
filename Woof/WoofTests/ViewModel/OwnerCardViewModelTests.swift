import XCTest

final class OwnerCardViewModelTests: XCTestCase {
    func testOwnerCardViewModelExistsInAPI() {
        let owner = Owner(
            id: UUID(),
            name: "Lara",
            surname: "Croft",
            phone: "802995349399",
            address: "My town, Happiness str. 24-67",
            rating: 4.8
        )

        _ = OwnerCardViewModel(owner: owner)
    }

    func testOwnerCardViewModelPropertiesReturnsExpectedValues() {
        let owner = Owner(
            id: UUID(),
            name: "Lara",
            surname: "Croft",
            phone: "802995349399",
            address: "My town, Happiness str. 24-67",
            rating: 4.8
        )

        let viewModel = OwnerCardViewModel(owner: owner)

        XCTAssertEqual(viewModel.fullName, "\(owner.name) \(owner.surname)")
        XCTAssertEqual(viewModel.phoneNumber, owner.phone)
        XCTAssertEqual(viewModel.address, owner.address)
        XCTAssertNil(viewModel.imageURL)
    }
}
