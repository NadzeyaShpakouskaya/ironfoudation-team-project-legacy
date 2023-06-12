import SwiftUI

/// A view displaying a rating of the person.
struct FiveStarRatingView: View {
    // MARK: Private interface

    /// The text to display if the rating is not specified.
    private let noRatingText = "not rated"

    // MARK: Internal interface

    /// A 5-star rating system, where 5 stars represent the highest rating
    /// and 1 star represents the lowest rating.
    let rating: StarRating

    var body: some View {
        Group {
            switch rating {
            case .unavailable:
                Text(noRatingText)
                    .font(Font.system(size: AppStyle.FontStyle.footnote.size))
            case let .rated(rating):
                HStack(spacing: 0) {
                    ForEach(1...rating.rawValue, id: \.self) { _ in
                        Image(systemName: .IconName.filledStar)
                    }
                }
            }
        }
        .foregroundColor(.App.purpleDark)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FiveStarRatingView(rating: .rated(.fiveStars))
            FiveStarRatingView(rating: .rated(.fourStars))
            FiveStarRatingView(rating: .rated(.threeStars))
            FiveStarRatingView(rating: .rated(.twoStars))
            FiveStarRatingView(rating: .rated(.oneStar))
            FiveStarRatingView(rating: .unavailable)
        }
    }
}
