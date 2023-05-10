import XCTest

final class DataTransformerTests: XCTestCase {
    func testGetFormattedNameReturnsEmptyStringWhenEmptyDataProvided() {
        let actualValue = DataTransformer.getFormattedNameFor(name: "", surname: "")
        XCTAssertEqual(actualValue, "")
    }

    func testGetFormattedNameReturnsOnlyNameWhenEmptySurnameProvided() {
        let name = "Kate"
        let surname = ""
        let expectedValue = "Kate"
        let actualValue = DataTransformer.getFormattedNameFor(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsOnlySurnameWhenEmptyNameProvided() {
        let name = ""
        let surname = "Peterson"
        let expectedValue = "Peterson"
        let actualValue = DataTransformer.getFormattedNameFor(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsExpectedFullNameWhenNonEmptyValuesProvided() {
        let name = "Kate"
        let surname = "Peterson"
        let expectedValue = "Kate Peterson"
        let actualValue = DataTransformer.getFormattedNameFor(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }
}
