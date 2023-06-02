import XCTest

final class OwnerProfileViewModelSaveTests: XCTestCase {
    func testSaveMethodExistsInAPI() {
        OwnerProfileViewModel().save()
    }

    func testSaveMethodSuccessfullySavedModifiedOwnerProperties() {
        let viewModel = OwnerProfileViewModel()

        let newName = Owner.Test.kateAnderson.name
        let newSurname = Owner.Test.kateAnderson.surname
        let newAddress = Owner.Test.kateAnderson.address
        let newPhone = Owner.Test.kateAnderson.phone

        viewModel.name = newName
        viewModel.surname = newSurname
        viewModel.address = newAddress
        viewModel.phone = newPhone

        viewModel.save()

        let loadedOwner = viewModel.getCurrentOwner()

        XCTAssertEqual(loadedOwner.name, newName)
        XCTAssertEqual(loadedOwner.surname, newSurname)
        XCTAssertEqual(loadedOwner.phone, newPhone)
        XCTAssertEqual(loadedOwner.address, newAddress)
    }
}
