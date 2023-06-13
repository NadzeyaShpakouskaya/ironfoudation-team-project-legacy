import XCTest

final class FiveStarRatingTests: XCTestCase {
    func testFiveStarRatingReturnsCaseUnavailableWhenNegativeValueProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: -25.0), .unavailable)
    }

    func testFiveStarRatingReturnsCaseUnavailableWhenZeroValueProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 0), .unavailable)
    }

    func testFiveStarRatingReturnsCaseUnavailableWhenValueBetweenZeroAndOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 0.35), .unavailable)
    }

    func testFiveStarRatingReturnsOneStarWhenOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 0.5), .rated(.oneStar))
    }

    func testFiveStarRatingReturnsOneStarWhenValueBetweenOneHalfAndOneProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 0.99), .rated(.oneStar))
    }

    func testFiveStarRatingReturnsFourStarsWhenValueBetweenFourAndFourAndHalfProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 4.26), .rated(.fourStars))
    }

    func testFiveStarRatingReturnsFiveStarsWhenValueBetweenFourAndHalfAndFiveProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 4.56), .rated(.fiveStars))
    }

    func testFiveStarRatingReturnsFiveStarsWhenValueMoreThenFiveProvided() {
        XCTAssertEqual(DataTransformer.fiveStarRating(for: 124.56), .rated(.fiveStars))
    }
}
