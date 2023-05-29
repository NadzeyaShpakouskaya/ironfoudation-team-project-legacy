import XCTest

final class OwnerInitTests: XCTestCase {
    func testOwnerInitializerExistsInApi() {
        let _ = Owner(name: "",
                      surname: "",
                      phone: "",
                      avatarUrl: nil,
                      address: "",
                      rating: 0)
    }

    func testOwnerConvenienceInitializerExistsInApi() {
        let _ = Owner()
    }
}
