import XCTest

final class KeyValueStorageDeleteTests: XCTestCase {
    private var storage = KeyValueStorage.test

    override func setUp() async throws {
        try await super.setUp()
        storage.deleteDataForAllTestKeys()
    }

    override func tearDown() async throws {
        storage.deleteDataForAllTestKeys()
        try await super.tearDown()
    }

    func testMethodExistsInAPI() {
        storage.deleteData(for: KeyValueStorage.TestKey.keyA.rawValue)
    }

    func testMethodRemovesDataForExistingKey() {
        // given
        let key = KeyValueStorage.TestKey.keyA.rawValue
        let data = KeyValueStorage.TestData.dataOneByte

        storage.save(data, for: key)

        // when
        storage.deleteData(for: key)

        // then
        XCTAssertNil(storage.loadData(for: key))
    }

    func testMethodDeletesOnlyDataForTheSpecifiedKey() {
        // given
        let keyA = KeyValueStorage.TestKey.keyA.rawValue
        let keyB = KeyValueStorage.TestKey.keyB.rawValue
        let dataA = KeyValueStorage.TestData.dataOneByte
        let dataB = KeyValueStorage.TestData.dataTwoBytes

        storage.save(dataA, for: keyA)
        storage.save(dataB, for: keyB)

        // when
        storage.deleteData(for: keyA)

        // then
        XCTAssertEqual(storage.loadData(for: keyB), dataB)
    }

    func testMethodDoesNotAffectStorageIfTheKeyDoesNotExistInTheStorage() {
        // given
        let nonExistingKey = KeyValueStorage.TestKey.nonExistingKey.rawValue
        let keyA = KeyValueStorage.TestKey.keyA.rawValue
        let keyB = KeyValueStorage.TestKey.keyB.rawValue
        let dataA = KeyValueStorage.TestData.dataOneByte
        let dataB = KeyValueStorage.TestData.dataTwoBytes

        storage.deleteData(for: nonExistingKey)
        storage.save(dataA, for: keyA)
        storage.save(dataB, for: keyB)

        // when
        storage.deleteData(for: nonExistingKey)

        // then
        XCTAssertEqual(storage.loadData(for: keyA), dataA)
        XCTAssertEqual(storage.loadData(for: keyB), dataB)
    }
}
