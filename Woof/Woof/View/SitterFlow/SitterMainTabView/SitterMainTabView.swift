import SwiftUI

/// A view representing the main tab view for the sitter.
struct SitterMainTabView: View {
    // MARK: - Public interface

    init() {
        customizeTabBar()
    }

    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Group {
                    Text("My schedule")
                        .tabItem {
                            Label("Schedule", systemImage: .IconName.scheduleTab)
                        }
                        .tag(Tab.schedule)

                    Text("Walkings")
                        .tabItem {
                            Label("Walkings", systemImage: .IconName.walkingsTab)
                        }
                        .tag(Tab.walkings)

                    Text("My profile")
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
                    isActive: $logoutIsConformed,
                    label: {
                        EmptyView()
                    }
                )
            }
            .foregroundColor(.App.purpleDark)

            .alert(alertTitle, isPresented: $alertIsShown) {
                Button(continueButtonLabelText) {
                    logoutIsConformed.toggle()
                    // TODO: PreferenceHandler.set
                }
                Button(
                    cancelButtonLabelText,
                    role: .cancel
                ) { alertIsShown.toggle() }
            }
        }
    }

    // MARK: - Private interface

    @State private var selection: Tab = .schedule
    @State private var alertIsShown = false
    @State private var logoutIsConformed = false

    private let navigationBarTrailingItemTitle = "Logout"
    private let continueButtonLabelText = "Continue"
    private let cancelButtonLabelText = "Cancel"
    private let alertTitle = "Do you really want to log out?"

    private func customizeTabBar() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.unselectedItemTintColor = UIColor(Color.App.grayDark)
    }
}

struct SitterMainTabview_Previews: PreviewProvider {
    static var previews: some View {
        SitterMainTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
        SitterMainTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        SitterMainTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
    }
}
