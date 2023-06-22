import NetworkService
import XCTest

final class NetworkServiceIntegrationTests: XCTestCase {
    func testMethodTestUseFromNetworkServiceCanBeCalled() {
        NetworkService().testUse()
    }
}
