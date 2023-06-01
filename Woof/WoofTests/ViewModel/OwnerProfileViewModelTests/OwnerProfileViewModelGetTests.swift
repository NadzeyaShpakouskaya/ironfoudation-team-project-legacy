import XCTest

final class OwnerProfileViewModelGetTests: XCTestCase {
    func testGetOwnerMethodExistsInAPI() {
        _ = OwnerProfileViewModel().getOwner()
    }

    func testGetOwnerMethodReturnNewOwnerInstanceWhenThereIsNoSavedOwnerInformation() {
        KeyValueStorage(KeyValueStorage.StorageName.ownerStorage)
            .deleteData(for: KeyValueStorage.Key.ownerKey)

        let owner = OwnerProfileViewModel().getOwner()

        XCTAssertEqual(owner.name, Owner().name)
        XCTAssertEqual(owner.surname, Owner().surname)
        XCTAssertEqual(owner.phone, Owner().phone)
        XCTAssertEqual(owner.address, Owner().address)
        XCTAssertEqual(owner.avatarUrl, Owner().avatarUrl)
        XCTAssertEqual(owner.rating, Owner().rating)
    }

    func testLoadMethodReturnsExpectedValuesWhenModifiedOwnerPropertiesWasSaved() {
        let viewModel = OwnerProfileViewModel()

        let newName = Owner.Test.kateAnderson.name
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
