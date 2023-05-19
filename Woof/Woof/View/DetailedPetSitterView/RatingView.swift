import SwiftUI

/// A view displaying a rating of the person.
struct RatingView: View {
    /// The rating of the person.
    let rating: Int

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                if rating == 0 {
                    Text("not rated")
                        .font(Font.system(size: AppStyle.FontStyle.footnote.size))
                } else {
                    HStack(spacing: 0) {
                        ForEach(0..<rating, id: \.self) { _ in
                            Image(systemName: Image.IconName.filledStar)
                        }
                    }
                }
            }.foregroundColor(Color.App.purpleDark)
        }
    }
}

struct RaitingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 3)
    }
}
