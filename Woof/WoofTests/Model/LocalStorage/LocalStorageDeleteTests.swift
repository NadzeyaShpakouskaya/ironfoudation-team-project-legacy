import XCTest

final class LocalStorageDeleteTests: XCTestCase {
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

    func testDeleteMethodExistsInAPI() {
        localStorage.deleteValue(forKey: "key")
    }

    func testDeleteValueWithExistingKey() {
        // given
        let key = "TestKey"

        localStorage.save(value: defaultValueToSave, for: key)

        // when
        localStorage.deleteValue(forKey: key)

        // then
        XCTAssertNil(localStorage.loadValue(for: key))
    }

    func testDeleteValueWithNonExistingKey() {
        // given
        let key = "NonExistingKey"

        // when
        localStorage.deleteValue(forKey: key)

        // then
        XCTAssertNil(localStorage.loadValue(for: key))
    }
}
