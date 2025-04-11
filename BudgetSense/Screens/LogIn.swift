//
//  LogIn.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI
import FirebaseAuth

struct LogIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    path.removeLast(path.count)
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .padding(.leading)

                Spacer()
            }

            Text("Log in")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 30)

            Text("Invest and double your income now")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 3)
                .padding(.bottom, 50)

            Spacer().frame(height: 20)

            VStack(spacing: 30) {
                TextField("Email address", text: $email)
                    .font(.system(size: 20))
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 10)

                SecureField("Password", text: $password)
                    .font(.system(size: 20))
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 10)
            }

            Spacer().frame(height: 70)

            Button(action: logIn) {
                Text("Access Account")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
            .padding(.horizontal)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            Spacer().frame(height: 20)

            Button(action: {
                path.append("CreateAccount")
            }) {
                Text("Create Account?")
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationDestination(for: String.self) { destination in
            if destination == "CreateAccount" {
                SignUp(path: $path)
            } else if destination == "Homepage" {
                HomepageView()
            }
        }
    }

    func logIn() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = "Login failed: \(error.localizedDescription)"
                return
            }

            errorMessage = ""
            path.removeLast(path.count) // Clear history so user can't go back
            path.append("Homepage")
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogIn(path: .constant(NavigationPath()))
                .previewDevice("iPhone 14")
                .preferredColorScheme(.light)

            LogIn(path: .constant(NavigationPath()))
                .previewDevice("iPhone 14")
                .preferredColorScheme(.dark)
        }
    }
}
