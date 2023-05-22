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

    func testSaveMethodSavesTheLatestValueForThreeDifferentValuesForTheSameKey() {
        let firstValue = "Hello, Earth!"
        let secondValue = "Hello, Moon!"
        let thirdValue = "Hello, Mars!"
        let expectedValue = "Hello, Mars!"
        let key = "TestKey"

        localStorage.save(value: firstValue, for: key)
        localStorage.save(value: secondValue, for: key)
        localStorage.save(value: thirdValue, for: key)

        let loadedValue: String? = localStorage.loadValue(key: key)

        XCTAssertEqual(loadedValue, expectedValue, "Loaded value should match the expected value")
    }

//    func testSaveMethodRewriteTheLatestValueToNilForTheLatestNilValueForTheSameKey() {
//        let firstValue = "Hello, Earth!"
//        let secondValue = "Hello, Moon!"
//        let thirdValue: String? = nil
//        let key = "TestKey"
//
//        localStorage.save(value: firstValue, for: key)
//        localStorage.save(value: secondValue, for: key)
//        localStorage.save(value: thirdValue, for: key)
//
//        let loadedValue: String? = localStorage.loadValue(key: key)
//
//        XCTAssertNil(loadedValue)
//    }

//    func testSaveMultipleValues() {
//        let numberOfPairs = 10
//        var savedKeys: [String] = []
//
//        for i in 0..<numberOfPairs {
//            let key = "key\(i)"
//            let value = "value\(i)"
//
//            try localStorage.save(value: value, for: key)
//        }
//
//        for key in savedKeys {
//            let value = localStorage.loadValue(key: key)
//            print("Key: \(key), Value: \(String(describing: value))")
//        }
//    }
}
