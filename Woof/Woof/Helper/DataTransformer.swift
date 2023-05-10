import Foundation

/// A utility enum for transforming and formatting data.
enum DataTransformer {
    /// Generates a formatted full name by combining the given surname and name.
    ///
    /// - Parameters:
    ///   - surname: The surname of the person.
    ///   - name: The name of the person.
    /// - Returns: The formatted full name in the format "name initial-of-surname."
    /// If either the surname or the name is empty, an empty string is returned.
    static func getFormattedNameFor(surname: String, name: String) -> String {
        guard !surname.isEmpty, !name.isEmpty else { return "" }
        return "\(name) \(surname.prefix(1))."
    }

    /// Converts a numeric value to an integer within the range of 0 to 5, following the zero-to-five style.
    ///
    /// - Parameter value: The numeric value to be converted.
    /// - Returns: An integer value within the range of 0 to 5.
    /// If the value is less than 0, 0 is returned.
    /// If the value is greater than 5, 5 is returned.
    /// Otherwise, the rounded value is returned. The rounding rule is schoolbook rounding.
    static func convertValueZeroToFiveStyle(_ value: Double) -> Int {
        let roundedValue = Int(value.rounded(.toNearestOrAwayFromZero))
        return max(0, min(roundedValue, 5))
    }

}
