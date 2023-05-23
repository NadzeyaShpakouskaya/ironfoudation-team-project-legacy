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
        let testValue = "Hello, World!"
        let key = "TestKey"

        // when
        localStorage.save(value: testValue, for: key)

        // then
        let loadedValue = localStorage.loadValue(for: key, as: String?.self)

        XCTAssertEqual(loadedValue, testValue)
    }

    func testSaveMethodSavesTheLatestValueForThreeDifferentValuesForTheSameKey() {
        // given
        let firstValue = "Hello, Earth!"
        let secondValue = "Hello, Moon!"
        let thirdValue = "Hello, Mars!"
        let expectedValue = "Hello, Mars!"
        let key = "TestKey"

        // when
        localStorage.save(value: firstValue, for: key)
        localStorage.save(value: secondValue, for: key)
        localStorage.save(value: thirdValue, for: key)

        // then
        let loadedValue = localStorage.loadValue(for: key, as: String?.self)

        XCTAssertEqual(loadedValue, expectedValue)
    }

    func testSaveMethodRewriteTheLatestValueToNilForTheLatestNilValueForTheSameKey() {
        // given
        let firstValue = "Hello, Earth!"
        let secondValue = "Hello, Moon!"
        let thirdValue: String? = nil
        let key = "TestKey"

        // when
        localStorage.save(value: firstValue, for: key)
        localStorage.save(value: secondValue, for: key)
        localStorage.save(value: thirdValue, for: key)

        // then
        let loadedValue = localStorage.loadValue(key: key, type: String?.self)

        XCTAssertNil(loadedValue as Any?)
    }
}
