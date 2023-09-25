import NetworkService
import XCTest

final class SitterProfileViewModelTests: XCTestCase {
    override func setUp() {
        super.setUp()
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDown() {
        URLProtocol.unregisterClass(MockURLProtocol.self)
        super.tearDown()
    }

    func testSitterProfileViewModelCanBeInitialized() {
        _ = SitterProfileViewModel()
    }
}
