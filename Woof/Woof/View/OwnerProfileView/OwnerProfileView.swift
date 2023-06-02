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
                    OwnerCardView(name: "John", surname: "Boe", phone: "12345678", address: "happy str", avatarUrl: nil)
                }
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
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
                }
            }
        }
    }
}

struct OwnerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerProfileView()
    }
}
