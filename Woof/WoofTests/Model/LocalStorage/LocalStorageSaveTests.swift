import XCTest

final class LocalStorageSaveTests: XCTestCase {
    var localStorage: LocalStorage!

    override func setUp() {
        let storage = LocalStorage()
        localStorage = storage

        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }

    override func tearDown() {
        localStorage = nil
        super.tearDown()
    }

    func testSaveMethodExistsInAPI() {
        localStorage.save(value: "test", for: "key")
    }

    func testSaveMethodSavesTheValueForValidKey() {
        // given
        let testValue = "Hello, World!"
        let key = "TestKey"

        // when
        localStorage.save(value: testValue, for: key)

        // then
        let loadedValue = localStorage.loadValue(for: key, as: String?.self)

        XCTAssertEqual(loadedValue, testValue)
    }

    func testSaveMethodOverridesToTheLatestProvidedValueForTheSameKey() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let expectedValue = secondValue
        let key = "key"

        // when
        localStorage.save(value: firstValue, for: key)
        localStorage.save(value: secondValue, for: key)

        // then
        let loadedValue = localStorage.loadValue(for: key, as: String?.self)

        XCTAssertEqual(loadedValue, expectedValue)
    }
}
