import SwiftUI

extension Color {
    /// Describes the color scheme using in the application as mentioned in App style guideline.
    /// For more information check the
    /// [link](https://github.com/ios-course/ironfoudation-team-project/wiki/App-style-guidelines#colors)
    enum App {
        /// Returns `white` color for the application color scheme
        static let white = Color(red: 251 / 255, green: 251 / 255, blue: 251 / 255)
        /// Returns `light gray` color for the application color scheme
        static let grayLight = Color(red: 239 / 255, green: 232 / 255, blue: 232 / 255)
        /// Returns `dark gray` color for the application color scheme
        static let grayDark = Color(red: 126 / 255, green: 126 / 255, blue: 126 / 255)
        /// Returns `light purple` color for the application color scheme
        static let purpleLight = Color(red: 195 / 255, green: 164 / 255, blue: 195 / 255)
        /// Returns `dark purple` color for the application color scheme
        static let purpleDark = Color(red: 116 / 255, green: 75 / 255, blue: 116 / 255)
    }
}
