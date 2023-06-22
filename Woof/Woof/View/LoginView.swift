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
                    isActive: $viewModel.isOwnerRoleSelected
                ) {
                    Button(ownerButtonText) {
                        userRoleViewModel.setOwnerRole()
                        viewModel.isOwnerRoleSelected = true
                    }
                }
                NavigationLink(
                    destination: SitterMainTabView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $viewModel.isSitterRoleSelected
                ) {
                    Button(sitterButtonText) {
                        userRoleViewModel.setSitterRole()
                        viewModel.isSitterRoleSelected = true
                    }
                }
            }
            .buttonStyle(PurpleCapsuleOfInfinityWidth())
            .padding()
        }
    }

    // MARK: - Private interface

    @EnvironmentObject private var userRoleViewModel: UserRoleViewModel

    @ObservedObject private var viewModel = LoginViewModel()

    private let ownerButtonText = "I am a pet owner"
    private let sitterButtonText = "I am a pet sitter"
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
