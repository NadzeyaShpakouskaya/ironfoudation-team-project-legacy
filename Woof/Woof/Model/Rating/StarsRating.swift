/// A 5-star rating system, where 5 stars represent the highest rating and 1 star represents the lowest rating.
enum StarsRating: Equatable {
    /// The rating is unavailable.
    case unavailable

    /// The rating is available and represents the number of stars.
    case rated(Stars)
}
