import SwiftUI

/* A view representing the main tab view for the owner.

 This view displays a tab bar with different tabs for managing pet sitters, walkings, and owner profile information.
 */
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
