enum Obfuscator {
    // MARK: - Internal interface

    /// Reveals the original string by deobfuscating it using the cipher.
    /// The passed encrypted string must be obfuscated with the same cipher as the function uses and
    /// consist of ASCII representation of UInt8 numbers in base 10 separated by space.
    ///
    /// - Parameter key: The encrypted string value presented as a string with a sequence of ASCII
    /// representations of UInt8 numbers in base 10 separated by space.
    /// - Returns: The original string revealed by deobfuscating the obfuscated bytes.
    /// - Throws: An `ObfuscatorError` if obfuscation was not successful.
    /// - Complexity: O(*N*), where *N* is the length of the input string.
    static func reveal(key: String) throws -> String {
        let keyAsBytes = try key.split(separator: " ").compactMap { stringUInt8 in
            guard let byte = UInt8(stringUInt8) else { throw ObfuscatorError.nonInt8Value }
            return byte
        }

        guard !keyAsBytes.isEmpty else { return "" }

        let cipher = [UInt8](salt.utf8)
        let length = cipher.count

        var decrypted = [UInt8]()

        for (index, symbol) in keyAsBytes.enumerated() {
            decrypted.append(symbol ^ cipher[index % length])
        }

        guard let result = String(bytes: decrypted, encoding: .utf8) else {
            throw ObfuscatorError.unconvertibleToString
        }

        return result
    }

    // MARK: - Private interface

    private static var salt = ""
}
