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
    /// - Returns: The rating from 1 to 5 stars from a 5-star rating, or information that the rating is unavailable.
    /// If the value is less than or equal 0, returned `.unavailable` to indicate an unavailable rating.
    /// If the value is between 1 and 5 (inclusive), returned the rating from 1 to 5 stars from a 5-star rating.
    /// The rounding rule is schoolbook rounding.
    ///
    /// /// Example usage:
    /// ```
    /// let value = 3.7
    /// let normalizedRating = Rating.normalizeToZeroToFiveRange(value)
    /// // normalizedRating is Rating.rated(4)
    /// ```
    static func convertNumericValueToStarsRating(_ value: Double) -> StarsRating {
        let roundedValue = Int(value.rounded(.toNearestOrAwayFromZero))
        let ratingValue = max(0, min(roundedValue, 5))

        guard let stars = Stars(rawValue: ratingValue), ratingValue != 0 else { return .unavailable }
        return .rated(stars)
    }
}
