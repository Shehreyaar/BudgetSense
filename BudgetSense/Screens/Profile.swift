//
//  ProfileView.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI

struct Profile: View {
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
            
            // Profile Title
            Text("Profile")
                .padding(10)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Spacer().frame(height: 20)
            
            // Profile Image & Name
            VStack(spacing: 8) {
                Image("profile_picture") // Replace with your image asset
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                
                Text("Jonas Macroni")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Expert")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 20)

            // Menu List
            VStack(spacing: 25) {
                ProfileOption(title: "Contact Info", icon: "phone")
                ProfileOption(title: "Source of Funding Info", icon: "creditcard")
                ProfileOption(title: "Bank Account Info", icon: "banknote")
                ProfileOption(title: "Document Info", icon: "doc.text")
                ProfileOption(title: "Settings", icon: "gear")
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

struct ProfileOption: View {
    let title: String
    let icon: String
    
    var body: some View {
        Button(action: {
            print("\(title) tapped")
        }) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .frame(width: 24, height: 24)

                Text(title)
                    .foregroundColor(.black)
                    .font(.body)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
        }
    }
}

#Preview {
    Profile()
}
