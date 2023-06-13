import XCTest

final class FiveStarRatingTests: XCTestCase {
    func testReturnsCaseUnavailableWhenNegativeValueProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: -25.0), .unavailable)
    }

    func testReturnsCaseUnavailableWhenZeroValueProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 0), .unavailable)
    }

    func testReturnsCaseUnavailableWhenValueBetweenZeroAndOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 0.35), .unavailable)
    }

    func testReturnsFiveStarsWhenValueMoreThenFiveProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 124.56), .rated(.fiveStars))
    }

    func testReturnsExpectedStarsForTheGivenValues() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 0.5), .rated(.oneStar))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 1.0), .rated(.oneStar))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 1.5), .rated(.twoStars))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 2.0), .rated(.twoStars))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 2.5), .rated(.threeStars))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 3.0), .rated(.threeStars))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 3.5), .rated(.fourStars))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 4.0), .rated(.fourStars))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 4.5), .rated(.fiveStars))
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 5.0), .rated(.fiveStars))
    }
}
