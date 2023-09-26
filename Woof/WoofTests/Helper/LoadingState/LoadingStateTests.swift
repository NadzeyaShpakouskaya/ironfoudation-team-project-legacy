import XCTest

final class LoadingStateTests: XCTestCase {
    func testAllLoadingStatesExistInAPI() {
        // Given
        let setOfLoadingStates = Set(LoadingState.allCases)

        // When
        let expectedLoadingStates: Set<LoadingState> = [
            .notInitiated,
            .inProgress,
            .loaded,
            .loadingFailed,
        ]

        // Then
        XCTAssertEqual(setOfLoadingStates, expectedLoadingStates)
    }
}
