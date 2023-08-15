import XCTest

final class ObfuscatorTests: XCTestCase {
    func testRevealReturnsInitialStringWhenInitialStringAndSaltAreEmpty() throws {
        // Given
        let initialString = ""
        let salt = ""

        // When
        let obfuscatedString = Obfuscator.bytesByObfuscating(string: initialString, with: salt)
        let decryptedString = try Obfuscator.reveal(obfuscatedString, salt: salt)

        // Then
        XCTAssertEqual(initialString, decryptedString)
    }

    func testRevealReturnsInitialStringWhenInitialStringAndSaltContainOnlyGap() throws {
        // Given
        let initialString = "  "
        let salt = "  "

        // When
        let obfuscatedString = Obfuscator.bytesByObfuscating(string: initialString, with: salt)
        let decryptedString = try Obfuscator.reveal(obfuscatedString, salt: salt)

        // Then
        XCTAssertEqual(initialString, decryptedString)
    }

    func testRevealReturnsInitialStringWhenSaltIsEmptyAndInitialStringContainsLettersNumbersAndSings() throws {
        // Given
        let initialString = "Abc !@#$%^&*?_012"

        let salt = ""

        // When
        let obfuscatedString = Obfuscator.bytesByObfuscating(string: initialString, with: salt)
        let decryptedString = try Obfuscator.reveal(obfuscatedString, salt: salt)

        // Then
        XCTAssertEqual(initialString, decryptedString)
    }

    func testRevealReturnsInitialStringWhenInitialStringIsEmptyAndSaltContainsLettersNumbersAndSings() throws {
        // Given
        let initialString = ""

        let salt = "Abc !@#$%^&*?_012"

        // When
        let obfuscatedString = Obfuscator.bytesByObfuscating(string: initialString, with: salt)
        let decryptedString = try Obfuscator.reveal(obfuscatedString, salt: salt)

        // Then
        XCTAssertEqual(initialString, decryptedString)
    }

    func testRevealReturnsInitialStringWhenInitialStringAndSaltContainLettersNumbersAndSings() throws {
        // Given
        let initialString = "Abc !@#$%^&*?_012"

        let salt = "Abc_!@#$%^&*?_012"

        // When
        let obfuscatedString = Obfuscator.bytesByObfuscating(string: initialString, with: salt)
        let decryptedString = try Obfuscator.reveal(obfuscatedString, salt: salt)

        // Then
        XCTAssertEqual(initialString, decryptedString)
    }
}
