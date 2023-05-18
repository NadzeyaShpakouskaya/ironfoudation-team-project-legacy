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

    func testSaveAndLoadValue() {
        do {
            // given
            let name = "John Brown"
            try localStorage.save(value: name, for: LocalStorage.Key.owner.rawValue)

            // when
            let loadedName: String = try localStorage.loadValue(key: LocalStorage.Key.owner.rawValue)

            // then
            XCTAssertEqual(loadedName, name)
        } catch {
            XCTFail("Failed to save or load value: \(error)")
        }
    }

    func testLoadValueWithNoDataForKey() {
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
}
