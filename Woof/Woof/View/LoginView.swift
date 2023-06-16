import SwiftUI

/// A view that allows the user to select a role in the application.
struct LoginView: View {
    // MARK: - Internal interface

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: OwnerMainTabView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $directToTheOwnerFlow
                ) {
                    Button(ownerButtonText) {
                        viewModel.set(.owner)
                        directToTheOwnerFlow.toggle()
                    }
                }
                NavigationLink(
                    destination: SitterMainTabView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $directToTheSitterFlow
                ) {
                    Button(sitterButtonText) {
                        viewModel.set(.sitter)
                        directToTheSitterFlow.toggle()
                    }
                }
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .padding()
        }
    }

    // MARK: - Private interface

    private var viewModel = LoginViewModel()

    @State private var directToTheOwnerFlow = false
    @State private var directToTheSitterFlow = false

    private let ownerButtonText = "I am a pet owner hahaha"
    private let sitterButtonText = "I am a pet sitter"
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()

