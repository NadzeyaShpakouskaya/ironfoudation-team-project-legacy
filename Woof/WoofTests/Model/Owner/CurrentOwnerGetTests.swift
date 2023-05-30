import XCTest

final class CurrentOwnerGetTests: XCTestCase {
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

    func testGetMethodExistsInAPI() {
        _ = current?.get()
    }

    func testGetMethodReturnsNotNilForNonExistingRecord() {
        XCTAssertNotNil(current?.get())
    }

    func testGetMethodReturnsNotNilForExistingRecord() {
        _ = current?.update(with: Owner.Test.kateAnderson)

        XCTAssertNotNil(current?.get())
    }

    func testGetMethodReturnsNewOwnerWithExpectedPropertiesForNonExistingRecord() {
        let retrievedOwner = current?.get()

        XCTAssertEqual(retrievedOwner?.name, "User")
        XCTAssertEqual(retrievedOwner?.surname, "")
        XCTAssertEqual(retrievedOwner?.address, "")
        XCTAssertNil(retrievedOwner?.avatarUrl)
        XCTAssertEqual(retrievedOwner?.phone, "")
        XCTAssertEqual(retrievedOwner?.rating, 0)
    }

    func testGetMethodReturnsExpectedOwnerPropertiesForExistingOwner() {
        let testOwner = Owner.Test.kateAnderson
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
