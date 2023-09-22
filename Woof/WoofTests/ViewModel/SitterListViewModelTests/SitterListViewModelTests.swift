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

    func testViewModelStoresSittersWhichSentFromServer() async throws {
        // Given
        let data = try getData(fromJSON: "DataWithSitters")
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
        XCTAssertEqual(Set(viewModel.sitters), DummyServerResponseData.sitters)
    }

    func testViewModelStoresInitialValueWhenResponseFromServerHasNoSittersData() async throws {
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

        // When
        await viewModel.fetchSitters()

        // Then
        XCTAssertEqual(viewModel.sitters, [])
    }

    func testViewModelStoresInitialValueWhenResponseFromServerContainsNotConvertableIntoSittersData() async throws {
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

        // When
        await viewModel.fetchSitters()

        // Then
        XCTAssertEqual(viewModel.sitters, [])
    }

    func testViewModelStoresInitialValueWhenResponseFromServerIsNotSuccessful() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let url = try XCTUnwrap(request.url)
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: url,
                    statusCode: 400,
                    httpVersion: nil,
                    headerFields: nil
                )
            )
            return (response, nil)
        }

        // When
        await viewModel.fetchSitters()

        // Then
        XCTAssertEqual(Set(viewModel.sitters), [])
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
