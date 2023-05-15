import SwiftUI

extension AppStyle {
    /// Provides the font sizes used within the application.
    enum FontStyle {
        /// Size of font uses for titles and headings.
        case heading
        /// Size of font uses as default font size.
        case body
        /// Size of font uses for additional elements.
        case footnote

        var size: CGFloat {
            switch self {
            case .heading:
                return 22.0
            case .body:
                return 18.0
            case .footnote:
                return 14.0
            }
        }
    }
}
