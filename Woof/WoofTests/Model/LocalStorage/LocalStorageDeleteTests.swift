import XCTest

final class LocalStorageDeleteTests: XCTestCase {
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

    func testDeleteValueWithExistingKey() {
        let value = "TestValue"
        let key = "TestKey"

        localStorage.save(value: value, for: key)

        localStorage.deleteValue(forKey: key)

        let loadedValue: String? = localStorage.loadValue(key: key)

        XCTAssertNil(loadedValue)
    }

    func testDeleteValueWithNonExistingKey() {
        let key = "NonExistingKey"

        localStorage.deleteValue(forKey: key)

        let loadedValue: String? = localStorage.loadValue(key: key)

        XCTAssertNil(loadedValue)
    }
}
