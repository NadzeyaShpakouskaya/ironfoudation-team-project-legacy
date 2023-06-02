import SwiftUI

struct OwnerProfileView: View {
    @ObservedObject var viewModel = OwnerProfileViewModel()
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            VStack {
                if isEditing {
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
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if !viewModel.name.isEmpty {
                            viewModel.save()
                            isEditing.toggle()
                        }
                    }, label: {
                        Text(isEditing ? "Save" : "Edit")
                            .padding()
                            .background(
                                Capsule()
                                    .foregroundColor(Color.App.purpleDark)
                            )
                            .foregroundColor(Color.App.white)
                    })
                    .disabled(isEditing && viewModel.name.isEmpty)
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
