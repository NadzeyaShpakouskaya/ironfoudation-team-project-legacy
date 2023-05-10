import Foundation

enum DataTransformer {
    static func getFormattedNameFor(surname: String, name: String) -> String {
        guard !surname.isEmpty, !name.isEmpty else { return "" }
        return "\(name) \(surname.prefix(1))."
    }

    static func formatRatingZeroToFiveStyle(_ value: Double) -> Int {
        let roundedValue = Int(value.rounded(.toNearestOrAwayFromZero))
        return max(0, min(roundedValue, 5))
    }
}
