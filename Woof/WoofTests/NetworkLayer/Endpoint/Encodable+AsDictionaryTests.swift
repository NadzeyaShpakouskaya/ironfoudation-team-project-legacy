import XCTest

final class EncodableAsDictionaryTests: XCTestCase {
    func testAsDictionaryMethodSuccessfullyConvertedObjectToDictionary() {
        // Given
        struct Model: Encodable {
            let name: String
            let age: Int
        }

        let testModel = Model(name: "John Doe", age: 30)

        do {
            // When
            let dictionary = try testModel.asDictionary()

            // Then
            XCTAssertEqual(dictionary["name"] as? String, "John Doe")
            XCTAssertEqual(dictionary["age"] as? Int, 30)
        } catch {
            XCTFail("Failed to convert the model to a dictionary: \(error)")
        }
    }

    func testSitterModelSuccessfullyTransformedToDictionary() {
        // Given
        let sitter = Sitter(
            name: "Kate",
            surname: "Anderson",
            phone: "122346",
            avatarUrl: Bundle.main.bundleURL,
            bio: "Bio",
            rating: 4.5,
            pricePerHour: 24.5
        )

        do {
            // When
            let dictionary = try sitter.asDictionary()

            // Then
            XCTAssertEqual(dictionary["name"] as? String, "Kate")
            XCTAssertEqual(dictionary["surname"] as? String, "Anderson")
            XCTAssertEqual(dictionary["phone"] as? String, "122346")
            XCTAssertNil(dictionary["avatar_url"] as? URL, Bundle.main.bundleURL.description)
            XCTAssertEqual(dictionary["bio"] as? String, "Bio")
            XCTAssertEqual(dictionary["rating"] as? Double, 4.5)
            XCTAssertEqual(dictionary["price_per_hour"] as? Double, 24.5)
        } catch {
            XCTFail("Failed to convert the model to a dictionary: \(error)")
        }
    }

    func testOwnerModelSuccessfullyTransformedToDictionary() {
        // Given
        let owner = Owner(
            name: "Kate",
            surname: "Anderson",
            phone: "122346",
            avatarURL: Bundle.main.bundleURL,
            address: "address",
            rating: 4.5
        )

        do {
            // When
            let dictionary = try owner.asDictionary()

            // Then
            XCTAssertEqual(dictionary["name"] as? String, "Kate")
            XCTAssertEqual(dictionary["surname"] as? String, "Anderson")
            XCTAssertEqual(dictionary["phone"] as? String, "122346")
            XCTAssertNil(dictionary["avatar_url"] as? URL, Bundle.main.bundleURL.description)
            XCTAssertEqual(dictionary["address"] as? String, "address")
            XCTAssertEqual(dictionary["rating"] as? Double, 4.5)
        } catch {
            XCTFail("Failed to convert the model to a dictionary: \(error)")
        }
    }
}
