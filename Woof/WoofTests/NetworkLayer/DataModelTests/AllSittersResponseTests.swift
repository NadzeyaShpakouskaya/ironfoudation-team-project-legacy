import XCTest

final class AllSittersResponseTests: XCTestCase {
    func testPetSittersPresentsInAPI() {
        _ = AllSittersResponse(petSitters: nil).petSitters
    }
}
