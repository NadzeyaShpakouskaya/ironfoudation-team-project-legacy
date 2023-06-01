import SwiftUI

struct OwnerProfileView: View {
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            VStack {
                Text(isEditing ? "Edit Owner Information" : "Owner Card View")
            }
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
