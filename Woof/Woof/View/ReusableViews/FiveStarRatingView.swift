import SwiftUI

/// A view displaying a rating of the person.
struct FiveStarRatingView: View {
    // MARK: Private interface

    /// The text to display if the rating is not specified.
    private let noRatingText = "not rated"

    // MARK: Internal interface

    /// The rating in the range from 0 to 5 stars.
    /// The rating equals zero, if it's not specified.
    let rating: Rating

    var body: some View {
        HStack(spacing: 0) {
            switch rating {
            case .unavailable:
                Text(noRatingText)
                    .font(Font.system(size: AppStyle.FontStyle.footnote.size))
            case let .rated(rating):
                ForEach(1...Int(rating), id: \.self) { _ in
                    Image(systemName: .IconName.filledStar)
                }
            }
        }
        .foregroundColor(.App.purpleDark)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FiveStarRatingView(rating: .rated(5))
            FiveStarRatingView(rating: .rated(4))
            FiveStarRatingView(rating: .rated(3))
            FiveStarRatingView(rating: .rated(2))
            FiveStarRatingView(rating: .rated(1))
            FiveStarRatingView(rating: .rated(0))
            FiveStarRatingView(rating: .unavailable)
        }
    }
}
