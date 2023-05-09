import Foundation

/**

 */
final class SitterCardViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var bio = ""
    @Published var rating = 0
    @Published var price = 0.0
    @Published var imageURL: URL?

    private var sitter: Sitter

    init(sitter: Sitter) {
        self.sitter = sitter
        prepareDataForView()
    }

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
