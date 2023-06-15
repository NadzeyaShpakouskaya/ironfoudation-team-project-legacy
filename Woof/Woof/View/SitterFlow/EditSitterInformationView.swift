import SwiftUI

/// A view to edit the sitter information.
struct EditSitterInformationView: View {
    // MARK: - Private interface

    private let titleText = "Edit your information"
    private let bioInformationPlaceholderText = "Enter information about yourself"
    private let namePlaceholderText = "Enter your name"
    private let surnamePlaceholderText = "Enter your surname"
    private let pricePlaceholderText = "Enter your price per hour for walking"
    private let phonePlaceholderText = "Enter your phone"
    private let mandatoryPlaceholderText = "*Name is a mandatory field"

    // MARK: - Internal interface

    /// The name of the sitter.
    @Binding var name: String

    /// The surname of the sitter.
    @Binding var surname: String

    /// The phone of the sitter.
    @Binding var phone: String

    /// The additional information about the sitter, like his experience with dogs, favourite places for walks,
    /// special skills, certificates, etc.
    @Binding var bio: String

    /// The price per hour for walking charged by the sitter.
    @Binding var pricePerHour: String

    var body: some View {
        VStack {
            Text(titleText)
            TextField(namePlaceholderText, text: $name)
            TextField(surnamePlaceholderText, text: $surname)
            TextField(phonePlaceholderText, text: $phone)
                .keyboardType(.phonePad)
            TextField(pricePlaceholderText, text: $pricePerHour)
                .keyboardType(.decimalPad)
            TextEditorWithPlaceholder(text: $bio, placeholderText: bioInformationPlaceholderText)
                .cornerRadius(AppStyle.UIElementConstant.cornerRadius)

            if name.isEmpty {
                Text(mandatoryPlaceholderText)
            }
        }
        .padding()
        .foregroundColor(.App.purpleDark)
        .textFieldStyle(.roundedBorder)
        .background(Color.App.purpleLight)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
    }
}

struct EditSitterInformationView_Previews: PreviewProvider {
    static let viewWithFilledFields = EditSitterInformationView(
        name: .constant("Chuck"),
        surname: .constant("Norris"),
        phone: .constant("527637624567"),
        bio: .constant("I have three dogs.I live in NY."),
        pricePerHour: .constant("3.2")
    )

    static let viewWithEmptyFields = EditSitterInformationView(
        name: .constant(""),
        surname: .constant(""),
        phone: .constant(""),
        bio: .constant(""),
        pricePerHour: .constant("")
    )

    static var previews: some View {
        VStack {
            viewWithFilledFields
            viewWithEmptyFields
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
        .previewDisplayName("iPhone 14")

        VStack {
            viewWithFilledFields
            viewWithEmptyFields
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
        .previewDisplayName("iPhone 14 Pro Max")

        VStack {
            viewWithFilledFields
            viewWithEmptyFields
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        .previewDisplayName("iPhone SE")
    }
}
