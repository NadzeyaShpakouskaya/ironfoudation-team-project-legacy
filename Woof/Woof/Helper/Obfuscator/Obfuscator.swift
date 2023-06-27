import Foundation

class Obfuscator {
    // MARK: - Internal interface

    init() {
        salt = "\(String(describing: UserRoleViewModel.self))\(String(describing: NSObject.self))"
    }

    /**
     Takes a string and obfuscates it by XOR-ing it with a cipher.

     - Parameter string: The string to be obfuscated.

     - Returns: An array of UInt8 bytes representing the obfuscated string.
     */
    func bytesByObfuscatingString(string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let cipher = [UInt8](salt.utf8)
        let length = cipher.count

        var encrypted = [UInt8]()

        for symbol in text.enumerated() {
            encrypted.append(symbol.element ^ cipher[symbol.offset % length])
        }

        #if DEVELOPMENT
            print("Salt used: \(salt)\n")
            print("Swift Code:\n************")
            print("// Original \"\(string)\"")
            print("let key: [UInt8] = \(encrypted)\n")
        #endif

        return encrypted
    }

    /**
     Takes an array of obfuscated UInt8 bytes and reveals the original string by deobfuscating it using the cipher.
     The cipher must be the same as the one used to encrypt it in the first place.

     - Parameter key: An array of obfuscated UInt8 bytes to decrypted.

     - Returns: The original string revealed by deobfuscating the obfuscated bytes.
     */
    func reveal(key: [UInt8]) -> String? {
        let cipher = [UInt8](salt.utf8)
        let length = cipher.count

        var decrypted = [UInt8]()

        for symbol in key.enumerated() {
            decrypted.append(symbol.element ^ cipher[symbol.offset % length])
        }

        if let revealedData = String(bytes: decrypted, encoding: .utf8) {
            return revealedData
        } else {
            return nil
        }
    }

    // MARK: - Private interface

    /// The salt used to obfuscate and reveal the string.
    private var salt: String
}
