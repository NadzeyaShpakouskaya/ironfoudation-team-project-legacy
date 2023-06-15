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
            Text("Edit your information")
            TextField("Enter your name", text: $name)
            TextField("Enter your surname", text: $surname)
            TextField("Enter your phone", text: $phone)
            TextField("Enter your price per hour for walking", text: $pricePerHour)
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

private let bioInformationPlaceholderText = "Enter information about yourself"

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
