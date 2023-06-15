import SwiftUI

/// A view to edit the owner information.
struct EditOwnerInformationView: View {
    /// The name of the owner.
    @Binding var name: String

    /// The surname of the owner.
    @Binding var surname: String

    /// The phone of the owner.
    @Binding var phone: String

    /// The address of the owner.
    @Binding var address: String

    var body: some View {
        VStack {
            Text("Edit your information")
            TextField("Enter your name", text: $name)
            TextField("Enter your surname", text: $surname)
            TextField("Enter your phone", text: $phone)
            TextField("Enter your address", text: $address)

            if name.isEmpty {
                Text("*Name is a mandatory field")
            }
        }
        .padding()
        .foregroundColor(.App.purpleDark)
        .textFieldStyle(.roundedBorder)
        .background(Color.App.purpleLight)
        .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
        .frame(maxWidth: .infinity)
    }
}

struct EditOwnerInformationView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EditOwnerInformationView(
                name: .constant("Emily"),
                surname: .constant("Thompson"),
                phone: .constant("527637624567"),
                address: .constant("My home address")
            )

            EditOwnerInformationView(
                name: .constant(""),
                surname: .constant(""),
                phone: .constant(""),
                address: .constant("")
            )
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
        .previewDisplayName("iPhone 14")

        VStack {
            EditOwnerInformationView(
                name: .constant("Emily"),
                surname: .constant("Thompson"),
                phone: .constant("527637624567"),
                address: .constant("My home address")
            )

            EditOwnerInformationView(
                name: .constant(""),
                surname: .constant(""),
                phone: .constant(""),
                address: .constant("")
            )
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
        .previewDisplayName("iPhone 14 Pro Max")
        VStack {
            EditOwnerInformationView(
                name: .constant("Emily"),
                surname: .constant("Thompson"),
                phone: .constant("527637624567"),
                address: .constant("My home address")
            )

            EditOwnerInformationView(
                name: .constant(""),
                surname: .constant(""),
                phone: .constant(""),
                address: .constant("")
            )
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        .previewDisplayName("iPhone SE")
    }
}
