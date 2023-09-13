import Foundation

extension Encodable {
    /// Converts the object to a dictionary representation, where keys
    /// are the string representation of the stored properties' names and
    /// values are the values of those properties.
    /// During converting the camel case notation of properties' names replace with the snake case notation.
    ///
    /// - Returns: A dictionary representation of the encoded object, or `nil` in case of failure of conversion.
    func asDictionary() -> [String: Any]? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        do {
            let data = try encoder.encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return dictionary
        } catch {
            return nil
        }
    }
}
