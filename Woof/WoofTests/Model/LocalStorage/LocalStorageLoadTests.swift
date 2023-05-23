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

    func testLoadMethodExistsInAPI() {
        _ = localStorage.loadValue(for: "", as: String.self)
    }

    func testLoadValueForExistingKey() {
        // given
        let savingValue = "Hello, World!"
        let expectedValue = savingValue
        let key = "TestKey"

        localStorage.save(value: savingValue, for: key)

        // when
        let loadedValue = localStorage.loadValue(for: key, as: String?.self)

        // then
        XCTAssertEqual(loadedValue, expectedValue)
    }

    func testLoadMethodReturnsNilWhenTryToLoadValueForNonExistingKey() {
        // given
        let key = "NonExistingKey"

        // when
        let loadedValue = localStorage.loadValue(for: key, as: String.self)

        // then
        XCTAssertNil(loadedValue)
    }

    func testLoadMethodReturnsNilWhenTryToLoadValueAsDifferentTypeOfValue() {
        // given
        let key = "NonExistingKey"
        let value = 555

        localStorage.save(value: value, for: key)

        // when
        let loadedValue = localStorage.loadValue(for: key, as: String.self)

        // then
        XCTAssertNil(loadedValue)
    }
}
