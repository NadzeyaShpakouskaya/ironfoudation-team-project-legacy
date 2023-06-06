import Foundation

extension SitterMainTabView {
    /// Possible tabs in main screen for sitter side
    enum Tab {
        /// The tab where the sitter can manage their schedule
        case schedule
        /// The tab where the list of walkings displays
        case walkings
        /// The tab where the personal info displays
        case profile

        /// Provides header for navigation bar
        var header: String {
            switch self {
            case .schedule:
                return "My schedule"
            case .walkings:
                return "My walkings"
            case .profile:
                return "My profile"
            }
        }
    }
}
