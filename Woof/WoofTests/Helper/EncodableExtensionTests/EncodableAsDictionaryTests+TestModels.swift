import Foundation

extension EncodableAsDictionaryTests {
    struct ModelWithOnlyStoredProperty: Codable {
        let name: String
        let age: Int
    }

    struct ModelWithOnlyFunction: Codable {
        func testFunc() {}
    }

    struct ModelWithOnlyComputedProperty: Codable {
        var name: String {
            "Ivan"
        }
    }

    struct ModelWithMixedFields: Codable {
        let name: String
        var surname: String {
            "Ivanov"
        }

        func testFunc() {}
    }
}
