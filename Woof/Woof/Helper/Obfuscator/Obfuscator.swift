enum Obfuscator {
    // MARK: - Internal interface

    /// Reveals the original string by deobfuscating it using the cipher.
    /// The passed encrypted string must be obfuscated with the same cipher as the function uses and
    /// consist of ASCII representation of UInt8 numbers in base 10 separated by space.
    ///
    /// - Parameters:
    ///  - key: The encrypted string value presented as a string with a sequence of ASCII
    /// representations of UInt8 numbers in base 10 separated by space.
    ///  - salt: The salt used to obfuscate and reveal the string.
    /// - Returns: The original string revealed by deobfuscating the obfuscated bytes.
    /// - Throws: An `ObfuscatorError` if obfuscation was not successful.
    /// - Complexity: O(*N* + *M*), where *N* is the length of the input string and *M* is the
    /// length of the salt.
    static func reveal(key: String, salt: String) throws -> String {
        guard !key.isEmpty else { return "" }

        let keyAsSequenceOfBytes = try key.split(separator: " ").map { stringRepresentationOfUInt8 in
            guard let byte = UInt8(stringRepresentationOfUInt8) else { throw ObfuscatorError.nonInt8Value }
            return byte
        }

        if salt.isEmpty {
            guard let decryptedString = String(bytes: keyAsSequenceOfBytes, encoding: .utf8) else {
                throw ObfuscatorError.unconvertibleToString
            }
            return decryptedString
        }

        let cipher = [UInt8](salt.utf8)
        let lengthOfCipher = cipher.count

        var decryptedSequenceOfBytes = [UInt8]()

        for (index, byte) in keyAsSequenceOfBytes.enumerated() {
            decryptedSequenceOfBytes.append(byte ^ cipher[index % lengthOfCipher])
        }

        guard let decryptedString = String(bytes: decryptedSequenceOfBytes, encoding: .utf8) else {
            throw ObfuscatorError.unconvertibleToString
        }

        return decryptedString
    }
}
