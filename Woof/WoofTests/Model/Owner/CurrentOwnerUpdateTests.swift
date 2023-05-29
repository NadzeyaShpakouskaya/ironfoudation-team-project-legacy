import XCTest

final class CurrentOwnerUpdateTests: XCTestCase {
    private var current: Owner.CurrentOwner?

    override func setUp() {
        current?.delete()
        let new = Owner.CurrentOwner(Owner.CurrentOwner.TestData.storageName)
        current = new
    }

    override func tearDown() {
        current?.delete()
        current = nil
        super.tearDown()
    }

    func testUpdateMethodExistsInAPI() {
        _ = current?.update(with: Owner())
    }
}
