import SwiftUI

struct SitterProfileView: View {
    // MARK: - Private interface

    /// View model responsible to manage data from model layer.
    @ObservedObject var viewModel = SitterProfileViewModel()

    var body: some View {
        VStack {
            if isEditingMode {
                VStack {
                    EditSitterInformationView(
                        name: $viewModel.name,
                        surname: $viewModel.surname,
                        phone: $viewModel.phone,
                        bio: $viewModel.bio,
                        pricePerHour: $viewModel.pricePerHour
                    )

                    HStack {
                        Button("Save") {
                            viewModel.save()
                            isEditingMode.toggle()
                        }

                        Spacer()

                        Button("Cancel") {
                            isEditingMode.toggle()
                        }
                    }
                }
                .padding()
                .buttonStyle(CapsuleWithWhiteText())
                .background(Color.App.purpleLight)
                .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
            } else {
                VStack {
                    SitterInfoCardView(
                        name: viewModel.name,
                        surname: viewModel.surname,
                        phone: viewModel.phone,
                        bio: viewModel.bio,
                        ratePerHour: viewModel.pricePerHour
                    )

                    Button("Edit") {
                        isEditingMode.toggle()
                    }
                    .disabled(viewModel.name.isEmpty)
                }
                .buttonStyle(CapsuleWithWhiteText())
                .padding()
                .background(Color.App.purpleLight)
                .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
            }
            Spacer()
        }
    }

    // MARK: - Private interface

    /// Sitter information editing status.
    @State private var isEditingMode = false
}

struct SitterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SitterProfileView()
    }
}
