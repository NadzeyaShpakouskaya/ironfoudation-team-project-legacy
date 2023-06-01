import XCTest

final class OwnerProfileViewModelTests: XCTestCase {
    func testOwnerProfileViewModelCanBeInitialized() {
        _ = OwnerProfileViewModel()
    }

    func testOwnerProfileViewModelInitializedWithPreviouslySavedData() {
        let savingOwnerVM = OwnerProfileViewModel()

        let savedName = Owner.Test.kateAnderson.name
        let savedSurname = Owner.Test.kateAnderson.surname
        let savedAddress = Owner.Test.kateAnderson.address
        let savedPhone = Owner.Test.kateAnderson.address

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
