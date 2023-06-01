import XCTest

final class OwnerProfileViewModelTests: XCTestCase {
    func testOwnerProfileViewModelCanBeInitialized() {
        _ = OwnerProfileViewModel()
    }

    func testOwnerProfileViewModelInitializedWithPreviouslySavedData() {
        let savingOwnerVM = OwnerProfileViewModel()

        let savedName = "Kate"
        let savedSurname = "Anderson"
        let savedAddress = "new address"
        let savedPhone = "new phone"

        savingOwnerVM.name = savedName
        savingOwnerVM.surname = savedSurname
        savingOwnerVM.address = savedAddress
        savingOwnerVM.phone = savedPhone

        savingOwnerVM.save()

        let newViewModel = OwnerProfileViewModel()

        XCTAssertEqual(newViewModel.name, savedName)
        XCTAssertEqual(newViewModel.surname, savedSurname)
        XCTAssertEqual(newViewModel.phone, savedPhone)
        XCTAssertEqual(newViewModel.address, savedAddress)
    }
}
