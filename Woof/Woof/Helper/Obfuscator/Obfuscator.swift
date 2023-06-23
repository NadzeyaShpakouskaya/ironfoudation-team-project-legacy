import Foundation

class Obfuscator {
    // MARK: - Internal interface

    init() {
        salt = "\(String(describing: UserRoleViewModel.self))\(String(describing: NSObject.self))"
    }

    /**
     This method obfuscates the string passed in using the salt specified during
     Obfuscator initialization.

     - parameter string: the string to obfuscate

     - returns: the obfuscated string in a byte array
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
     This method reveals the original string from the obfuscated
     byte array passed in. The salt must be the same as the one
     used to encrypt it in the first place.

     - parameter key: the byte array to reveal

     - returns: the original string
     */
    func reveal(key: [UInt8]) -> String {
        let cipher = [UInt8](salt.utf8)
        let length = cipher.count

        var decrypted = [UInt8]()

        for symbol in key.enumerated() {
            decrypted.append(symbol.element ^ cipher[symbol.offset % length])
        }

        return String(bytes: decrypted, encoding: .utf8)!
    }

    // MARK: - Private interface

    /// The salt used to obfuscate and reveal the string.
    private var salt: String
}
