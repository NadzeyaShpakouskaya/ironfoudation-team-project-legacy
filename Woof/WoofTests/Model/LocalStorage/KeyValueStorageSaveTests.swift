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
        localStorage?.save(
            data: KeyValueStorageValues.defaultValueToSave,
            for: KeyValueStorageKeys.key
        )
    }

    func testSaveMethodSavesTheValueForValidKey() {
        // given
        let key = KeyValueStorageKeys.key
        let value = KeyValueStorageValues.defaultValueToSave

        // when
        localStorage?.save(data: value, for: key)

        // then
        XCTAssertEqual(localStorage?.loadValue(for: key), value)
    }

    func testSaveMethodOverridesToTheLatestProvidedValueForTheSameKey() {
        // given
        let overridingValue = KeyValueStorageValues.additionalValueToSave
        let key = KeyValueStorageKeys.key

        // when
        localStorage?.save(data: KeyValueStorageValues.defaultValueToSave, for: key)
        localStorage?.save(data: overridingValue, for: key)

        // then
        XCTAssertEqual(localStorage?.loadValue(for: key), overridingValue)
    }

    func testSaveMethodReturnTrueWhenDataSuccessfullySaved() {
        // given
        let key = KeyValueStorageKeys.key
        let value = KeyValueStorageValues.defaultValueToSave

        // when
        guard let result = localStorage?.save(data: value, for: key) else {
            return XCTFail("Returns nil")
        }

        // then
        XCTAssertTrue(result)
    }
}
