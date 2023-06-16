import SwiftUI

/// A view that allows the user to select a role in the application.
struct LoginView: View {
    // MARK: - Internal interface

    /// Responsible for managing and actual state of the current user role in the app.
    @EnvironmentObject var roleFlowManager: RoleFlowManager

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: OwnerMainTabView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $directToTheOwnerFlow
                ) {
                    Button(ownerButtonText) {
                        roleFlowManager.set(.owner)
                        directToTheOwnerFlow.toggle()
                    }
                }
                NavigationLink(
                    destination: SitterMainTabView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $directToTheSitterFlow
                ) {
                    Button(sitterButtonText) {
                        roleFlowManager.set(.sitter)
                        directToTheSitterFlow.toggle()
                    }
                }
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .padding()
        }
    }

    // MARK: - Private interface

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
