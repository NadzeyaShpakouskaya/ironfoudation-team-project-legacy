import XCTest

final class OwnerProfileViewModelSaveTests: XCTestCase {
    func testSaveMethodExistsInAPI() {
        OwnerProfileViewModel().save()
    }

    func testSaveMethodSuccessfullySavedModifiedOwnerProperties() {
        let viewModel = OwnerProfileViewModel()

        let newName = "Kate"
        let newSurname = "Anderson"
        let newAddress = "new address"
        let newPhone = "new phone"

        viewModel.name = newName
        viewModel.surname = newSurname
        viewModel.address = newAddress
        viewModel.phone = newPhone

        viewModel.save()

        let loadedOwner = viewModel.getOwner()

        XCTAssertEqual(loadedOwner.name, newName)
        XCTAssertEqual(loadedOwner.surname, newSurname)
        XCTAssertEqual(loadedOwner.phone, newPhone)
        XCTAssertEqual(loadedOwner.address, newAddress)
    }
}
