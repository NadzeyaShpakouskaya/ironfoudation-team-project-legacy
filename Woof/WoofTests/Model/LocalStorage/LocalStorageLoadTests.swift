import XCTest

final class LocalStorageLoadTests: XCTestCase {
    var localStorage: LocalStorage!
    var savedOwner = "Owner data"
    var savedKey = "test key"
    let noneExistingKey = UUID().uuidString

    override func setUp() {
        let storage = LocalStorage()
        localStorage = storage

        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        do {
            try localStorage.save(value: savedOwner, for: savedKey)
        } catch {}
    }

    override func tearDown() {
        localStorage = nil
        super.tearDown()
    }

    func testLoadValueWithNoDataForKeyReturnsExpectedError() {
        do {
            // given

            // when
            let _: String = try localStorage.loadValue(key: LocalStorage.Key.owner.rawValue)

            XCTFail("No error was thrown for loading a non-existent value for key.")
        } catch LocalStorageError.noDataForKey {
            // then
            XCTAssert(true)
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }

    func testLoadValueDoNotThrowsErrorForExistingValueInLocalStorage() throws {
        let loadedData: String = try localStorage.loadValue(key: savedKey)
        XCTAssertNoThrow(loadedData)
    }

    func testLoadValueWithNoDecodableDataReturnsExpectedError() {
        do {
            let _: Owner = try localStorage.loadValue(key: savedKey)
        } catch LocalStorageError.decodeError {
            XCTAssert(true)
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }
}
