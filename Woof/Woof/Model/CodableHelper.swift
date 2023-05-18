import Foundation

/// A utility model for encoding and decoding Codable objects.
class CodableHelper {
    /**
     Encodes the given object into a `Data` representation.
     
     - Parameters:
       - object: The object to be encoded. Must conform to `Encodable`.
     
     - Returns: The encoded `Data` representation of the object.
     
     - Throws: An error of type `LocalStorageError.encodeError` if encoding the object fails.
    */
    static func encode<T: Encodable>(_ object: T) throws -> Data {
        guard let data = try? JSONEncoder().encode(object) else {
            throw LocalStorageError.encodeError
        }
        return data
    }

    /**
         Decodes the given `Data` into an object of the specified type.
         
         - Parameters:
           - data: The `Data` to be decoded.
           - type: The type of object to decode into. Must conform to `Decodable`.
         
         - Returns: The decoded object of generic type `T`.
         
         - Throws: An error of type `LocalStorageError.decodeError` if decoding the data fails.
        */
    static func decode<T: Decodable>(_ data: Data, as type: T.Type) throws -> T {
        guard let result = try? JSONDecoder().decode(type, from: data) else {
            throw LocalStorageError.decodeError
        }
        return result
    }
}
