import XCTest

final class CopyToClipboardTextTests: XCTestCase {
    func testTheClipboardStoresPassedString() {
        // Given
        let textToCopy = "a"

        // When
        testViewModel.copyToClipboardText(textToCopy)

        // Then
        XCTAssertEqual(textSavedInClipboard, textToCopy)
    }

    func testTheClipboardStoresEmptyStringWhenPassedEmptyString() {
        // Given
        let textToCopyOne = "a"
        let textToCopyTwo = ""
        testViewModel.copyToClipboardText(textToCopyOne)

        // When
        testViewModel.copyToClipboardText(textToCopyTwo)

        // Then
        XCTAssertEqual(textSavedInClipboard, textToCopyTwo)
    }

    func testTheClipboardStoresALongTextWhenPassedLongText() {
        // Given
        let textToCopy = String(repeating: "a", count: 1000)

        // When
        testViewModel.copyToClipboardText(textToCopy)

        // Then
        XCTAssertEqual(textSavedInClipboard, textToCopy)
    }

    func testTheClipboardStoresTheLastPassedText() {
        // Given
        let textToCopyOne = "a"
        let textToCopyTwo = "b"

        // When
        testViewModel.copyToClipboardText(textToCopyOne)
        testViewModel.copyToClipboardText(textToCopyTwo)

        // Then
        XCTAssertEqual(textSavedInClipboard, textToCopyTwo)
    }

    // MARK: - Private interface

    private let testViewModel = DetailSitterViewModel(
        sitter: Sitter(
            name: "",
            surname: "",
            phone: "",
            avatarUrl: nil,
            bio: "",
            rating: 0,
            pricePerHour: 0
        )
    )
    private var textSavedInClipboard: String? {
        UIPasteboard.general.string
    }
}
