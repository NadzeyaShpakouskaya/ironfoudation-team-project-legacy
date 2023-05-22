import XCTest

final class LocalStorageLoadTests: XCTestCase {
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

    func testLoadValueForExistingKey() {
        let savingValue = "Hello, World!"
        let expectedValue = "Hello, World!"
        let key = "TestKey"

        localStorage.save(value: savingValue, for: key)

        let loadedValue: String? = localStorage.loadValue(key: key)

        XCTAssertEqual(loadedValue, expectedValue, "Loaded value should match the expected value")
    }

    func testLoadValueForNonExisteningKey() {
        let key = "NonExisteningKey"

        let loadedValue = localStorage.loadValue(for: key, as: String.self)

        XCTAssertNil(loadedValue, "Loaded value should be nil for a nonexistent key")
    }

    func testLoadValueForDifferentTypeValue() {
        let key = "NonExisteningKey"
        let nonExistingValue = 555

        localStorage.save(value: nonExistingValue, for: key)

        let loadedValue = localStorage.loadValue(for: key, as: String.self)

        XCTAssertNil(loadedValue)
    }
}
