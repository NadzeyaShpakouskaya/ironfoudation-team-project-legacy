import NetworkService
import XCTest

final class SitterProfileViewModelNetworkTests: XCTestCase {
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

    func testSuccessfulUploadDoesNotTriggerIsErrorOccurred() async throws {
        // Given
        let expectedStatusCode = 200
        MockURLProtocol.requestHandler = { request in
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: expectedStatusCode,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        // When
        try await viewModel.upload()

        // Then
        XCTAssertEqual(viewModel.isErrorOccurred, false)
    }

    func testBadRequestStatusCodeInResponseTriggersError() async {
        // Given // When
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

        // Then
        do {
            try await viewModel.upload()
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertEqual(viewModel.isErrorOccurred, true)
        }
    }

    func testAllErrorStatusCodesInResponseTriggersError() async {
        // Given // When
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

            // Then
            do {
                try await viewModel.upload()
                XCTFail("Expected failure for status code \(statusCode), but got success")
            } catch {
                XCTAssertEqual(viewModel.isErrorOccurred, true, "Error not triggered for status code \(statusCode)")
            }
        }
    }

    func testUploadSitterDataToBackEndSendsExpectedNumberOfRequests() async {
        // Given // When
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

        // Then
        do {
            try await viewModel.upload()
        } catch {
            XCTFail("Unexpected error: \(error)")
        }

        XCTAssertEqual(requestCount, 1, "Expected 1 request, but got \(requestCount) requests.")
    }
}
