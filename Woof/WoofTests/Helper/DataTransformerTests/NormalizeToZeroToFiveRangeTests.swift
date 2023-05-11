import XCTest

final class NormalizeToZeroToFiveRangeTests: XCTestCase {
    func testConvertValueReturnsZeroWhenNegativeValueProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(-25.0), 0)
    }

    func testConvertValueReturnsZeroWhenZeroValueProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(0), 0)
    }

    func testConvertValueReturnsZeroWhenValueBetweenZeroAndOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(0.35), 0)
    }

    func testConvertValueReturnsOneWhenOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(0.5), 1)
    }

    func testConvertValueReturnsOneWhenValueBetweenOneHalfAndOneProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(0.99), 1)
    }

    func testConvertValueReturnsFourWhenValueBetweenFourAndFourAndHalfProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(4.26), 4)
    }

    func testConvertValueReturnsOneWhenValueBetweenFourAndHalfAndFiveProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(4.56), 5)
    }

    func testConvertValueReturnsOneWhenValueBetweenMoreThenFiveProvided() {
        XCTAssertEqual(DataTransformer.normalizeToZeroToFiveRange(124.56), 5)
    }
}
