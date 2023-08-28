import NetworkService
import XCTest

final class ProductionEndpointTests: XCTestCase {
    func testProductionEndpointConformsToHTTPAPIEndpoint() {
        XCTAssertNotNil(ProductionEndpoint.self is any HTTPAPIEndpoint.Type)
    }
}
