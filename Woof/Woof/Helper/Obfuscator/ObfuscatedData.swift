import Foundation

enum ObfuscatedData {
    // MARK: - Locally stored Key for each team member

    // If we decide to store data locally for each team member and read the data from specified path,
    // `SensitiveData`.plist should be added at .gitignore file

    static let key: [UInt8] = Obfuscator().bytesByObfuscatingString(string: Self.loadedKey)
    static let header: [UInt8] = Obfuscator().bytesByObfuscatingString(string: Self.loadedHeader)

    // MARK: Private interface

    // read the sensitive data from file and transform to dictionary/
    private static func readData() -> [String: Any] {
        guard let infoPlistPath = Bundle.main.url(forResource: Self.fileName, withExtension: Self.fileExtension) else {
            return [:]
        }
        guard let infoPlistData = try? Data(contentsOf: infoPlistPath),
              let dictionaryFromPlist = try? PropertyListSerialization.propertyList(
                  from: infoPlistData,
                  options: [],
                  format: nil
              ) as? [String: Any]
        else {
            return [:]
        }

        return dictionaryFromPlist
    }

    private static let fileName = "SensitiveData"
    private static let fileExtension = "plist"

    private static let dictionary = Self.readData()

    private static let loadedKey = dictionary["key"] as? String ?? ""
    private static let loadedHeader = dictionary["authHeader"] as? String ?? ""
}
