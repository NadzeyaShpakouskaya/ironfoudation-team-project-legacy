import NetworkService
import XCTest

final class SitterProfileViewModelSaveTests: XCTestCase {
    private var viewModel: SitterProfileViewModel!

    override func setUp() {
        super.setUp()
        URLProtocol.registerClass(MockURLProtocol.self)
        viewModel = SitterProfileViewModel()
    }

    override func tearDown() {
        URLProtocol.unregisterClass(MockURLProtocol.self)
        viewModel = nil
        super.tearDown()
    }

    func testSaveMethodExistsInAPI() async {
        await SitterProfileViewModel().save()
    }

    func testSaveMethodSuccessfullySavedChangedSitterProperties() async {
        // Given
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

        let newName = Sitter.Test.johnSmith.name
        let newSurname = Sitter.Test.johnSmith.surname
        let newPhone = Sitter.Test.johnSmith.phone
        let newBio = Sitter.Test.johnSmith.bio
        let newPricePerHour = Sitter.Test.johnSmith.pricePerHour

        viewModel.name = newName
        viewModel.surname = newSurname
        viewModel.phone = newPhone
        viewModel.bio = newBio
        viewModel.pricePerHour = String(newPricePerHour)

        // When
        await viewModel.save()

        // Then
        let currentSitter = SitterProfileViewModel()

        XCTAssertEqual(currentSitter.name, newName)
        XCTAssertEqual(currentSitter.surname, newSurname)
        XCTAssertEqual(currentSitter.phone, newPhone)
        XCTAssertEqual(currentSitter.bio, newBio)
        XCTAssertEqual(currentSitter.pricePerHour, String(newPricePerHour))
    }

    func testSaveMethodCallsUploadMethodWithoutTriggeringError() async {
        // Given
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

        // When
        await viewModel.save()

        // Then
        XCTAssertEqual(viewModel.isErrorOccurred, false)
    }

    func testSaveMethodHandlesErrorStatusCode() async {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: 400,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        // When
        await viewModel.save()

        // Then
        XCTAssertEqual(viewModel.isErrorOccurred, true)
    }

    func testAllErrorStatusCodesInResponseTriggersError() async {
        // Given
        for statusCode in 400...499 {
            MockURLProtocol.requestHandler = { request in
                let response = try XCTUnwrap(
                    HTTPURLResponse(
                        url: XCTUnwrap(request.url),
                        statusCode: statusCode,
                        httpVersion: nil,
                        headerFields: nil
                    )
                )
                return (response, nil)
            }

            // When
            await viewModel.save()

            // Then
            XCTAssertEqual(viewModel.isErrorOccurred, true, "Error not triggered for status code \(statusCode)")
        }
    }

    func testUploadSitterDataToBackEndSendsExpectedNumberOfRequests() async {
        // Given
        var requestCount = 0

        MockURLProtocol.requestHandler = { request in
            requestCount += 1

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

        // When
        await viewModel.save()

        // Then
        XCTAssertEqual(requestCount, 1, "Expected 1 request, but got \(requestCount) requests.")
    }
}
