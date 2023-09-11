/// An error related with deobfuscating process.
enum ObfuscatorError: Error {
    /// Indicates that a number which was expected has an invalid format, or can't be
    /// represented by UInt8 value.
    /// The associated string stores the value that triggered the error.
    case unconvertibleToInt8(String)
    /// Occurs when the given sequence of bytes can't be interpreted as a string in
    /// the specified encoding.
    /// The associated value stores the sequence that triggered the error.
    case unconvertibleToString([UInt8])

    var localizedDescription: String {
        switch self {
        case let .unconvertibleToInt8(value):
            return "\(value) can't be presented as UInt8 value."
        case let .unconvertibleToString(bytes):
            return """
            \(bytes)
            This bytes sequence can't be interpreted as a string.
            """
        }
    }
}
