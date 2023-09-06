import XCTest

final class APIEnvironmentTests: XCTestCase {
    func testAllEnvironmentsExistInAPI() {
        // Given
        let setOfAPIEnvironments = Set(APIEnvironment.allCases)

        // When
        let expectedAPIEnvironments: Set<APIEnvironment> = [
            .production,
            .staging,
        ]

        // Then
        XCTAssertEqual(setOfAPIEnvironments, expectedAPIEnvironments)
    }
}
