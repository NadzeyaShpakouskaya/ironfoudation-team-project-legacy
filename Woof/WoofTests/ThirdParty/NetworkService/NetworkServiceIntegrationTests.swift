import NetworkService
import XCTest

final class NetworkServiceIntegrationTests: XCTestCase {
    func testNetworkServicePresentsInAPI() {
        _ = NetworkService<WoofAppEndpoint>()
    }
}
