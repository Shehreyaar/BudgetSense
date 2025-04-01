//
//  LogIn.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI

struct LogIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            // Back Button (aligned to the left)
            HStack {
                Button(action: {
                    print("Back tapped")
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .padding(.leading)

                Spacer()
            }

            // Title & Subtitle
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

            // Form Fields
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

            // Access Account Button
            Button(action: {
                print("Access Account Tapped")
            }) {
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

            Spacer().frame(height: 20)

            // Create Account Navigation
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
                CreateAccount(path: $path)
            }
        }
    }
}

//#Preview {
//    LogIn()
//}
