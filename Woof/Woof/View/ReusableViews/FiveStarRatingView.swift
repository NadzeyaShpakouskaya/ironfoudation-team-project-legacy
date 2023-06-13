import SwiftUI

/// A view displaying a rating of the person.
struct FiveStarRatingView: View {
    // MARK: Private interface

    private let noRatingText = "not rated"
    private let spacingBetweenStars: CGFloat = 0

    // MARK: Internal interface

    /// A 5-star rating.
    let stars: StarRating

    var body: some View {
        Group {
            switch stars {
            case .unavailable:
                Text(noRatingText)
                    .font(Font.system(size: AppStyle.FontStyle.footnote.size))
            case let .rated(stars):
                HStack(spacing: spacingBetweenStars) {
                    ForEach(1...stars.rawValue, id: \.self) { _ in
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
            FiveStarRatingView(stars: .rated(.fiveStars))
            FiveStarRatingView(stars: .rated(.fourStars))
            FiveStarRatingView(stars: .rated(.threeStars))
            FiveStarRatingView(stars: .rated(.twoStars))
            FiveStarRatingView(stars: .rated(.oneStar))
            FiveStarRatingView(stars: .unavailable)
        }
    }
}
