import XCTest

final class CurrentOwnerGetTests: XCTestCase {
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

    func testGetMethodExistsInAPI() {
        _ = current?.get()
    }

    func testGetMethodReturnsNotNilForNonExistingRecord() {
        XCTAssertNotNil(current?.get())
    }

    func testGetMethodReturnsNotNilForExistingRecord() {
        _ = current?.update(with: Owner.CurrentOwner.TestData.defaultOwner)

        XCTAssertNotNil(current?.get())
    }

    func testGetMethodReturnsNewOwnerWithExpectedPropertiesForNonExistingRecord() {
        guard let retrievedOwner = current?.get() else {
            XCTFail("The owner instance returns nil.")
            return
        }

        XCTAssertEqual(retrievedOwner.name, "User")
        XCTAssertEqual(retrievedOwner.surname, "")
        XCTAssertEqual(retrievedOwner.address, "")
        XCTAssertNil(retrievedOwner.avatarUrl)
        XCTAssertEqual(retrievedOwner.phone, "")
        XCTAssertEqual(retrievedOwner.rating, 0)
    }

    func testGetMethodReturnsExpectedOwnerPropertiesForExistingOwner() {
        let testOwner = Owner.CurrentOwner.TestData.defaultOwner
        _ = current?.update(with: testOwner)

        let retrievedOwner = current?.get()

        XCTAssertEqual(retrievedOwner?.id, testOwner.id)
        XCTAssertEqual(retrievedOwner?.name, testOwner.name)
        XCTAssertEqual(retrievedOwner?.surname, testOwner.surname)
        XCTAssertEqual(retrievedOwner?.address, testOwner.address)
        XCTAssertEqual(retrievedOwner?.avatarUrl, testOwner.avatarUrl)
        XCTAssertEqual(retrievedOwner?.phone, testOwner.phone)
        XCTAssertEqual(retrievedOwner?.rating, testOwner.rating)
    }
}
