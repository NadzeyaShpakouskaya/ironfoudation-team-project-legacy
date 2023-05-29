import XCTest

final class KeyValueStorageInitTests: XCTestCase {
    func testInitMethodExistsInAPI() {
        let _ = KeyValueStorage("Test")
    }

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
