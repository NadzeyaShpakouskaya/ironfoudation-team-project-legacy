import NetworkService
import XCTest

final class SitterProfileViewModelTests: XCTestCase {
    override func setUp() {
        super.setUp()
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDown() {
        URLProtocol.unregisterClass(MockURLProtocol.self)
        super.tearDown()
    }

    func testSitterProfileViewModelCanBeInitialized() {
        _ = SitterProfileViewModel()
    }

    func testSitterProfileViewModelInitializedWithLastSavedData() async {
        // Given
        let savingSitterViewModel = SitterProfileViewModel()

        MockURLProtocol.requestHandler = { request in
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        let savedName = Sitter.Test.johnSmith.name
        let savedSurname = Sitter.Test.johnSmith.surname
        let savedPhone = Sitter.Test.johnSmith.phone
        let savedBio = Sitter.Test.johnSmith.bio
        let savedPricePerHour = Sitter.Test.johnSmith.pricePerHour

        savingSitterViewModel.name = savedName
        savingSitterViewModel.surname = savedSurname
        savingSitterViewModel.phone = savedPhone
        savingSitterViewModel.bio = savedBio
        savingSitterViewModel.pricePerHour = String(savedPricePerHour)

        // When
        await savingSitterViewModel.save()

        // Then
        let newViewModel = SitterProfileViewModel()

        XCTAssertEqual(newViewModel.name, savedName)
        XCTAssertEqual(newViewModel.surname, savedSurname)
        XCTAssertEqual(newViewModel.phone, savedPhone)
        XCTAssertEqual(newViewModel.bio, savedBio)
        XCTAssertEqual(newViewModel.pricePerHour, String(savedPricePerHour))
    }
}
