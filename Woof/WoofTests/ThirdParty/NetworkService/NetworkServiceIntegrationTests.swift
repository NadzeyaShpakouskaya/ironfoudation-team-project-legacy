import NetworkService
import XCTest

final class NetworkServiceIntegrationTests: XCTestCase {
    func testMethodTestUseFromNetworkServiceCanBeCalled() {
        _ = NetworkService<WoofAppEndpoint>.init()
    }
}
