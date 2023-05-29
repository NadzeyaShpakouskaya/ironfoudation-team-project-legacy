import XCTest

final class KeyValueStorageInitTests: XCTestCase {
    private var storage = KeyValueStorage.test

    override func setUp() async throws {
        try await super.setUp()
        storage.deleteDataForAllTestKeys()
    }

    override func tearDown() async throws {
        storage.deleteDataForAllTestKeys()
        try await super.tearDown()
    }

    func testInitMethodCreates() {
        // TODO:
    }
}
