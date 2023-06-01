import SwiftUI

struct OwnerProfileView: View {
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Text(isEditing ? "Save" : "Edit")
                    }
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
