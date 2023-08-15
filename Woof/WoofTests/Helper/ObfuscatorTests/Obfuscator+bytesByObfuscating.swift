extension Obfuscator {
    // MARK: - Internal interface

    /// Obfuscates the passed string using the specified salt.
    ///
    /// - Parameters:
    ///   - string: The string to obfuscate
    ///   - salt: The salt used to obfuscate and reveal the string.
    /// - Returns: The string that consist of ASCII representation of UInt8 numbers
    /// on base 10 separated by a space. Each number corresponds to one byte.
    /// - Complexity: O(*N* + *M*), where *N* is the length of the input string and *M* is the
    /// length of the salt.
    static func bytesByObfuscating(string: String, with salt: String) -> String {
        guard !string.isEmpty else { return "" }
        let stringBytes = [UInt8](string.utf8)

        guard !salt.isEmpty else {
            return convertToString(stringBytes)
        }
        let saltBytes = [UInt8](salt.utf8)
        let saltBytesLength = saltBytes.count

        var obfuscatedBytes = [UInt8]()

        for (index, byte) in stringBytes.enumerated() {
            obfuscatedBytes.append(byte ^ saltBytes[index % saltBytesLength])
        }

        return convertToString(obfuscatedBytes)
    }

    // MARK: - Private interface

    private static func convertToString(_ bytes: [UInt8]) -> String {
        bytes.map { String($0) }.joined(separator: " ")
    }
}
