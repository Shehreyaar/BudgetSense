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
                            .strokeBorder(Color.button, lineWidth: 1)
                    )
                    .padding(.horizontal, 10)


                TextField("Email address", text: $email)
                    .font(.system(size: 20))
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.button, lineWidth: 1)
                    )
                    .padding(.horizontal, 10)
                
                SecureField("Password", text: $password)
                    .font(.system(size: 20))
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.button, lineWidth: 1)
                    )
                    .padding(.horizontal, 10)
            }
            
            Spacer().frame(height: 70)
            
            // Create Account Button
            Button(action: {
                print("Create Account Tapped")
            }) {
                Text("Create account")
                    .font(.system(size: 20))  // Make the font inside the button larger
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)  // Adjust vertical padding to make the button taller
                    .padding(.horizontal, 60) // Adjust horizontal padding for more width
                    .background(Color.button)  // Button background color
                    .foregroundColor(.white)
                    .cornerRadius(25) // Increase the corner radius to make the corners rounder
            }
            .padding(.horizontal)

            
            Spacer().frame(height: 20)
            
            // Login Navigation
            Button(action: {
                print("Login tapped")
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


#Preview {
    CreateAccount()
}
