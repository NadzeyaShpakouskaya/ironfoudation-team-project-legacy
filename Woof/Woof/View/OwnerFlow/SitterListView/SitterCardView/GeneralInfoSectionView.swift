import SwiftUI
/// A view displaying general information about a person.
struct GeneralInfoSectionView: View {
    /// The full name of the person.
    let fullName: String

    /// The rating of the person.
    let rating: Int

    /// The price associated with the person.
    let price: Double

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fullName)
                    .bold()
                    .lineLimit(1)
                FiveStarRatingView(rating: rating)
            }
            Spacer()
            VStack {
                Text(price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                Text("per hour")
                    .font(Font.system(size: AppStyle.FontStyle.footnote.size))
            }
        }
        .padding(.vertical, AppStyle.UIElementConstant.minPadding)
        .font(Font.system(size: AppStyle.FontStyle.heading.size))
        .foregroundColor(Color.App.grayDark)
    }
}

struct GeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralInfoSectionView(
            fullName: "Kate Anderson",
            rating: 0,
            price: 18.78
        )
    }
}
