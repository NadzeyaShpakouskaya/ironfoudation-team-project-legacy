import XCTest

final class ObfuscatorErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnsExpectedMessage() {
        // Given
        let testString = "a"
        let testArray: [UInt8] = [1]

        // When
        let unconvertibleToInt8Error = ObfuscatorError.unconvertibleToInt8(testString)
        let unconvertibleToStringError = ObfuscatorError.unconvertibleToString(testArray)

        // Then
        XCTAssertEqual(
            unconvertibleToInt8Error.localizedDescription,
            "\(testString) can't be presented as UInt8 value."
        )
        XCTAssertEqual(
            unconvertibleToStringError.localizedDescription,
            """
            \(testArray)
            This bytes sequence can't be interpreted as a string.
            """
        )
    }
}
