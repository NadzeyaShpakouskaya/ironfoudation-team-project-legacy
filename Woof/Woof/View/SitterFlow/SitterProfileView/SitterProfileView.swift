import SwiftUI

/// View to display personal information about the sitter.
struct SitterProfileView: View {
    // MARK: - Internal interface

    /// View model responsible to manage data from model layer.
    @StateObject var viewModel = SitterProfileViewModel()

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
                        Button(cancelButtonLabelText) {
                            viewModel.cancelEditing()
                            isEditingMode = false
                        }

                        Spacer()

                        if viewModel.mandatoryFieldsAreEmpty {
                            Text(mandatoryPlaceholderText)
                                .padding(.vertical)
                        }
                        Button(saveButtonLabelText) {
                            viewModel.save()
                            isEditingMode = false
                        }
                        .disabled(viewModel.mandatoryFieldsAreEmpty)
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

                    if !viewModel.sitterIsSet {
                        Button(editButtonLabelText) {
                            isEditingMode.toggle()
                        }
                    }
                }
                .buttonStyle(CapsuleWithWhiteText())
                .padding()
                .background(Color.App.purpleLight)
                .cornerRadius(AppStyle.UIElementConstant.cornerRadius)
            }

            Spacer()
        }
        .padding(.horizontal)
    }

    // MARK: - Private interface

    private let cancelButtonLabelText = "Cancel"
    private let saveButtonLabelText = "Save"
    private let editButtonLabelText = "Edit"
    private let mandatoryPlaceholderText = "Fields with * are mandatory"
    @State private var isEditingMode = false
}

struct SitterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SitterProfileView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")

        SitterProfileView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")

        SitterProfileView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
    }
}
