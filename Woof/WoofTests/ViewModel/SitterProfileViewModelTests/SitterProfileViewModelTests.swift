import XCTest

final class SitterProfileViewModelTests: XCTestCase {
    func testSitterProfileViewModelCanBeInitialized() {
        _ = SitterProfileViewModel()
    }

    func testSitterProfileViewModelInitializedWithPreviouslySavedData() {
        let savingSitter = SitterProfileViewModel()

        let savedName = Sitter.Test.johnSmith.name
        let savedSurname = Sitter.Test.johnSmith.surname
        let savedPhone = Sitter.Test.johnSmith.phone
        let savedBio = Sitter.Test.johnSmith.bio
        let savedPricePerHour = Sitter.Test.johnSmith.pricePerHour

        savingSitter.name = savedName
        savingSitter.surname = savedSurname
        savingSitter.phone = savedPhone
        savingSitter.bio = savedBio
        savingSitter.pricePerHour = savedPricePerHour

        savingSitter.save()

        let newViewModel = SitterProfileViewModel()

        XCTAssertEqual(newViewModel.name, savedName)
        XCTAssertEqual(newViewModel.surname, savedSurname)
        XCTAssertEqual(newViewModel.phone, savedPhone)
        XCTAssertEqual(newViewModel.bio, savedBio)
        XCTAssertEqual(newViewModel.pricePerHour, savedPricePerHour)
    }
}
