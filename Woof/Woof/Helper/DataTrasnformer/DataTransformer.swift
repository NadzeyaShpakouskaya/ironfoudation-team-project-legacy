import Foundation

/// A utility for converting and formatting data into a format convenient for the work of the application
/// and displaying data to the user.
enum DataTransformer {
    /// Returns formatted full name by combining the given name and surname.
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
    /// - Returns: The formatted full name in the format "Name Surname".
    static func fullName(name: String, surname: String) -> String {
        let formattedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let formattedSurname = surname.trimmingCharacters(in: .whitespacesAndNewlines)
        return "\(formattedName) \(formattedSurname)"
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }

    /// Converts a numeric value to an integer within the range of 0 to 5, following the zero-to-five style.
    ///
    /// - Parameter value: The numeric value to be converted.
    /// - Returns: An integer value within the range of 0 to 5.
    /// If the value is less than 0, 0 is returned.
    /// If the value is greater than 5, 5 is returned.
    /// Otherwise, the rounded value is returned. The rounding rule is schoolbook rounding.
    static func normalizeToZeroToFiveRange(_ value: Double) -> Int {
        let roundedValue = Int(value.rounded(.toNearestOrAwayFromZero))
        return max(0, min(roundedValue, 5))
    }
}
