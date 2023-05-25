import SwiftUI

/// A view that displays the profile information of an Owner.
struct OwnerCardView: View {
    /// View model responsible for managing the data for the owner card.
    @ObservedObject var viewModel = OwnerCardViewModel()
    /// Tracks whether  edit mode is enabled or not.
    @State private var isEditMode: Bool = false

    var body: some View {
        VStack {
            if isEditMode {
                EditOwnerInformationView(
                    name: $viewModel.name,
                    surname: $viewModel.surname,
                    phone: $viewModel.phone,
                    address: $viewModel.address
                )
            } else {
                LoadedOwnerInformationView(
                    name: viewModel.name,
                    surname: viewModel.surname,
                    phone: viewModel.phone,
                    address: viewModel.address,
                    avatarUrl: viewModel.avatarURL
                )
            }
        }.toolbar {
            Button(action: {
                if isEditMode {
                    viewModel.save()
                }
                isEditMode = !isEditMode
            }, label: {
                Text(isEditMode ? "Save" : "Edit")
            })
            .buttonStyle(DefaultAppButtonStyle())
            .disabled(viewModel.name.isEmpty)
        }
    }
}

struct OwnerCardView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerCardView()
    }
}
