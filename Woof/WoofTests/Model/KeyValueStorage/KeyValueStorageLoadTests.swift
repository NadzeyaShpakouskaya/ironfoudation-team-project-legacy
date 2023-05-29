import XCTest

final class KeyValueStorageLoadTests: XCTestCase {
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
}
