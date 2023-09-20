import XCTest

final class EncodableAsDictionaryTests: XCTestCase {
    func testAsDictionaryConvertsModelWithOnlyStoredPropertyToDictionary() throws {
        // Given
        let object = ModelWithOnlyStoredProperty(name: "John Doe", age: 30)

        // When
        let dictionary = try XCTUnwrap(object.asDictionary())

        // Then
        XCTAssertEqual(dictionary["name"] as? String, "John Doe")
        XCTAssertEqual(dictionary["age"] as? Int, 30)
        XCTAssertEqual(dictionary.count, 2)
    }

    func testAsDictionaryConvertsObjectThatContainsOnlyMethodToDictionary() throws {
        // Given
        let object = ModelWithOnlyFunction()

        // When
        let dictionary = try XCTUnwrap(object.asDictionary())

        // Then
        XCTAssertEqual(dictionary.count, 0)
    }

    func testAsDictionaryConvertsObjectThatContainsOnlyComputedPropertyToDictionary() throws {
        // Given
        let object = ModelWithOnlyComputedProperty()

        // When
        let dictionary = try XCTUnwrap(object.asDictionary())

        // Then
        XCTAssertEqual(dictionary.count, 0)
    }

    func testAsDictionaryConvertsObjectThatContainsMixedPropertiesAndMethodToDictionary() throws {
        // Given
        let object = ModelWithMixedFields(name: "John")

        // When
        let dictionary = try XCTUnwrap(object.asDictionary())

        // Then
        XCTAssertEqual(dictionary["name"] as? String, "John")
        XCTAssertEqual(dictionary.count, 1)
    }

    func testSitterModelSuccessfullyTransformedToDictionary() throws {
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

        // When
        let dictionary = try XCTUnwrap(sitter.asDictionary())

        // Then
        XCTAssertEqual(dictionary["name"] as? String, "Kate")
        XCTAssertEqual(dictionary["surname"] as? String, "Anderson")
        XCTAssertEqual(dictionary["phone"] as? String, "122346")
        XCTAssertEqual(dictionary["avatar_url"] as? String, Bundle.main.bundleURL.description)
        XCTAssertEqual(dictionary["bio"] as? String, "Bio")
        XCTAssertEqual(dictionary["rating"] as? Double, 4.5)
        XCTAssertEqual(dictionary["rate_per_hour"] as? Double, 24.5)

        XCTAssertEqual(dictionary.count, 8)
    }

    func testOwnerModelSuccessfullyTransformedToDictionary() throws {
        // Given
        let owner = Owner(
            name: "Kate",
            surname: "Anderson",
            phone: "122346",
            avatarURL: Bundle.main.bundleURL,
            address: "address",
            rating: 4.5
        )

        // When
        let dictionary = try XCTUnwrap(owner.asDictionary())

        // Then
        XCTAssertEqual(dictionary["name"] as? String, "Kate")
        XCTAssertEqual(dictionary["surname"] as? String, "Anderson")
        XCTAssertEqual(dictionary["phone"] as? String, "122346")
        XCTAssertEqual(dictionary["avatar_url"] as? String, Bundle.main.bundleURL.description)
        XCTAssertEqual(dictionary["address"] as? String, "address")
        XCTAssertEqual(dictionary["rating"] as? Double, 4.5)

        XCTAssertEqual(dictionary.count, 7)
    }
}
