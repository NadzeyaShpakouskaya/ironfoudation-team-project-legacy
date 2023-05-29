import XCTest

final class CurrentOwnerGetTests: XCTestCase {
    func testGetMethodExistsInAPI() {
        _ = Owner.current.get()
    }
}
