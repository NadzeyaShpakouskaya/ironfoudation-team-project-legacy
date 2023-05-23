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
        // given
        let savingValue = "Hello, World!"
        let expectedValue = "Hello, World!"
        let key = "TestKey"

        localStorage.save(value: savingValue, for: key)

        // when
        let loadedValue = localStorage.loadValue(for: key, as: String?.self)

        // then
        XCTAssertEqual(loadedValue, expectedValue)
    }

    func testLoadValueForNonExisteningKey() {
        // given
        let key = "NonExisteningKey"

        // when
        let loadedValue = localStorage.loadValue(for: key, as: String.self)

        // then
        XCTAssertNil(loadedValue)
    }

    func testLoadValueForDifferentTypeValue() {
        // given
        let key = "NonExisteningKey"
        let nonExistingValue = 555

        localStorage.save(value: nonExistingValue, for: key)

        // when
        let loadedValue = localStorage.loadValue(for: key, as: String.self)

        // then
        XCTAssertNil(loadedValue)
    }
}
