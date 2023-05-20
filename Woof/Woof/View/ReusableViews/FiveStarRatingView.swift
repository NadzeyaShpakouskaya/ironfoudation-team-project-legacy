import SwiftUI

/// A view displaying a rating of the person.
struct FiveStarRatingView: View {
    /// The rating of the person.
    let rating: Int
    /// The text will be displayed if the rating is not specified.
    private let noRatingText = "not rated"

    var body: some View {
        Group {
            if rating == 0 {
                Text(noRatingText)
                    .font(Font.system(size: AppStyle.FontStyle.footnote.size))
            } else {
                HStack(spacing: 0) {
                    ForEach(1...rating, id: \.self) { _ in
                        Image(systemName: Image.IconName.filledStar)
                    }
                }
            }
        }
        .foregroundColor(.App.purpleDark)
    }
}

struct RaitingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FiveStarRatingView(rating: 5)
            FiveStarRatingView(rating: 4)
            FiveStarRatingView(rating: 3)
            FiveStarRatingView(rating: 2)
            FiveStarRatingView(rating: 1)
            FiveStarRatingView(rating: 0)
        }
    }
}
