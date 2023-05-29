import XCTest

final class CurrentOwnerDeleteTests: XCTestCase {
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

    func testDeleteMethodsExistsInAPI() {
        current?.delete()
    }

    func testDeleteMethodsSuccessfullyDeleteExistingOwner() {
        let testOwner = Owner.CurrentOwner.TestData.owner
        _ = current?.update(with: testOwner)

        current?.delete()

        let retrievedOwner = current?.get()
        XCTAssertNotEqual(retrievedOwner?.id, testOwner.id)
        XCTAssertNotEqual(retrievedOwner?.name, testOwner.name)
        XCTAssertNotEqual(retrievedOwner?.surname, testOwner.surname)
        XCTAssertNotEqual(retrievedOwner?.address, testOwner.address)
        XCTAssertNil(retrievedOwner?.avatarUrl)
        XCTAssertNotEqual(retrievedOwner?.phone, testOwner.phone)
        XCTAssertNotEqual(retrievedOwner?.rating, testOwner.rating)
    }
}
