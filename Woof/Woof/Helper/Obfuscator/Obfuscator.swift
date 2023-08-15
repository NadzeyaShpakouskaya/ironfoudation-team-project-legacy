/// Provides methods to work with string obfuscation and deobfuscation.
enum Obfuscator {
    // MARK: - Internal interface

    /// Reveals the original string by deobfuscating it using the cipher.
    /// The passed encrypted string must be obfuscated with the same cipher as the function uses and
    /// consist of ASCII representation of UInt8 numbers in base 10 separated by space.
    ///
    /// - Parameters:
    ///  - encryptedString: The encrypted string presented as a sequence of ASCII
    /// representations of UInt8 numbers in base 10 separated by space.
    ///  - salt: The salt used to obfuscate and reveal the string.
    /// - Returns: The original string revealed by deobfuscating the obfuscated bytes.
    /// - Throws: An `ObfuscatorError` if obfuscation was not successful.
    /// - Complexity: O(*N* + *M*), where *N* is the length of the input string and *M* is the
    /// length of the salt.
    static func reveal(_ encryptedString: String, salt: String) throws -> String {
        guard !encryptedString.isEmpty else { return "" }

        let stringBytes = try convertToBytes(encryptedString)
        var decryptedBytes = [UInt8]()

        if salt.isEmpty {
            decryptedBytes = stringBytes
        } else {
            let saltBytes = [UInt8](salt.utf8)
            let saltBytesLength = saltBytes.count

            for (index, byte) in stringBytes.enumerated() {
                decryptedBytes.append(byte ^ saltBytes[index % saltBytesLength])
            }
        }

        guard let decryptedString = String(bytes: decryptedBytes, encoding: .utf8) else {
            throw ObfuscatorError.unconvertibleToString
        }

        return decryptedString
    }

    // MARK: - Private interface

    private static func convertToBytes(_ string: String) throws -> [UInt8] {
        try string.split(separator: " ").map { ASCIIRepresentationOfNumber in
            guard let byte = UInt8(ASCIIRepresentationOfNumber) else { throw ObfuscatorError.nonInt8Value }
            return byte
        }
    }
}
