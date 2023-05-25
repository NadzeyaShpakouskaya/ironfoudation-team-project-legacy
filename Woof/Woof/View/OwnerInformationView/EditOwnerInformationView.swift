import SwiftUI

struct EditOwnerInformationView: View {
    @Binding var name: String
    @Binding var surname: String
    @Binding var phone: String
    @Binding var address: String

    var body: some View {
        VStack {
            Text("Edit your information")
            TextField("Name", text: $name)
            TextField("Surname", text: $surname)
            TextField("Phone", text: $phone)
            TextField("Address", text: $address)

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

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditOwnerInformationView(
            name: .constant(Owner.Dummy.emilyDoe.name),
            surname: .constant(Owner.Dummy.emilyDoe.surname),
            phone: .constant(Owner.Dummy.emilyDoe.phone),
            address: .constant(Owner.Dummy.emilyDoe.address)
        )
    }
}
