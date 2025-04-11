//
//  SignUp.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUp: View {
    @Binding var path: NavigationPath
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var monthlyBudget = ""
    @State private var errorMessage = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Image(systemName: "chart.bar.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.green)

                Text("Create Your Account")
                    .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)

                VStack(spacing: 15) {
                    TextField("Full Name", text: $fullName)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)

                    TextField("Email", text: $email)
                        .padding()
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)

                    TextField("Monthly Budget", text: $monthlyBudget)
                        .padding()
                        .keyboardType(.decimalPad)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30)

                Button(action: signUp) {
                    Text("Create Account")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 30)

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                Spacer()

                Button(action: {
                    path.append("LogIn")
                }) {
                    Text("Already have an account? Login")
                        .foregroundColor(.green)
                }
                .padding(.bottom, 40)
            }
            .padding(.top, 80)
        }
        .navigationDestination(for: String.self) { destination in
            if destination == "LogIn" {
                LogIn(path: $path)
            } else if destination == "Homepage" {
                HomepageView()
            }
        }
    }

    func signUp() {
        guard !email.isEmpty, !password.isEmpty, !fullName.isEmpty, let budget = Double(monthlyBudget) else {
            errorMessage = "Please fill all fields correctly."
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = "Error: \(error.localizedDescription)"
                return
            }

            guard let uid = result?.user.uid else {
                errorMessage = "User ID not found."
                return
            }

            let user = User(
                id: uid,
                email: email,
                fullName: fullName,
                monthlyBudget: budget,
                createdAt: Date()
            )

            let db = Firestore.firestore()
            db.collection("users").document(uid).setData([
                "email": user.email,
                "fullName": user.fullName,
                "monthlyBudget": user.monthlyBudget,
                "createdAt": Timestamp(date: user.createdAt)
            ]) { error in
                if let error = error {
                    errorMessage = "Failed to save user: \(error.localizedDescription)"
                } else {
                    errorMessage = ""
                    path.removeLast(path.count) // Clear history so user can't go back
                    path.append("Homepage")
                }
            }
        }
    }
}

#Preview {
    SignUp(path: .constant(NavigationPath()))
}
