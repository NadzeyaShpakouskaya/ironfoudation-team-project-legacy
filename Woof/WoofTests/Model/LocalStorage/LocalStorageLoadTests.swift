import XCTest

final class LocalStorageLoadTests: XCTestCase {
    private var localStorage: LocalStorage?

    override func setUp() {
        localStorage = LocalStorage()
        localStorage?.deleteValue(for: LocalStorageTestData.Keys.key)
        localStorage?.deleteValue(for: LocalStorageTestData.Keys.nonExistingKey)
    }

    override func tearDown() {
        localStorage = nil
        super.tearDown()
    }

    func testLoadMethodExistsInAPI() {
        _ = localStorage?.loadValue(for: "")
    }

    func testLoadValueReturnsExpectedValueForExistingKey() {
        // given
        let key = LocalStorageTestData.Keys.key
        let value = LocalStorageTestData.Values.defaultValueToSave

        localStorage?.save(value: value, for: key)

        // when
        let loadedValue = localStorage?.loadValue(for: key)

        // then
        XCTAssertEqual(loadedValue, value)
    }

    func testLoadMethodReturnsNilWhenTryToLoadValueForNonExistingKey() {
        // given

        // when
        let loadedValue = localStorage?.loadValue(for: LocalStorageTestData.Keys.nonExistingKey)

        // then
        XCTAssertNil(loadedValue)
    }

    func testLoadReturnExpectedValuesForOneThousandKeyValuePairsForExistingKeyValuePairs() {
        // given
        let storedValue = LocalStorageTestData.Values.defaultValueToSave
        let keys = (1...1000).map { String($0) }
        keys.forEach {
            localStorage?.save(value: storedValue, for: $0)
        }

        // when
        keys.forEach { key in
            let value = localStorage?.loadValue(for: key)

            // then
            XCTAssertNotNil(value)
            XCTAssertEqual(value, storedValue)

            localStorage?.deleteValue(for: key)
        }
    }
}
