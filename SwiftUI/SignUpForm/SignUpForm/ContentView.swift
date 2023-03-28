import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Sign Up Form").font(.headline)
            SignUpForm()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SignUpForm: View {
    @StateObject private var viewModel = SignUpFormViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            } footer: {
                Text(viewModel.usernameMessage)
                    .foregroundColor(.red)
            }
            
            Section {
                SecureField("Password", text: $viewModel.password)
                SecureField("Repeat password", text: $viewModel.repeatPassword)
            } footer: {
                Text(viewModel.passwordMessage)
                    .foregroundColor(.red)
            }
            
            Section {
                Button("Sign up") {
                    print("Signing up as \(viewModel.username)")
                }
                .disabled(!viewModel.isValid)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
