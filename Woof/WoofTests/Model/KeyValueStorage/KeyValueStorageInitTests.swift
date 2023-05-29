import XCTest

final class KeyValueStorageInitTests: XCTestCase {
    private var storage = KeyValueStorage("Test-KeyValue-Storage")

    override func setUp() async throws {
        try await super.setUp()
        KeyValueStorage.TestKey.allCases.forEach {
            storage.deleteData(for: $0.rawValue)
        }
    }

    override func tearDown() async throws {
        KeyValueStorage.TestKey.allCases.forEach {
            storage.deleteData(for: $0.rawValue)
        }
        try await super.tearDown()
    }

    func testInitMethodCreates() {
        // TODO:
    }
}
