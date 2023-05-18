import Foundation

class LocalStorage {
    func save<T: Encodable>(value: T, for key: String) throws {
        let data = try CodableHelper.encode(value)
        UserDefaults.standard.set(data, forKey: key)
    }

    func loadValue<T: Decodable>(key: String) throws -> T {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            throw LocalStorageError.noDataForKey
        }

        let result = try CodableHelper.decode(data, as: T.self)

        return result
    }

    enum Key: String {
        case owner
    }
}

enum LocalStorageError: Error {
    case noDataForKey
    case decodeError
    case encodeError
}
