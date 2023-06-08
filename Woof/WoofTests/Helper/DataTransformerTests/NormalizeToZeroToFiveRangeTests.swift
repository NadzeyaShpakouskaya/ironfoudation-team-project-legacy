import XCTest

final class NormalizeToZeroToFiveRangeTests: XCTestCase {
    func testConvertValueReturnsZeroWhenNegativeValueProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(-25.0), .unavailable)
    }

    func testConvertValueReturnsZeroWhenZeroValueProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(0), .unavailable)
    }

    func testConvertValueReturnsZeroWhenValueBetweenZeroAndOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(0.35), .unavailable)
    }

    func testConvertValueReturnsOneWhenOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(0.5), .rated(1))
    }

    func testConvertValueReturnsOneWhenValueBetweenOneHalfAndOneProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(0.99), .rated(1))
    }

    func testConvertValueReturnsFourWhenValueBetweenFourAndFourAndHalfProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(4.26), .rated(4))
    }

    func testConvertValueReturnsOneWhenValueBetweenFourAndHalfAndFiveProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(4.56), .rated(5))
    }

    func testConvertValueReturnsOneWhenValueBetweenMoreThenFiveProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(124.56), .rated(5))
    }
}
