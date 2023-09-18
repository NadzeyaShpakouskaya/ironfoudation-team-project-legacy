import NetworkService
import XCTest

final class SitterProfileViewModelUploadTests: XCTestCase {
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

    func testUploadSuccessfullyExecuted() async {
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

        do {
            try await viewModel.upload()
            XCTAssertEqual(viewModel.isErrorOccurred, false)
        } catch {}
    }

    func testBadRequestStatusCodeInResponseTriggersError() async {
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

        do {
            try await viewModel.upload()
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertEqual(viewModel.isErrorOccurred, true)
        }
    }

    func testRandomErrorStatusCodeInResponseTriggersError() async {
        let randomStatusCode = Int.random(in: 400...499)

        MockURLProtocol.requestHandler = { request in
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: XCTUnwrap(request.url),
                    statusCode: randomStatusCode,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        do {
            try await viewModel.upload()
            XCTFail("Expected failure for status code \(randomStatusCode), but got success")
        } catch {
            XCTAssertEqual(viewModel.isErrorOccurred, true)
        }
    }

    func testAllErrorStatusCodesInResponseTriggersError() async {
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

            do {
                try await viewModel.upload()
                XCTFail("Expected failure for status code \(statusCode), but got success")
            } catch {
                XCTAssertEqual(viewModel.isErrorOccurred, true, "Error not triggered for status code \(statusCode)")
            }
        }
    }

    func testUploadSitterDataToBackEndSendsExpectedNumberOfRequests() async {
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

        do {
            try await viewModel.upload()
        } catch {
            XCTFail("Unexpected error: \(error)")
        }

        XCTAssertEqual(requestCount, 1, "Expected 1 request, but got \(requestCount) requests.")
    }
}
