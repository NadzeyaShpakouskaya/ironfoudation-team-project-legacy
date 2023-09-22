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

                        Button(saveButtonLabelText) {
                            Task {
                                await viewModel.save()
                            }
                        }
                        .disabled(viewModel.name.isEmpty)
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

                    Button(editButtonLabelText) {
                        isEditingMode.toggle()
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
        .overlay(
            Group {
                if viewModel.isSavingData {
                    Color.white.opacity(AppStyle.UIElementConstant.opacityLevelForProgressViewBackground)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        )
        .alert(
            alertTitle,
            isPresented: $viewModel.isErrorOccurred,
            actions: {
                Button(cancelButtonLabelText) {
                    viewModel.cancelEditing()
                    isEditingMode = false
                }
                Button(tryAgainButtonLabelText) {
                    Task {
                        await viewModel.save()
                    }
                }
            },
            message: {
                Text(viewModel.errorMessage)
            }
        )
    }

    // MARK: - Private interface

    private let cancelButtonLabelText = "Cancel"
    private let saveButtonLabelText = "Save"
    private let editButtonLabelText = "Edit"
    private let tryAgainButtonLabelText = "Try Again"
    private let alertTitle = "Error"
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
