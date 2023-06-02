import SwiftUI

struct OwnerProfileView: View {
    @State private var isEditing = false
    @State private var name = "John"
    @State private var surname = "Doe"
    @State private var phone = ""
    @State private var address = ""

    var body: some View {
        NavigationView {
            VStack {
                if isEditing {
                    EditOwnerInformationView(name: $name, surname: $surname, phone: $phone, address: $address)
                } else {
                    Text("Owner Card View")
                }
            }
            .padding()
            .navigationBarItems(trailing:
                Button(action: {
                    isEditing.toggle()
                }, label: {
                    Text(isEditing ? "Save" : "Edit")
                        .padding()
                        .background(
                            Capsule()
                                .foregroundColor(Color.App.purpleDark)
                        )
                        .foregroundColor(Color.App.white)
                })
            )
        }
    }
}

struct OwnerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerProfileView()
    }
}
