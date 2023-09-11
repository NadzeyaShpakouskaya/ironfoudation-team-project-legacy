import Foundation

extension Encodable {
    /// Converts the object to a dictionary representation.
    ///
    /// - Throws: An error of type `Error` if encoding or serialization fails.
    ///
    /// - Returns: A dictionary representation of the encoded object.
    func asDictionary() throws -> [String: Any] {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        let data = try encoder.encode(self)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]

        return dictionary ?? [:]
    }
}
