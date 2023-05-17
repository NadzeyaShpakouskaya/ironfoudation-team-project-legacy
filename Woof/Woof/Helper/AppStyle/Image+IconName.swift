import SwiftUI

extension Image {
    /**
     Represents the different icons used within the application.
     */
    enum IconName {
        /// The icon used for the "Find Sitter" tab.
        static let findSitterTab = "magnifyingglass"
        /// The icon used for the "Walkings" tab.
        static let walkingsTab = "pawprint"
        /// The icon used for the "Profile" tab.
        static let profileTab = "person.text.rectangle"
        /// The icon used for the 'Avatar' placeholder.
        static let avatarPlaceholder = "person.circle"
        /// The icon used for the filled star image.
        static let filledStar = "star.fill"
        /// The icon used for the unfilled star image.
        static let unfilledStar = "star"
        /// The icon used for the phone section image.
        static let phone = "phone.fill"
        /// The icon used for fullName section image.
        static let fullName = "person.fill"
    }
}
