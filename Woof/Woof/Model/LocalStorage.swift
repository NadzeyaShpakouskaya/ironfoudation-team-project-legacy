import Foundation

/// A utility model for saving and loading data from user defaults.
class LocalStorage {
    /**
     Saves the given value to the user defaults for the specified key.
     
     - Parameters:
       - value: The value to be saved. Must be encodable.
       - key: The key under which to save the value.
     
     - Throws: An error of type `LocalStorageError.encodeError` if encoding the value fails.
    */
    func save<T: Encodable>(value: T, for key: String) throws {
        let data = try CodableHelper.encode(value)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    /**
     Loads the value from the user defaults for the specified key and returns it.
     
     - Parameters:
       - key: The key for which to load the value.
     
     - Returns: The loaded value of type `T`.
     
     - Throws:
       - An error of type `LocalStorageError.noDataForKey` if no data is found for the specified key.
       - An error of type `LocalStorageError.decodeError` if decoding the data fails.
    */
    func loadValue<T: Decodable>(key: String) throws -> T {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            throw LocalStorageError.noDataForKey
        }

        let result = try CodableHelper.decode(data, as: T.self)

        return result
    }
    
    /// Possible keys used for storing data in user defaults.
    enum Key: String {
        /// Key representing the data of the owner.
        case owner
    }
}

/// Possible errors that can occur during local storage operations.
enum LocalStorageError: Error {
    /// Error indicating no data is found for the specified key.
    case noDataForKey
    /// Error indicating a failure to decode the data.
    case decodeError
    /// Error indicating a failure to encode the value.
    case encodeError
}
