import SwiftUI

/// View which could be used to display or edit information about Owner
struct OwnerProfileView: View {
    /// View model responsible to manage data from model layer
    @ObservedObject var viewModel = OwnerProfileViewModel()

    /// Owner information editing status tracker
    @State private var isEditingTracker = false

    var body: some View {
        VStack {
            if isEditingTracker {
                EditOwnerInformationView(name: $viewModel.name,
                                         surname: $viewModel.surname,
                                         phone: $viewModel.phone,
                                         address: $viewModel.address)
            } else {
                OwnerCardView(name: viewModel.name,
                              surname: viewModel.surname,
                              phone: viewModel.phone,
                              address: viewModel.address,
                              avatarUrl: viewModel.avatarURL)
            }
            Spacer()
        }
        .padding(.horizontal)

        .overlay(alignment: .topTrailing) {
            Button(action: {
                if !viewModel.name.isEmpty {
                    viewModel.save()
                    isEditingTracker.toggle()
                }
            }, label: {
                Text(isEditingTracker ? "Save" : "Edit")
                    .padding(.horizontal)
                    .background(
                        Capsule()
                            .foregroundColor(!viewModel.name.isEmpty ? Color.App.purpleDark : Color.App.grayDark)
                    )
                    .foregroundColor(Color.App.white)
            })
            .padding()
            .padding(.horizontal)
            .disabled(isEditingTracker && viewModel.name.isEmpty)
        }
    }
}

struct OwnerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerProfileView()
    }
}
