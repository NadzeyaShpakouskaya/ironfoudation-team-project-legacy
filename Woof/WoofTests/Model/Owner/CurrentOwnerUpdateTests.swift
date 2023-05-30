import XCTest

final class CurrentOwnerUpdateTests: XCTestCase {
    private var current: Owner.CurrentOwner?

    override func setUp() {
        Owner.current = Owner.CurrentOwner(Owner.testStorage)
        current = Owner.current
        Owner.deleteDataFor(storageName: Owner.testStorage)
    }

    override func tearDown() {
        Owner.deleteDataFor(storageName: Owner.testStorage)
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
