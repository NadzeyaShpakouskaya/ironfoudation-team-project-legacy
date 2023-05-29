import XCTest

final class CurrentOwnerUpdateTests: XCTestCase {
    func testUpdateMethodExistsInAPI() {
        _ = Owner.current.update(with: Owner())
    }
}
