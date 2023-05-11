import XCTest

final class FullNameTests: XCTestCase {
    func testGetFormattedNameReturnsEmptyStringWhenEmptyDataProvided() {
        let actualValue = DataTransformer.fullName(name: "", surname: "")
        XCTAssertEqual(actualValue, "")
    }

    func testGetFormattedNameReturnsOnlyNameWhenEmptySurnameProvided() {
        let name = "Kate"
        let surname = ""
        let expectedValue = "Kate"
        let actualValue = DataTransformer.fullName(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsOnlySurnameWhenEmptyNameProvided() {
        let name = ""
        let surname = "Peterson"
        let expectedValue = "Peterson"
        let actualValue = DataTransformer.fullName(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsExpectedFullNameWhenNameWithWhiteSpacesProvided() {
        let name = "   Kate"
        let surname = "Peterson"
        let expectedValue = "Kate Peterson"
        let actualValue = DataTransformer.fullName(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsExpectedFullNameWhenSurameWithWhiteSpacesProvided() {
        let name = "Kate"
        let surname = "   Peterson"
        let expectedValue = "Kate Peterson"
        let actualValue = DataTransformer.fullName(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsExpectedFullNameWhenNonEmptyValuesProvided() {
        let name = "Kate"
        let surname = "Peterson"
        let expectedValue = "Kate Peterson"
        let actualValue = DataTransformer.fullName(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsExpectedValueWhenLowercasedValuesProvided() {
        let name = "kate"
        let surname = "peterson"
        let expectedValue = "Kate Peterson"
        let actualValue = DataTransformer.fullName(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsExpectedValueWhenUppercasedValuesProvided() {
        let name = "KATE"
        let surname = "PETERSON"
        let expectedValue = "Kate Peterson"
        let actualValue = DataTransformer.fullName(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }

    func testGetFormattedNameReturnsExpectedValueWhenUppercasedAndLowercasedValuesProvided() {
        let name = "KaTe"
        let surname = "PEtErsON"
        let expectedValue = "Kate Peterson"
        let actualValue = DataTransformer.fullName(name: name, surname: surname)
        XCTAssertEqual(actualValue, expectedValue)
    }
}
