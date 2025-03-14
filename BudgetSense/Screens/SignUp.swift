//
//  SignUp.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
           VStack(spacing: 30) {
               // Illustration Placeholder
               Image(systemName: "chart.bar.fill") // Replace with your custom image
                   .resizable()
                   .scaledToFit()
                   .frame(width: 150, height: 150)
                   .foregroundColor(.green)
               
               // Title
               Text("Stay on top of your finances with us.")
                               .font(.system(size: 36, weight: .bold))  // Increased font size
                               .padding(10)
                               .multilineTextAlignment(.center)
                               .padding(.horizontal)
               
               // Subtitle
               Text("We are your new financial advisors, recommending the best investments for you.")
                   .font(.system(size: 16))
                   .foregroundColor(.black)
                   .padding(2)
                   .multilineTextAlignment(.center)
                   .padding(.horizontal)
               
               Spacer()
               
               // Buttons
               VStack(spacing: 10) {
                   // Create Account Button
                   NavigationLink(destination: Text("Create Account Screen")) { // Replace with actual screen
                       Text("Create Account")
                           .fontWeight(.bold)
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color.button)
                           .foregroundColor(.white)
                           .cornerRadius(20)
                   }
                   .padding(.horizontal, 30)
                   
                   // Login Button
                   NavigationLink(destination: Text("Login Screen")) { // Replace with actual screen
                       Text("Login")
                           .foregroundColor(.green)
                   }
               }
               .padding(.bottom, 85)
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .padding(.top, 80)
       }
   }

#Preview {
    SignUp()
}


