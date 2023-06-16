import SwiftUI

/// A view that allows the user to select a role in the application.
struct LoginView: View {
    // MARK: - Internal interface

    @EnvironmentObject var startVM: StartScreenViewModel

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: OwnerMainTabView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $directToTheOwnerFlow
                ) {
                    Button(ownerButtonText) {
                        startVM.set(.owner)
                        directToTheOwnerFlow.toggle()
                    }
                }
                NavigationLink(
                    destination: SitterMainTabView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $directToTheSitterFlow
                ) {
                    Button(sitterButtonText) {
                        startVM.set(.sitter)
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

    private let ownerButtonText = "I am a pet owner"
    private let sitterButtonText = "I am a pet sitter"
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
