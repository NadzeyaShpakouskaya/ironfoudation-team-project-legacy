import XCTest

final class ObfuscatorErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnsExpectedMessageForUnconvertibleToInt8Error() {
        // Given
        let testString = "a"

        // When
        let error = ObfuscatorError.unconvertibleToInt8(testString)

        // Then
        XCTAssertEqual(
            error.localizedDescription,
            "\(testString) can't be presented as UInt8 value."
        )
    }

    func testLocalizedDescriptionReturnsExpectedMessageForUnconvertibleToStringError() {
        // Given
        let testArray: [UInt8] = [1]

        // When
        let error = ObfuscatorError.unconvertibleToString(testArray)

        // Then
        XCTAssertEqual(
            error.localizedDescription,
            """
            \(testArray)
            This bytes sequence can't be interpreted as a string.
            """
        )
    }
}
