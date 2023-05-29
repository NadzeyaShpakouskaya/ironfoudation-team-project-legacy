import XCTest

final class KeyValueStorageInitTests: XCTestCase {
    func testInitializerExistsInAPI() {
        let _ = KeyValueStorage("Test")
    }
}
