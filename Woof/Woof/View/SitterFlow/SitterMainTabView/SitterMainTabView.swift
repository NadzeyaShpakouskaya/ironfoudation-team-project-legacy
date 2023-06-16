import SwiftUI

/// A view representing the main tab view for the sitter.
struct SitterMainTabView: View {
    // MARK: - Internal interface

    @EnvironmentObject var startVM: RoleFlowManager
    @Environment(\.dismiss) var dismiss

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
                    startVM.resetCurrentRole()
                    dismiss()
                }
                Button(
                    cancelButtonLabelText,
                    role: .cancel
                ) { viewModel.alertIsShown.toggle() }
            }
        }
    }

    // MARK: - Private interface

    @StateObject private var viewModel = SitterMainTabViewModel()
    @State private var selection: Tab = .schedule

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
