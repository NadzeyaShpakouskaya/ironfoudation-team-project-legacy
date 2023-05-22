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

    func testDeleteValue() {
        let value = "TestValue"
        let key = "TestKey"

        XCTAssertNoThrow(try localStorage.save(value: value, for: key))

        localStorage.deleteValue(forKey: key)

        let loadedValue: String? = localStorage.loadValue(key: key)

        XCTAssertNil(loadedValue, "Loaded value should be nil after deleting it")
    }
}
