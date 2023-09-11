import XCTest

final class EncodableAsDictionaryTests: XCTestCase {
    func testAsDictionaryMethodSuccessfullyConvertedObjectToDictionary() {
        struct Model: Encodable {
            let name: String
            let age: Int
        }

        let testModel = Model(name: "John Doe", age: 30)

        do {
            let dictionary = try testModel.asDictionary()

            XCTAssertEqual(dictionary["name"] as? String, "John Doe")
            XCTAssertEqual(dictionary["age"] as? Int, 30)
        } catch {
            XCTFail("Failed to convert the model to a dictionary: \(error)")
        }
    }
}
