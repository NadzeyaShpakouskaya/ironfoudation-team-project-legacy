import XCTest

final class KeyValueStorageLoadTests: XCTestCase {
    private var localStorage: KeyValueStorage?

    override func setUp() {
        localStorage = KeyValueStorage()
        localStorage?.deleteValue(for: KeyValueStorage.TestKey.defaultKey)
        localStorage?.deleteValue(for: KeyValueStorage.TestKey.nonExistingKey)
    }

    override func tearDown() {
        localStorage = nil
        super.tearDown()
    }

    func testLoadMethodExistsInAPI() {
        _ = localStorage?.loadValue(for: "")
    }

    func testLoadMethodReturnsExpectedValueForExistingKey() {
        // given
        let key = KeyValueStorage.TestKey.defaultKey
        let value = KeyValueStorage.TestData.defaultData

        localStorage?.save(data: value, for: key)

        // when
        let loadedValue = localStorage?.loadValue(for: key)

        // then
        XCTAssertEqual(loadedValue, value)
    }

    func testLoadMethodReturnsNilWhenLoadMethodCalledForNonExistingKey() {
        // given

        // when
        let loadedValue = localStorage?.loadValue(for: KeyValueStorage.TestKey.nonExistingKey)

        // then
        XCTAssertNil(loadedValue)
    }

    func testLoadMethodReturnsExpectedValuesForOneThousandExistingKeyValuePairs() {
        // given
        let storedValue = KeyValueStorage.TestData.defaultData
        let keys = (1...1000).map { String($0) }
        keys.forEach {
            localStorage?.save(data: storedValue, for: $0)
        }

        // when
        keys.forEach { key in
            let value = localStorage?.loadValue(for: key)

            // then
            XCTAssertEqual(value, storedValue)
            localStorage?.deleteValue(for: key)
        }
    }
}
