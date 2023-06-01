import XCTest

final class OwnerProfileViewModelGetTests: XCTestCase {
    func testGetOwnerMethodExistsInAPI() {
        _ = OwnerProfileViewModel().getCurrentOwner()
    }

    func testGetOwnerMethodReturnsNewOwnerInstanceWhenThereIsNoSavedOwnerInformation() {
        KeyValueStorage(KeyValueStorage.Name.currentOwner)
            .deleteData(for: KeyValueStorage.Key.currentOwner)

        let owner = OwnerProfileViewModel().getCurrentOwner()

        XCTAssertEqual(owner.name, Owner().name)
        XCTAssertEqual(owner.surname, Owner().surname)
        XCTAssertEqual(owner.phone, Owner().phone)
        XCTAssertEqual(owner.address, Owner().address)
    }

    func testLoadMethodReturnsExpectedValuesWhenModifiedOwnerPropertiesWasSaved() {
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
