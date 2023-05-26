import SwiftUI

/// A view that displays the profile information of an Owner.
struct OwnerCardView: View {
    /// Tracks whether edit mode is enabled or not.
    @State private var isEditMode: Bool = false

    /// View model responsible for managing the data for the owner card.
    @ObservedObject var viewModel = OwnerCardViewModel()

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
                OwnerInformationCardView(
                    name: viewModel.name,
                    surname: viewModel.surname,
                    phone: viewModel.phone,
                    address: viewModel.address,
                    avatarUrl: viewModel.avatarURL
                )
            }
        }
        .overlay(alignment: .topTrailing) {
            Button(action: {
                if isEditMode {
                    viewModel.save()
                }
                isEditMode = !isEditMode
            }, label: {
                Text(isEditMode ? "Save" : "Edit")
            })
            .padding()
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
