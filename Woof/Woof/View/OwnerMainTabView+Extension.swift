extension OwnerMainTabView {
    /// Possible tabs in main screen for owner side
    enum Tab {
        /// Indicates the tab where the list of available pet sitters displays
        case sitters
        /// Indicates the tab where the list of walkings displays
        case walkings
        /// Indicates the tab where the personal info and the list of pets displays
        case profile

        /// Provides header for navigation bar
        var header: String {
            switch self {
            case .sitters:
                return "Find your sitter"
            case .walkings:
                return "My walkings"
            case .profile:
                return "My profile"
            }
        }
    }
}
