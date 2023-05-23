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

    func testSaveMethodSavesTheValueForValidKey() {
        // given
        let testValue = "X"
        let key = "TestKey"

        // when
        localStorage.save(value: testValue, for: key)

        // then
        let loadedValue = localStorage.loadValue(key: key, type: String?.self)

        XCTAssertEqual(loadedValue, testValue)
    }

    func testSaveMethodOvveridesTheLatestValueForTwoDifferentValuesForTheSameKey() {
        // given
        let firstValue = "A"
        let secondValue = "B"
        let key = "TestKey"

        // when
        localStorage.save(value: firstValue, for: key)
        localStorage.save(value: secondValue, for: key)

        // then
        let loadedValue = localStorage.loadValue(key: key, type: String?.self)

        XCTAssertEqual(loadedValue, secondValue)
    }
}
