import Foundation

/// A utility for converting and formatting data into a format convenient for the work of the application
/// and displaying data to the user.
enum DataTransformer {
    /// Returns full name by combining the given name and surname.
    ///
    /// Examples of usage:
    /// ```
    /// let fullName = fullName(name: "Kate", surname: "Peterson")
    /// print(fullName) // "Kate Peterson"
    ///
    /// let fullName = fullName(name: "KaTe", surname: "PeTErsoN")
    /// print(fullName) // "Kate Peterson"
    ///
    /// let fullName = fullName(name: "KATE", surname: "PETERSON")
    /// print(fullName) // "Kate Peterson"
    /// ```
    ///
    /// - Parameters:
    ///   - surname: The surname of the person.
    ///   - name: The name of the person.
    /// - Returns: The full name in the format "Name Surname".
    static func fullName(name: String, surname: String) -> String {
        let formattedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let formattedSurname = surname.trimmingCharacters(in: .whitespacesAndNewlines)
        return "\(formattedName) \(formattedSurname)"
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }

    /// Converts a numeric value to a rating corresponding to a 5-star rating.
    ///
    /// - Parameter value: The numeric value to be converted.
    /// - Returns: The rating from 1 to 5 stars from a 5-star rating, if the value is between 1 and 5 (inclusive),
    /// and 5 star as a maximum available rating if the value > 5.
    /// The rounding rule is schoolbook rounding.
    /// If the given value &lt;= 0, returns `.unavailable` to indicate an unavailable rating.
    ///
    /// /// Example usage:
    /// ```
    /// let value = 3.7
    /// let convertedRating = StarRating.fiveStarRating(for: value)
    /// // convertedRating is StarRating.rated(.fourStars)
    /// ```
    static func fiveStarRating(for value: Double) -> StarRating {
        let roundedValue = Int(value.rounded(.toNearestOrAwayFromZero))
        let rating = max(0, min(roundedValue, 5))
        let stars = Stars(rawValue: rating)

        guard let stars, rating > 0 else { return .unavailable }
        return .rated(stars)
    }
}
