import SwiftUI

/// A view to edit the sitter information.
struct EditSitterInformationView: View {
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
            Text(title)
            TextField(nameTextFieldText, text: $name)
            TextField(surnameTextFieldText, text: $surname)
            TextField(phoneTextFieldText, text: $phone)
                .keyboardType(.phonePad)
            TextField(priceTextFieldText, text: $pricePerHour)
                .keyboardType(.decimalPad)
            TextEditorWithPlaceholder(message: $bio, placeholder: bioInformationPlaceholderText)
                .cornerRadius(AppStyle.UIElementConstant.cornerRadius)

            if name.isEmpty {
                Text("*Name is a mandatory field")
            }
        }
        .padding()
        .foregroundColor(.App.purpleDark)
        .textFieldStyle(.roundedBorder)
        .background(Color.App.purpleLight)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
    }
}

// MARK: - Private interface

private let title = "Edit your information"
private let bioInformationPlaceholderText = "Enter information about yourself"
private let nameTextFieldText = "Enter your name"
private let surnameTextFieldText = "Enter your surname"
private let priceTextFieldText = "Enter your price per hour for walking"
private let phoneTextFieldText = "Enter your phone"

struct EditSitterInformationView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EditSitterInformationView(
                name: .constant("Chuck"),
                surname: .constant("Norris"),
                phone: .constant("527637624567"),
                bio: .constant("I have three dogs.I live in NY."),
                pricePerHour: .constant("3.2")
            )

            EditSitterInformationView(
                name: .constant(""),
                surname: .constant(""),
                phone: .constant(""),
                bio: .constant(""),
                pricePerHour: .constant("")
            )
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
        .previewDisplayName("iPhone 14")

        VStack {
            EditSitterInformationView(
                name: .constant("Chuck"),
                surname: .constant("Norris"),
                phone: .constant("527637624567"),
                bio: .constant("I have three dogs.I live in NY."),
                pricePerHour: .constant("3.2")
            )

            EditSitterInformationView(
                name: .constant(""),
                surname: .constant(""),
                phone: .constant(""),
                bio: .constant(""),
                pricePerHour: .constant("")
            )
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
        .previewDisplayName("iPhone 14 Pro Max")

        VStack {
            EditSitterInformationView(
                name: .constant("Chuck"),
                surname: .constant("Norris"),
                phone: .constant("527637624567"),
                bio: .constant("I have three dogs.I live in NY."),
                pricePerHour: .constant("3.2")
            )

            EditSitterInformationView(
                name: .constant(""),
                surname: .constant(""),
                phone: .constant(""),
                bio: .constant(""),
                pricePerHour: .constant("")
            )
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        .previewDisplayName("iPhone SE")
    }
}
