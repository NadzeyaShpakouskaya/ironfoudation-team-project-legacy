import XCTest

final class KeyValueStorageSaveTests: XCTestCase {
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

    func testSaveMethodExistsInAPI() {
        localStorage?.save(
            data: KeyValueStorage.TestData.additionalData,
            for: KeyValueStorage.TestKey.defaultKey
        )
    }

    func testSaveMethodSavesTheValueForValidKey() {
        // given
        let key = KeyValueStorage.TestKey.defaultKey
        let value = KeyValueStorage.TestData.additionalData

        // when
        localStorage?.save(data: value, for: key)

        // then
        XCTAssertEqual(localStorage?.loadValue(for: key), value)
    }

    func testSaveMethodOverridesToTheLatestProvidedValueForTheSameKey() {
        // given
        let overridingValue = KeyValueStorage.TestData.defaultData
        let key = KeyValueStorage.TestKey.defaultKey

        // when
        localStorage?.save(data: KeyValueStorage.TestData.additionalData, for: key)
        localStorage?.save(data: overridingValue, for: key)

        // then
        XCTAssertEqual(localStorage?.loadValue(for: key), overridingValue)
    }

    func testSaveMethodReturnTrueWhenDataSuccessfullySaved() {
        // given
        let key = KeyValueStorage.TestKey.defaultKey
        let value = KeyValueStorage.TestData.defaultData

        // when
        let result = localStorage?.save(data: value, for: key)

        // then
        XCTAssertNotNil(result)
    }
}
