import XCTest

final class AppErrorDescriptionTests: XCTestCase {
    func testErrorDescriptionReturnsExpectedString() {
        // Given
        let saveLocallyFailedDescription = "Oops! We couldn't save your data on your device."
        let uploadFailedDescription = "Oops! We couldn't upload your data to our server."

        // When // Then
        XCTAssertEqual(AppError.saveLocallyFailed.errorDescription, saveLocallyFailedDescription)
        XCTAssertEqual(AppError.uploadFailed.errorDescription, uploadFailedDescription)
    }
}
