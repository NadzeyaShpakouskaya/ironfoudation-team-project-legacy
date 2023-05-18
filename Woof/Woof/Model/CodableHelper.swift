import Foundation

class CodableHelper {
    static func encode<T: Encodable>(_ object: T) throws -> Data {
        guard let data = try? JSONEncoder().encode(object) else {
            throw LocalStorageError.encodeError
        }
        return data
    }

    static func decode<T: Decodable>(_ data: Data, as type: T.Type) throws -> T {
        guard let result = try? JSONDecoder().decode(type, from: data) else {
            throw LocalStorageError.decodeError
        }
        return result
    }
}

