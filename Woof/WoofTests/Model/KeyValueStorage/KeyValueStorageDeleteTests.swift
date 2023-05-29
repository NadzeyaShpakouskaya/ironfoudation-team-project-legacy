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

//
//    func testDeleteMethodExistsInAPI() {
//        localStorage?.deleteValue(for: KeyValueStorage.TestKey.defaultKey)
//    }
//
//    func testDeleteMethodSuccessfullyRemovesExistingKeyValuePair() {
//        // given
//        let key = KeyValueStorage.TestKey.defaultKey
//
//        localStorage?.save(data: KeyValueStorage.TestData.defaultData, for: key)
//
//        // when
//        localStorage?.deleteValue(for: key)
//
//        // then
//        XCTAssertNil(localStorage?.loadValue(for: key))
//    }
//
//    func testDeleteMethodSuccessfullyRemovesNonExistingKeyValuePair() {
//        // given
//        let nonExistingKey = KeyValueStorage.TestKey.nonExistingKey
//
//        // when
//        localStorage?.deleteValue(for: nonExistingKey)
//
//        // then
//        XCTAssertNil(localStorage?.loadValue(for: nonExistingKey))
//    }
}
