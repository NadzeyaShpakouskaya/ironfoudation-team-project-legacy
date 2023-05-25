import XCTest

final class LocalStorageDeleteTests: XCTestCase {
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

    func testDeleteMethodExistsInAPI() {
        localStorage?.deleteValue(for: LocalStorageTestData.Keys.key)
    }

    func testDeleteValueWithExistingKeyWhenTryLoadValueForKeyReturnsNil() {
        // given
        let key = LocalStorageTestData.Keys.key

        localStorage?.save(value: LocalStorageTestData.Values.defaultValueToSave, for: key)

        // when
        localStorage?.deleteValue(for: key)

        // then
        XCTAssertNil(localStorage?.loadValue(for: key))
    }

    func testDeleteValueWithNonExistingKeyWhenTryLoadValueForKeyReturnsNil() {
        // given
        let key = LocalStorageTestData.Keys.key

        // when
        localStorage?.deleteValue(for: key)

        // then
        XCTAssertNil(localStorage?.loadValue(for: key))
    }
}
