import SwiftUI

struct LoginView: View {
    let viewModel = LoginViewModel()

    var body: some View {
        VStack {
            Button(action: {
                viewModel.selectedRole = SelectedRole.owner
                viewModel.set()
            }, label: {
                Text("Log in as pet owner")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        Capsule()
                            .foregroundColor(Color.App.purpleDark)
                    )
                    .foregroundColor(Color.App.white)
            })

            Button(action: {
                viewModel.selectedRole = SelectedRole.sitter
                viewModel.set()
            }, label: {
                Text("Log in as pet sitter")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        Capsule()
                            .foregroundColor(Color.App.purpleDark)
                    )
                    .foregroundColor(Color.App.white)
            })
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
