import Foundation

/// The view model for a sitter card, responsible for preparing and providing data for the view.
final class SitterCardViewModel: ObservableObject {
    /// The full name of the sitter.
    @Published var fullName = ""

    /// The additional information about the sitter.
    @Published var bio = ""

    /// The rating of the sitter, on a scale from 0 to 5.
    @Published var rating = 0

    /// The price per hour charged by the sitter.
    @Published var price = 0.0

    /// The URL of the sitter's avatar image.
    @Published var imageURL: URL?

    /// Initializes a new instance of the sitter card view model with the provided sitter.
    ///
    /// - Parameter sitter: The sitter for which the view model is created.
    init(sitter: Sitter) {
        self.sitter = sitter
        prepareDataForView()
    }

    private var sitter: Sitter

    private func prepareDataForView() {
        fullName = getFormattedNameFor(surname: sitter.surname, name: sitter.name)
        rating = formatRatingZeroToFiveStyle(sitter.rating)
        price = sitter.pricePerHour
        imageURL = sitter.avatarUrl
        bio = sitter.bio
    }

    private func getFormattedNameFor(surname: String, name: String) -> String {
        guard !surname.isEmpty, !name.isEmpty else { return "" }
        return "\(name) \(surname.prefix(1))."
    }

    private func formatRatingZeroToFiveStyle(_ value: Double) -> Int {
        let roundedValue = Int(value.rounded(.toNearestOrAwayFromZero))
        return max(0, min(roundedValue, 5))
    }
}
