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

    func testDeleteMethodExistsInAPI() {
        localStorage.deleteValue(forKey: "key")
    }

    func testDeleteValueWithExistingKey() {
        // given
        let value = "TestValue"
        let key = "TestKey"

        localStorage.save(value: value, for: key)

        // when
        localStorage.deleteValue(forKey: key)

        // then
        let loadedValue = localStorage.loadValue(for: key, as: String?.self)

        XCTAssertNil(loadedValue as Any?)
    }

    func testDeleteValueWithNonExistingKey() {
        // given
        let key = "NonExistingKey"

        // when
        localStorage.deleteValue(forKey: key)

        // then
        let loadedValue = localStorage.loadValue(for: key, as: String?.self)

        XCTAssertNil(loadedValue as Any?)
    }
}
