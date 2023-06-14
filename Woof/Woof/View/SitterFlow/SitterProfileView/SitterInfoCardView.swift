import SwiftUI

struct SitterInfoCardView: View {
    /// The name of the pet sitter.
    let name: String

    /// The surname of the pet sitter.
    let surname: String

    /// The phone of the pet sitter.
    let phone: String

    /// The brief information about the pet sitter.
    let bio: String

    /// The price charged by the pet sitter per hour for dog walking.
    let ratePerHour: Double

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                    HStack {
                        Text(name)
                            .lineLimit(lineLimitForNameAndSurname)
                        Text(surname)
                            .lineLimit(lineLimitForNameAndSurname)
                    }
                    .font(
                        .system(
                            size: AppStyle.FontStyle.heading.size,
                            weight: .heavy
                        )
                    )

                    Label(phone, systemImage: .IconName.phone)
                        .lineLimit(linelimitForPhoneNumber)
                }

                Spacer()

                VStack {
                    Text(ratePerHour, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    Text(perHourLabel)
                        .font(Font.system(size: AppStyle.FontStyle.footnote.size))
                }
            }
            .font(
                .system(
                    size: AppStyle.FontStyle.body.size,
                    weight: .bold
                )
            )

            Divider()

            Text(bio)
                .font(Font.system(size: AppStyle.FontStyle.footnote.size))
                .lineLimit(linelimitForBio)
        }
        .padding()
        .background(Color.App.purpleLight)
        .foregroundColor(.App.white)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
    }

    // MARK: - Private interface

    private let perHourLabel = "per hour"
    private let lineLimitForNameAndSurname = 1
    private let linelimitForPhoneNumber = 1
    private let linelimitForBio = 10
}

struct SitterInfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        SitterInfoCardView(
            name: Sitter.Dummy.emilyDoe.name,
            surname: Sitter.Dummy.emilyDoe.surname,
            phone: Sitter.Dummy.emilyDoe.phone,
            bio: Sitter.Dummy.emilyDoe.bio,
            ratePerHour: Sitter.Dummy.emilyDoe.pricePerHour
        )
        .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
        .previewDisplayName("iPhone 14 Pro")

        SitterInfoCardView(
            name: Sitter.Dummy.emilyDoe.name,
            surname: Sitter.Dummy.emilyDoe.surname,
            phone: Sitter.Dummy.emilyDoe.phone,
            bio: Sitter.Dummy.emilyDoe.bio,
            ratePerHour: Sitter.Dummy.emilyDoe.pricePerHour
        )
        .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
        .previewDisplayName("iPhone 14 Pro Max")

        SitterInfoCardView(
            name: Sitter.Dummy.emilyDoe.name,
            surname: Sitter.Dummy.emilyDoe.surname,
            phone: Sitter.Dummy.emilyDoe.phone,
            bio: Sitter.Dummy.emilyDoe.bio,
            ratePerHour: Sitter.Dummy.emilyDoe.pricePerHour
        )
        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        .previewDisplayName("iPhone SE")
    }
}
