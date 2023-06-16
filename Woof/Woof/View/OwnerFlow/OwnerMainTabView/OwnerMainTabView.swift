import SwiftUI

/* A view representing the main tab view for the owner.

 This view displays a tab bar with different tabs for managing pet sitters, walkings, and owner profile information.
 */
struct OwnerMainTabView: View {
    // MARK: - Internal interface

    init() {
        customizeTabBar()
    }

    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Group {
                    SitterListView()
                        .tabItem {
                            Label("Sitters", systemImage: .IconName.findSitterTab)
                        }
                        .tag(Tab.sitters)

                    Text("Walkings stub")
                        .tabItem {
                            Label("Walkings", systemImage: .IconName.walkingsTab)
                        }
                        .tag(Tab.walkings)

                    OwnerProfileView()
                        .tabItem {
                            Label("Profile", systemImage: .IconName.profileTab)
                        }
                        .tag(Tab.profile)
                }
            }
            .tint(Color.App.purpleDark)
            .navigationTitle(selection.header)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(
                    destination: LoginView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $viewModel.logoutIsConfirmed
                ) {
                    Button(navigationBarTrailingItemTitle) {
                        viewModel.alertIsShown.toggle()
                    }
                }
            }
            .foregroundColor(.App.purpleDark)

            .alert(alertTitle, isPresented: $viewModel.alertIsShown) {
                Button(continueButtonLabelText) {
                    viewModel.logoutIsConfirmed.toggle()
                    viewModel.resetCurrentRole()
                }
                Button(
                    cancelButtonLabelText,
                    role: .cancel
                ) { viewModel.alertIsShown.toggle() }
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel = OwnerMainTabViewModel()
    @State private var selection: Tab = .sitters

    private let navigationBarTrailingItemTitle = "Logout"
    private let continueButtonLabelText = "Continue"
    private let cancelButtonLabelText = "Cancel"
    private let alertTitle = "Do you really want to log out?"

    /**
     Customizes the appearance of the tab bar.
     */
    private func customizeTabBar() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.unselectedItemTintColor = UIColor(Color.App.grayDark)
    }
}

struct OwnerMainTabView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerMainTabView()
    }
}
