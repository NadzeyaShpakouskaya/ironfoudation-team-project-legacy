import NetworkService
import XCTest

final class WoofAppEndpointTests: XCTestCase {
    func testAllWoofAppEndpointPropertiesAreAvailable() {
        let _ = WoofAppEndpoint.networkEnvironment
    }

    func testAllCasesForWoofAppEndpointExists() {
        let _ = WoofAppEndpoint.addNewSitter(nil)
    }

    func testAddNewSitterEndpointIsConfiguredCorrectly() {
        // Given
        let baseProdURL = URL(string: "https://woof-app.hasura.app/api/rest/") ?? Bundle.main.bundleURL
        let authHeader = "x-hasura-admin-secret"

        // When
        let parameters = Sitter().asDictionary()

        let endpoint = WoofAppEndpoint.addNewSitter(parameters)

        // Then
        XCTAssertEqual(endpoint.baseURL, baseProdURL)
        XCTAssertEqual(endpoint.path, WoofAppEndpoint.Path.addNewSitter)
        XCTAssertTrue(endpoint.headers.keys.contains(authHeader))

        switch endpoint.method {
        case .post: break
        default: XCTFail("Unexpected scenario.")
        }

        switch endpoint.task {
        // swiftlint:disable:next empty_enum_arguments
        case .requestWithBodyParameters(_): break
        default: XCTFail("Unexpected scenario.")
        }
    }
}
