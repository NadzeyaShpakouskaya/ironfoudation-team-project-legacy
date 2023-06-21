import XCTest

final class WoofProductionEndpointTests: XCTestCase {
    func testWoofProductionEndpointAndItPropertiesExistsInAPI() {
        _ = WoofProductionEndpoint.baseURL
        _ = WoofProductionEndpoint.key
        _ = WoofProductionEndpoint.authHeader
    }

    func testWoofProductionEndpointHTTPRequestContainsAllCases() {
        _ = WoofProductionEndpoint.Request.getAllSitters
        _ = WoofProductionEndpoint.Request.addNewSitter(Data())
    }
}
