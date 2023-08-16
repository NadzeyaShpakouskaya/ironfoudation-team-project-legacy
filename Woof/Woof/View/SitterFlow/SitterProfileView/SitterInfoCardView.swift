import SwiftUI

/// A view displaying information about the pet sitter.
struct SitterInfoCardView: View {
    // MARK: - Internal interface

    /// The name of the pet sitter.
    let name: String

    /// The surname of the pet sitter.
    let surname: String

    /// The phone of the pet sitter.
    let phone: String

    /// The brief information about the pet sitter.
    let bio: String

    /// The price charged by the pet sitter per hour for walking.
    let ratePerHour: String

    var body: some View {
        VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: AppStyle.UIElementConstant.spacingBetweenElements) {
                    HStack {
                        Text(name)
                            .lineLimit(lineLimitForName)
                        Text(surname)
                            .lineLimit(lineLimitForSurname)
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
                    Text(ratePerHour + defaultCurrency)
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
    private let lineLimitForName = 1
    private let lineLimitForSurname = 1
    private let linelimitForPhoneNumber = 1
    private let linelimitForBio = 10
    private let defaultCurrency = "$"
}

struct SitterInfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SitterProfileViewModel()

        SitterInfoCardView(
            name: viewModel.name,
            surname: viewModel.surname,
            phone: viewModel.phone,
            bio: viewModel.bio,
            ratePerHour: viewModel.pricePerHour
        )
        .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
        .previewDisplayName("iPhone 14 Pro")
    }
}
