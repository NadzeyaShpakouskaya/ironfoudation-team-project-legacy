import XCTest

final class KeyValueStorageDeleteTests: XCTestCase {
    private var localStorage: KeyValueStorage?

    override func setUp() {
        localStorage = KeyValueStorage()
        localStorage?.deleteValue(for: KeyValueStorageKeys.key)
        localStorage?.deleteValue(for: KeyValueStorageKeys.nonExistingKey)
    }

    override func tearDown() {
        localStorage = nil
        super.tearDown()
    }

    func testDeleteMethodExistsInAPI() {
        localStorage?.deleteValue(for: KeyValueStorageKeys.key)
    }

    func testDeleteMethodSuccessfullyRemovesExistingKeyValuePair() {
        // given
        let key = KeyValueStorageKeys.key

        localStorage?.save(data: KeyValueStorageValues.defaultValueToSave, for: key)

        // when
        localStorage?.deleteValue(for: key)

        // then
        XCTAssertNil(localStorage?.loadValue(for: key))
    }

    func testDeleteMethodSuccessfullyRemovesNonExistingKeyValuePair() {
        // given
        let key = KeyValueStorageKeys.key

        // when
        localStorage?.deleteValue(for: key)

        // then
        XCTAssertNil(localStorage?.loadValue(for: key))
    }
}
