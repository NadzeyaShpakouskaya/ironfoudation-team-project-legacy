import SwiftUI
import XCTest

final class ColorAppSchemeTests: XCTestCase {
    func testColorAppEnumReturnsCorrectValuesForAppColorScheme() {
        let white = Color(red: 251 / 255, green: 251 / 255, blue: 251 / 255)
        let grayLight = Color(red: 239 / 255, green: 232 / 255, blue: 232 / 255)
        let grayDark = Color(red: 126 / 255, green: 126 / 255, blue: 126 / 255)
        let purpleLight = Color(red: 195 / 255, green: 164 / 255, blue: 195 / 255)
        let purpleDark = Color(red: 116 / 255, green: 75 / 255, blue: 116 / 255)

        XCTAssertEqual(white, Color.App.white)
        XCTAssertEqual(grayLight, Color.App.grayLight)
        XCTAssertEqual(grayDark, Color.App.grayDark)
        XCTAssertEqual(purpleLight, Color.App.purpleLight)
        XCTAssertEqual(purpleDark, Color.App.purpleDark)
    }
}
