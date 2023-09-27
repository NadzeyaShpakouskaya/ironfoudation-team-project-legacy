import XCTest

final class AppErrorDescriptionTests: XCTestCase {
    func testErrorDescriptionReturnsExpectedString() {
        // Given
        let saveLocallyFailedDescription = "Oops! We couldn't save your data on your device."
        let uploadFailedDescription = "Oops! We couldn't upload your data to our server."
        let noInternetConnectionDescription = "Something wrong. Check your internet connection."
        let downloadFailedDescription = "Oops! We couldn't load data from our server."

        // When // Then
        XCTAssertEqual(AppError.saveLocallyFailed.errorDescription, saveLocallyFailedDescription)
        XCTAssertEqual(AppError.uploadFailed.errorDescription, uploadFailedDescription)
        XCTAssertEqual(AppError.noInternetConnection.errorDescription, noInternetConnectionDescription)
        XCTAssertEqual(AppError.downloadFailed.errorDescription, downloadFailedDescription)
    }
}
