import SwiftUI

struct OwnerMainTabView: View {
    @State private var selection: Tab = .sitters

    init() {
        customizeTabBar()
    }

    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Group {
                    Text("List of pet sitters")
                        .tabItem {
                            Label("Sitters", systemImage: "magnifyingglass")
                        }
                        .tag(Tab.sitters)

                    Text("Walkings stub")
                        .tabItem {
                            Label("Walkings", systemImage: "pawprint")
                        }
                        .tag(Tab.walkings)

                    Text("Pet owner info")
                        .tabItem {
                            Label("Profile", systemImage: "person.text.rectangle")
                        }
                        .tag(Tab.profile)
                }
            }
            .navigationTitle(selection.header)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func customizeTabBar() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.unselectedItemTintColor = UIColor(Color.grayDark)
    }
}

struct OwnerMainTabView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerMainTabView()
    }
}

extension OwnerMainTabView {
    /// Possible tabs in main screen for owner side
    enum Tab {
        /// Indicates the tab where the list of available pet sitters displays
        case sitters
        /// Indicates the tab where the list of walkings displays
        case walkings
        /// Indicates the tab where the  personal info and the list of pets displays
        case profile

        /// Provides header for navigation bar
        var header: String {
            switch self {
            case .sitters:
                return "Find your sitter"
            case .walkings:
                return "My walkings"
            case .profile:
                return "My profile"
            }
        }
    }
}
