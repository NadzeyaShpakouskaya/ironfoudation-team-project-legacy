import XCTest

final class LocalStorageSaveTests: XCTestCase {
    private var localStorage: LocalStorage!
    private let defaultValueToSave = "Hello, World!".data(using: .utf8)!

    override func setUp() {
        let storage = LocalStorage()
        localStorage = storage

        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            storage.localStorage?.removePersistentDomain(forName: bundleIdentifier)
        }
    }

    override func tearDown() {
        localStorage = nil
        super.tearDown()
    }

    func testSaveMethodExistsInAPI() {
        localStorage.save(value: defaultValueToSave, for: "key")
    }

    func testSaveMethodSavesTheValueForValidKey() {
        // given
        let key = "TestKey"

        // when
        localStorage.save(value: defaultValueToSave, for: key)

        // then
        let loadedValue = localStorage.loadValue(for: key)

        XCTAssertEqual(loadedValue, defaultValueToSave)
    }

    func testSaveMethodOverridesToTheLatestProvidedValueForTheSameKey() {
        // given
        let firstValue = "a".data(using: .utf8)!
        let expectedValue = firstValue
        let key = "key"

        // when
        localStorage.save(value: defaultValueToSave, for: key)
        localStorage.save(value: firstValue, for: key)

        // then
        let loadedValue = localStorage.loadValue(for: key)

        XCTAssertEqual(loadedValue, expectedValue)
    }
}
