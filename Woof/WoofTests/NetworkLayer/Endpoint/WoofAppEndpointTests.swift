import NetworkService
import XCTest

final class WoofAppEndpointTests: XCTestCase {
    func testAllWoofAppEndpointPropertiesAreAvailable() {
        let _ = WoofAppEndpoint.networkEnvironment
    }

    func testAllCasesForWoofAppEndpointExists() {
        let _ = WoofAppEndpoint.addNewSitter(Sitter())
    }

    func testAddNewSitterEndpointIsConfiguredCorrectly() {
        // Given
        let baseProdURL = URL(string: "https://woof-app.hasura.app/api/rest/") ?? Bundle.main.bundleURL
        let authHeader = "x-hasura-admin-secret"

        // When
        let sitter = Sitter()

        let endpoint = WoofAppEndpoint.addNewSitter(sitter)

        // Then
        XCTAssertEqual(endpoint.baseURL, baseProdURL)
        XCTAssertEqual(endpoint.path, WoofAppEndpoint.Path.addNewSitter)
        XCTAssertTrue(endpoint.headers.keys.contains(authHeader))

        switch endpoint.method {
        case .post: break
        default: XCTFail("Wrong method: expected `POST` method, but \(endpoint.method) was settled")
        }

        switch endpoint.task {
        // swiftlint:disable:next empty_enum_arguments
        case .requestWithBodyParameters(_): break
        default: XCTFail("Wrong task type: expected `requestWithBodyParameters` task, but \(endpoint.task) was settled")
        }
    }
}
