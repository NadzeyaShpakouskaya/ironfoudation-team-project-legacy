import Foundation

extension Encodable {
    /// Converts the object to a dictionary representation.
    ///
    /// - Throws: An error of type `Error` if encoding or serialization fails.
    ///
    /// - Returns: A dictionary representation of the encoded object.
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        return dictionary ?? [:]
    }
}
