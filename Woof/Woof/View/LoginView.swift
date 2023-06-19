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
                        userRoleViewModel.setOwnerRole()
                        directToTheOwnerFlow.toggle()
                    }
                }
                NavigationLink(
                    destination: SitterMainTabView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $directToTheSitterFlow
                ) {
                    Button(sitterButtonText) {
                        userRoleViewModel.setSitterRole()
                        directToTheSitterFlow.toggle()
                    }
                }
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .padding()
        }
    }

    // MARK: - Private interface

    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel

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
