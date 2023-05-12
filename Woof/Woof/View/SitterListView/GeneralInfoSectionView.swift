import SwiftUI

struct GeneralInfoView: View {
    let fullName: String
    let rating: Int
    let price: Double

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fullName)
                    .bold()
                Group {
                    if rating == 0 {
                        Text("not rated")
                            .font(Font.system(size: AppStyle.FontSize.callout))
                    } else {
                        HStack(spacing: 0) {
                            ForEach(0..<rating, id: \.self) { _ in
                                Image(systemName: Image.IconName.filledStar)
                            }
                        }
                    }
                }.foregroundColor(Color.App.purpleDark)
            }
            Spacer()
            VStack {
                Text(price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                Text("per hour")
                    .font(Font.system(size: AppStyle.FontSize.callout))
            }
        }
        .padding(.vertical, AppStyle.UIElementSize.minPadding)
        .font(Font.system(size: AppStyle.FontSize.heading))
        .foregroundColor(Color.App.grayDark)
    }
}

struct GeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralInfoView(
            fullName: "Kate Alnderson",
            rating: 0,
            price: 18.78
        )
    }
}
