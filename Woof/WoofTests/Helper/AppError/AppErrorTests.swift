import XCTest

final class AppErrorTests: XCTestCase {
    func testAllAppErrorsExistInAPI() {
        // Given
        let setOfAppErrors = Set(AppError.allCases)

        // When
        let expectedAppErrors: Set<AppError> = [
            .saveLocallyFailed,
            .uploadFailed,
        ]

        // Then
        XCTAssertEqual(setOfAppErrors, expectedAppErrors)
    }

    func testAppErrorConformsToErrorProtocol() {
        XCTAssertNotNil(AppError.self as Error.Type)
    }
}
