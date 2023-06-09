import XCTest

final class ConvertNumericValueToStarsRatingTests: XCTestCase {
    func testConvertValueReturnsCaseUnavailableWhenNegativeValueProvided() {
        XCTAssertEqual(DataTransformer.convertNumericValueToStarsRating(-25.0), .unavailable)
    }

    func testConvertValueReturnsCaseUnavailableWhenZeroValueProvided() {
        XCTAssertEqual(DataTransformer.convertNumericValueToStarsRating(0), .unavailable)
    }

    func testConvertValueReturnsCaseUnavailableWhenValueBetweenZeroAndOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.convertNumericValueToStarsRating(0.35), .unavailable)
    }

    func testConvertValueReturnsOneStarWhenOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.convertNumericValueToStarsRating(0.5), .rated(.oneStar))
    }

    func testConvertValueReturnsOneStarWhenValueBetweenOneHalfAndOneProvided() {
        XCTAssertEqual(DataTransformer.convertNumericValueToStarsRating(0.99), .rated(.oneStar))
    }

    func testConvertValueReturnsFourStarsWhenValueBetweenFourAndFourAndHalfProvided() {
        XCTAssertEqual(DataTransformer.convertNumericValueToStarsRating(4.26), .rated(.fourStars))
    }

    func testConvertValueReturnsFiveStarsWhenValueBetweenFourAndHalfAndFiveProvided() {
        XCTAssertEqual(DataTransformer.convertNumericValueToStarsRating(4.56), .rated(.fiveStars))
    }

    func testConvertValueReturnsFiveStarsWhenValueBetweenMoreThenFiveProvided() {
        XCTAssertEqual(DataTransformer.convertNumericValueToStarsRating(124.56), .rated(.fiveStars))
    }
}
