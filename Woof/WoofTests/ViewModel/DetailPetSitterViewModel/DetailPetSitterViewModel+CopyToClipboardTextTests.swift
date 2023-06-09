import XCTest

// swiftlint:disable:next type_name
final class DetailPetSitterViewModelCopyToClipboardTextTests: XCTestCase {
    func testThePassedTextIsCopiedToClipboard() {
        // Given
        let textToCopy = "a"

        // When
        testViewModel.copyToClipboardText(textToCopy)

        // Then
        XCTAssertEqual(UIPasteboard.general.string, textToCopy)
    }

    func testTheClipboardStoresEmptyStringWhenPassedEmptyString() {
        // Given
        let textToCopyOne = "a"
        let textToCopyTwo = ""
        testViewModel.copyToClipboardText(textToCopyOne)

        // When
        testViewModel.copyToClipboardText(textToCopyTwo)

        // Then
        XCTAssertEqual(UIPasteboard.general.string, textToCopyTwo)
    }

    func testTheClipboardStoresALongTextWhenPassedLongText() {
        // Given
        let textToCopy = String(repeating: "a", count: 1000)

        // When
        testViewModel.copyToClipboardText(textToCopy)

        // Then
        XCTAssertEqual(UIPasteboard.general.string, textToCopy)
    }

    func testTheClipboardStoresTheLastPassedText() {
        // Given
        let textToCopyOne = "a"
        let textToCopyTwo = "b"

        // When
        testViewModel.copyToClipboardText(textToCopyOne)
        testViewModel.copyToClipboardText(textToCopyTwo)

        // Then
        XCTAssertEqual(UIPasteboard.general.string, textToCopyTwo)
    }

    // MARK: - Private interface

    private let testViewModel = DetailSitterViewModel(sitter: Sitter.Dummy.emilyDoe)
}
