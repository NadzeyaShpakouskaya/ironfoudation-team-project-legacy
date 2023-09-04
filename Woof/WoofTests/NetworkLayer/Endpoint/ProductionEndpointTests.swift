import NetworkService
import XCTest

final class ProductionEndpointTests: XCTestCase {
    func testAllProductionEndpointPropertiesAreAvailable() {
        let _ = WoofAppEndpoint.networkEnvironment
    }
}
