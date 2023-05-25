import XCTest

final class KeyValueStorageSaveTests: XCTestCase {
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

    func testSaveMethodExistsInAPI() {
        localStorage?.save(data: KeyValueStorageValues.defaultValueToSave, for: KeyValueStorageKeys.key)
    }

    func testSaveMethodSavesTheValueForValidKey() {
        // given
        let key = KeyValueStorageKeys.key
        let value = KeyValueStorageValues.defaultValueToSave

        // when
        localStorage?.save(data: value, for: key)

        // then
        let loadedValue = localStorage?.loadValue(for: key)

        XCTAssertEqual(loadedValue, value)
    }

    func testSaveMethodOverridesToTheLatestProvidedValueForTheSameKey() {
        // given
        let overrideValue = KeyValueStorageValues.additionalValueToSave
        let key = KeyValueStorageKeys.key

        // when
        localStorage?.save(data: KeyValueStorageValues.defaultValueToSave, for: key)
        localStorage?.save(data: overrideValue, for: key)

        // then
        let loadedValue = localStorage?.loadValue(for: key)

        XCTAssertEqual(loadedValue, overrideValue)
    }

    func testSaveMethodReturnTrue() {
        // given
        let key = KeyValueStorageKeys.key
        let value = KeyValueStorageValues.defaultValueToSave

        // when
        guard let result = localStorage?.save(data: value, for: key) else {
            return XCTFail("Nil returned")
        }

        // then
        XCTAssertTrue(result)
    }

    func testSaveMethodReturnFalse() {
        // given
        let key = KeyValueStorageKeys.key
        let value = Data()

        // when
        guard let result = localStorage?.save(data: value, for: key) else {
            return XCTFail("Nil returned")
        }

        // then
        XCTAssertTrue(result)
    }
}
