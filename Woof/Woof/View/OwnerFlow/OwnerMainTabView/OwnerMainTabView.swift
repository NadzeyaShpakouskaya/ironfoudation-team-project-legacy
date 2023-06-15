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
                Button(navigationBarTrailingItemTitle) {
                    alertIsShown.toggle()
                }
                NavigationLink(
                    destination: OwnerMainTabView(),
                    isActive: $logoutIsConfirmed,
                    label: {
                        EmptyView()
                    }
                )
            }
            .foregroundColor(.App.purpleDark)

            .alert(alertTitle, isPresented: $alertIsShown) {
                Button(continueButtonLabelText) {
                    logoutIsConfirmed.toggle()
                    // TODO: Add PreferenceHandler.set
                }
                Button(
                    cancelButtonLabelText,
                    role: .cancel
                ) { alertIsShown.toggle() }
            }
        }
    }

    // MARK: - Private interface

    @State private var selection: Tab = .sitters
    @State private var alertIsShown = false
    @State private var logoutIsConfirmed = false

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
