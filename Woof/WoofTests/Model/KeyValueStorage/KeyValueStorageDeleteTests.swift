import XCTest

final class KeyValueStorageDeleteTests: XCTestCase {
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

    func testDeleteMethodExistsInAPI() {
        localStorage?.deleteValue(for: KeyValueStorage.TestKey.defaultKey)
    }

    func testDeleteMethodSuccessfullyRemovesExistingKeyValuePair() {
        // given
        let key = KeyValueStorage.TestKey.defaultKey

        localStorage?.save(data: KeyValueStorage.TestData.defaultData, for: key)

        // when
        localStorage?.deleteValue(for: key)

        // then
        XCTAssertNil(localStorage?.loadValue(for: key))
    }

    func testDeleteMethodSuccessfullyRemovesNonExistingKeyValuePair() {
        // given
        let nonExistingKey = KeyValueStorage.TestKey.nonExistingKey

        // when
        localStorage?.deleteValue(for: nonExistingKey)

        // then
        XCTAssertNil(localStorage?.loadValue(for: nonExistingKey))
    }
}
