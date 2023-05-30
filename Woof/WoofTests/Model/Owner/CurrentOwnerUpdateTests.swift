import XCTest

final class CurrentOwnerUpdateTests: XCTestCase {
    private var current: Owner.CurrentOwner?

    override func setUp() {
        current?.delete()
        let new = Owner.current
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

    func testUpdateMethodUpdatesExistingOwnerWithNewValues() {
        let existingOwner = Owner.Test.kateAnderson
        _ = current?.update(with: existingOwner)

        let updatedOwner = Owner.Test.aleksPeterson
        _ = current?.update(with: updatedOwner)

        let retrievedOwner = current?.get()

        XCTAssertNotEqual(retrievedOwner?.name, existingOwner.name)
        XCTAssertNotEqual(retrievedOwner?.id, existingOwner.id)
        XCTAssertNotEqual(retrievedOwner?.name, existingOwner.name)
        XCTAssertNotEqual(retrievedOwner?.surname, existingOwner.surname)
        XCTAssertNotEqual(retrievedOwner?.address, existingOwner.address)
        XCTAssertNotEqual(retrievedOwner?.phone, existingOwner.phone)
        XCTAssertNotEqual(retrievedOwner?.rating, existingOwner.rating)
    }
}
