import XCTest

final class ConvertValueZeroToFiveStyleTests: XCTestCase {
    func testConvertValueReturnsZeroWhenNegativeValueProvided() {
        XCTAssertEqual(DataTransformer.convertValueZeroToFiveStyle(-25.0), 0)
    }

    func testConvertValueReturnsZeroWhenZeroValueProvided() {
        XCTAssertEqual(DataTransformer.convertValueZeroToFiveStyle(0), 0)
    }

    func testConvertValueReturnsOneWhenOneHalfValueProvided() {
        XCTAssertEqual(DataTransformer.convertValueZeroToFiveStyle(0.5), 1)
    }

    func testConvertValueReturnsOneWhenValueBetweenOneHalfAndOneProvided() {
        XCTAssertEqual(DataTransformer.convertValueZeroToFiveStyle(0.99), 1)
    }

    func testConvertValueReturnsOneWhenValueBetweenFourAndHalfAndFiveProvided() {
        XCTAssertEqual(DataTransformer.convertValueZeroToFiveStyle(4.56), 5)
    }

    func testConvertValueReturnsOneWhenValueBetweenMoreThenFiveProvided() {
        XCTAssertEqual(DataTransformer.convertValueZeroToFiveStyle(124.56), 5)
    }
}
