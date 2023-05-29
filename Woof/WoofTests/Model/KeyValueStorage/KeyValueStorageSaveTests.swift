import XCTest

final class KeyValueStorageSaveTests: XCTestCase {
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

    func testSaveMethodExistsInAPI() {
        storage.save(
            KeyValueStorage.TestData.dataOneByte,
            for: KeyValueStorage.TestKey.keyA.rawValue
        )
    }

    func testSaveMethodReturnsTrueIfTheDataWasSaved() {
        // given
        let key = KeyValueStorage.TestKey.keyA.rawValue
        let data = KeyValueStorage.TestData.dataOneByte

        // when
        let savingResult = storage.save(data, for: key)

        // then
        XCTAssertTrue(savingResult)
    }

    func testSaveMethodStoresTheDataWhenEmptyKeyIsUsed() {
        // given
        let emptyStringKey = ""
        let data = KeyValueStorage.TestData.dataOneByte

        // when
        let savingResult = storage.save(data, for: emptyStringKey)

        // then
        XCTAssertTrue(savingResult)
    }

    func testSaveMethodOverridesDataWhenUsesTheSameKey() {
        // given
        let dataA = KeyValueStorage.TestData.dataOneByte
        let dataB = KeyValueStorage.TestData.dataTwoBytes
        let key = KeyValueStorage.TestKey.keyA.rawValue

        // when
        storage.save(dataA, for: key)
        storage.save(dataB, for: key)

        // then
        let savedData = storage.loadData(for: key)
        XCTAssertEqual(savedData, dataB)
    }
}
