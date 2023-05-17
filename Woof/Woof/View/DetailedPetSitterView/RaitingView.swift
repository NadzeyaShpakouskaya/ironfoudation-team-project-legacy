import SwiftUI

/// A view displaying a rating of the person.
struct RatingView: View {
    /// The rating of the sitter.
    @Binding var rating: Int
    /// Maximum rating value
    var maximumRating = 5

    /// Not highlited image.
    var offImage: Image?
    /// Highlited image.
    var onImage = Image(systemName: "star.fill")
    /// Color used for a filled raiting image.

    var offColor = Color.App.grayDark
    /// Color used for an unfilled raiting image.
    var onColor = Color.App.purpleDark

    var body: some View {
        HStack {
            if rating == 0 {
                Text("not rated")
                    .font(Font.system(size: AppStyle.FontStyle.footnote.size))
            } else {
                ForEach(1..<maximumRating + 1, id: \.self) { number in image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
                }
            }
        }
    }

    private func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
