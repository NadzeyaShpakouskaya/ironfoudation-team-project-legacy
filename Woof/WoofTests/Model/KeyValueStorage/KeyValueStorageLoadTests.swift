import XCTest

final class KeyValueStorageLoadTests: XCTestCase {
    private var storage = KeyValueStorage.test

    override func setUp() async throws {
        try await super.setUp()
        storage.deleteDataForAllTestKeys()
    }

    override func tearDown() async throws {
        storage.deleteDataForAllTestKeys()
        try await super.tearDown()
    }

//
//    func testLoadMethodExistsInAPI() {
//        _ = localStorage?.loadValue(for: "")
//    }
//
//    func testLoadMethodReturnsExpectedValueForExistingKey() {
//        // given
//        let key = KeyValueStorage.TestKey.defaultKey
//        let value = KeyValueStorage.TestData.defaultData
//
//        localStorage?.save(data: value, for: key)
//
//        // when
//        let loadedValue = localStorage?.loadValue(for: key)
//
//        // then
//        XCTAssertEqual(loadedValue, value)
//    }
//
//    func testLoadMethodReturnsNilWhenLoadMethodCalledForNonExistingKey() {
//        // given
//
//        // when
//        let loadedValue = localStorage?.loadValue(for: KeyValueStorage.TestKey.nonExistingKey)
//
//        // then
//        XCTAssertNil(loadedValue)
//    }
//
//    func testLoadMethodReturnsExpectedValuesForOneThousandExistingKeyValuePairs() {
//        // given
//        let storedValue = KeyValueStorage.TestData.defaultData
//        let keys = (1...1000).map { String($0) }
//        keys.forEach {
//            localStorage?.save(data: storedValue, for: $0)
//        }
//
//        // when
//        keys.forEach { key in
//            let value = localStorage?.loadValue(for: key)
//
//            // then
//            XCTAssertEqual(value, storedValue)
//            localStorage?.deleteValue(for: key)
//        }
//    }

    func testLoadMethodRetrievesTheDataSavedUsingTheDifferentReferenceButTheSameName() {
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

    func testLoadMethodDoesNotRetrieveTheDataRemovedUsingTheDifferentReferenceButTheSameName() {
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
