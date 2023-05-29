import XCTest

final class KeyValueStorageLoadDataTests: XCTestCase {
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
        _ = storage.loadData(for: "")
    }

    func testMethodReturnsExpectedDataForExistingKey() {
        // given
        let key = KeyValueStorage.TestKey.keyA.rawValue
        let data = KeyValueStorage.TestData.dataOneByte

        storage.save(data, for: key)

        // when
        let retrievedData = storage.loadData(for: key)

        // then
        XCTAssertEqual(retrievedData, data)
    }

    func testMethodReturnsNilIfTheKeyDoesNotExistInStorage() {
        // given
        let nonExistingKey = KeyValueStorage.TestKey.nonExistingKey.rawValue
        storage.deleteData(for: nonExistingKey)

        // when
        let retrievedData = storage.loadData(for: nonExistingKey)

        // then
        XCTAssertNil(retrievedData)
    }

    func testMethodReturnsExpectedDataForOneThousandSavedKeys() {
        // given
        let dataInstance = KeyValueStorage.TestData.dataOneByte
        let keys = (1...1000).map { String($0) }

        keys.forEach { storage.save(dataInstance, for: $0) }

        // when
        keys.forEach { key in
            let retrievedDataInstance = storage.loadData(for: key)

            // then
            XCTAssertEqual(retrievedDataInstance, dataInstance)
        }
    }

    func testLoadDataMethodRetrievesTheDataSavedUsingTheDifferentReferenceButTheSameName() {
        // given
        let storageName = "test"
        let key = KeyValueStorage.TestKey.keyA.rawValue
        let dataSavedInA = KeyValueStorage.TestData.dataOneByte

        let storageA = KeyValueStorage(storageName)
        storageA.save(dataSavedInA, for: key)

        // when
        let storageB = KeyValueStorage(storageName)
        let dataRetrievedFromB = storageB.loadData(for: key)

        // then
        XCTAssertEqual(dataRetrievedFromB, dataSavedInA)
    }

    func testLoadDataMethodDoesNotRetrieveTheDataRemovedUsingTheDifferentReferenceButTheSameName() {
        // given
        let storageName = "test"
        let key = KeyValueStorage.TestKey.keyA.rawValue
        let dataSavedInA = KeyValueStorage.TestData.dataOneByte

        let storageA = KeyValueStorage(storageName)
        storageA.save(dataSavedInA, for: key)

        // when
        let storageB = KeyValueStorage(storageName)
        storageB.deleteData(for: key)

        let storageC = KeyValueStorage(storageName)
        let dataRetrievedFromC = storageC.loadData(for: key)

        // then
        XCTAssertNil(dataRetrievedFromC)
    }
}
