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

    func testEncode() {
        do {
            // given
            let name = "John Brown"

            // when
            let encodedData = try CodableHelper.encode(name)

            XCTAssertNotNil(encodedData)
            let decodedName = try JSONDecoder().decode(String.self, from: encodedData)
            // then
            XCTAssertEqual(decodedName, name)
        } catch {
            XCTFail("Failed to encode: \(error)")
        }
    }
    
    func testDecode() {
        do {
            // given
            let name = "John Brown"
            let encodedData = try JSONEncoder().encode(name)
            
            // when
            let decodedName: String = try CodableHelper.decode(encodedData, as: String.self)
            
            // then
            XCTAssertEqual(decodedName, name)
        } catch {
            XCTFail("Failed to decode: \(error)")
        }
    }
}
