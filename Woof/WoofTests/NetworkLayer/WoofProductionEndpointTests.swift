import XCTest

final class WoofProductionEndpointTests: XCTestCase {
    func testWoofProductionEndpointAndItPropertiesExistsInAPI() {
        _ = WoofProductionEndpoint.baseURL
        _ = WoofProductionEndpoint.key
        _ = WoofProductionEndpoint.authHeader
    }

    func testWoofProductionEndpointHTTPRequestContainsRequestValueForAllCases() {
        _ = WoofProductionEndpoint.HTTPRequest.getAllSitters.request
        _ = WoofProductionEndpoint.HTTPRequest.addNewSitter(Data()).request
    }
}
