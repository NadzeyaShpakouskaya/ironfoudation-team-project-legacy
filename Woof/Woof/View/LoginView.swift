import SwiftUI

/// A view that allows the user to select a role in the application.
/// Based on the selected role, the user will be directed to the appropriate app flow.
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
                    .buttonStyle(
                        PurpleCapsuleOfInfinityWidth()
                    )
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
                    .buttonStyle(
                        PurpleCapsuleOfInfinityWidth()
                    )
                }
            }
            .padding()
        }
    }

    // MARK: - Private interface

    private var viewModel = LoginViewModel()

    @State private var directToTheOwnerFlow = false
    @State private var directToTheSitterFlow = false

    private let ownerButtonText = "I am an owner"
    private let sitterButtonText = "I am a sitter"
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
