/// Represents a rating that is used to rate something or someone.
enum Rating {
    /// The rating is unavailable.
    case unavailable

    /// The rating has a specific value.
    case value(Double)
}
