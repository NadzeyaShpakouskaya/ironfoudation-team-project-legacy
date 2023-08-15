extension Obfuscator {
    // MARK: - Internal interface

    /// Obfuscates the passed string using the specified salt.
    ///
    /// - Parameters:
    ///   - string: The string to obfuscate
    ///   - withSalt: The salt used to obfuscate and reveal the string.
    /// - Returns: The string that consist of ASCII representation of UInt8 numbers
    /// on base 10 separated by a space. Each number corresponds to one byte.
    /// - Complexity: O(*N* + *M*), where *N* is the length of the input string and *M* is the
    /// length of the salt.
    static func bytesByObfuscating(string: String, withSalt: String) -> String {
        guard !string.isEmpty else { return "" }
        let stringAsSequenceOfBytes = [UInt8](string.utf8)

        guard !withSalt.isEmpty else {
            return convertToString(stringAsSequenceOfBytes)
        }
        let cipher = [UInt8](withSalt.utf8)
        let cipherLength = cipher.count

        var encrypted = [UInt8]()

        for (index, byte) in stringAsSequenceOfBytes.enumerated() {
            encrypted.append(byte ^ cipher[index % cipherLength])
        }

        return convertToString(encrypted)
    }

    // MARK: - Private interface

    private static func convertToString(_ array: [UInt8]) -> String {
        array.map { String($0) }.joined(separator: " ")
    }
}
