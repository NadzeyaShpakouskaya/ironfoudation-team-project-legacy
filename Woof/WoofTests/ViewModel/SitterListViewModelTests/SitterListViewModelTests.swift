import NetworkService
import XCTest

final class SitterListViewModelTests: XCTestCase {
    override func setUp() {
        super.setUp()
        URLProtocol.registerClass(MockURLProtocol.self)
        viewModel = SitterListViewModel()
    }

    override func tearDown() {
        URLProtocol.unregisterClass(MockURLProtocol.self)
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testExample() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let url = try XCTUnwrap(request.url)
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: url,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }
    }

    func testExample2() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let url = try XCTUnwrap(request.url)
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: url,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, Data())
        }
    }

    func testExample3() async throws {
        // Given
        let data = try getData(fromJSON: "responseWithSitters")
        MockURLProtocol.requestHandler = { request in
            let url = try XCTUnwrap(request.url)
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: url,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, data)
        }

        // When
        await viewModel.fetchSitters()

        // Then
        XCTAssertEqual(Set(viewModel.sitters), DummyServerResponse.sitters)
    }

    // MARK: - Private interface

    private var viewModel: SitterListViewModel!
    private let endpoint = WoofAppEndpoint.getAllSitters

    private func getData(fromJSON fileName: String) throws -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File: \(fileName).json")
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
