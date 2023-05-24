import XCTest

final class LocalStorageLoadTests: XCTestCase {
    private var localStorage: LocalStorage!
    private let defaultValueToSave = "Hello, World!".data(using: .utf8)!

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
        _ = localStorage.loadValue(for: "")
    }

    func testLoadValueForExistingKey() {
        // given
        let key = "TestKey"

        localStorage.save(value: defaultValueToSave, for: key)

        // when
        let loadedValue = localStorage.loadValue(for: key)

        // then
        XCTAssertEqual(loadedValue, defaultValueToSave)
    }

    func testLoadMethodReturnsNilWhenTryToLoadValueForNonExistingKey() {
        // given
        let key = "NonExistingKey"

        // when
        let loadedValue = localStorage.loadValue(for: key)

        // then
        XCTAssertNil(loadedValue)
    }

    func test() {
        // given
        let keys = (1...1000).map { String($0) }
        keys.forEach {
            localStorage.save(value: defaultValueToSave, for: $0)
        }

        // when
        keys.forEach { key in
            let value = localStorage.loadValue(for: key)

            // then
            XCTAssertNotNil(value)
            XCTAssertEqual(value, defaultValueToSave)
        }
    }
}
