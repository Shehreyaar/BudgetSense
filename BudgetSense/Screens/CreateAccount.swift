//
//  CreateAccount.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI

struct CreateAccount: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            // Back Button (aligned to the left)
            HStack {
                Button(action: {
                    path.removeLast() // Go back
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .padding(.leading)

                Spacer()
            }

            // Title & Subtitle
            Text("Create an account")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 30)

            Text("Invest and double your income now")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 3)
                .padding(.bottom, 50)

            Spacer().frame(height: 20)

            // Form Fields
            VStack(spacing: 30) {
                TextField("Full name", text: $fullName)
                    .font(.system(size: 20))
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 10)

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

            // Create Account Button
            Button(action: {
                print("Account Created Successfully")
                path.removeLast() // Go back to Login after account creation
            }) {
                Text("Create account")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
            .padding(.horizontal)

            Spacer().frame(height: 20)

            // Back to Login
            Button(action: {
                path.removeLast()
            }) {
                Text("Already have an account?")
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
