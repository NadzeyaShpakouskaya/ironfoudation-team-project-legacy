enum ObfuscatorError: Error {
    /// Indicates that a number which was expected as a UInt8 value has an invalid format,
    /// or the value it denotes is not representable in base 10, or is greater than a UInt8
    /// can represent.
    case nonInt8Value
    /// Occurs when the given bytes can't be interpreted as a string in the specified encoding.
    case unconvertibleToString
}
