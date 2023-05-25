import XCTest

final class LocalStorageSaveTests: XCTestCase {
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

    func testSaveMethodExistsInAPI() {
        localStorage?.save(value: LocalStorageTestData.Values.defaultValueToSave, for: LocalStorageTestData.Keys.key)
    }

    func testSaveMethodSavesTheValueForValidKey() {
        // given
        let key = LocalStorageTestData.Keys.key
        let value = LocalStorageTestData.Values.defaultValueToSave

        // when
        localStorage?.save(value: value, for: key)

        // then
        let loadedValue = localStorage?.loadValue(for: key)

        XCTAssertEqual(loadedValue, value)
    }

    func testSaveMethodOverridesToTheLatestProvidedValueForTheSameKey() {
        // given
        let overrideValue = LocalStorageTestData.Values.additionalValueToSave
        let key = LocalStorageTestData.Keys.key

        // when
        localStorage?.save(value: LocalStorageTestData.Values.defaultValueToSave, for: key)
        localStorage?.save(value: overrideValue, for: key)

        // then
        let loadedValue = localStorage?.loadValue(for: key)

        XCTAssertEqual(loadedValue, overrideValue)
    }
}
