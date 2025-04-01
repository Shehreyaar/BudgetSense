//
//  ContactInfoView.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI

struct ContactInfoView: View {
    var body: some View {
        VStack {
            // Back Button
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

            // Title
            Text("Contact info")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)

            Spacer().frame(height: 20)

            // Profile Image
            ZStack(alignment: .bottomTrailing) {
                Image("profile_picture") // Reemplázalo con la imagen real
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 5)

                Button(action: {
                    print("Edit profile picture")
                }) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.gray.opacity(0.7)))
                }
            }
            .padding(.bottom, 20)

            // Contact Info Fields
            VStack(spacing: 25) {
                ContactInfoField(label: "Name", value: "Warren Buffet", editable: true)
                ContactInfoField(label: "Birthdate", value: "05 November 1993", editable: true)
                ContactInfoField(label: "Gender", value: "Male", editable: true)
                ContactInfoField(label: "Email", value: "warren.buff@invest.ai", editable: true)
                ContactInfoField(label: "Phone Number", value: "-", editable: false)
                ContactInfoField(label: "Address", value: "-", editable: false)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

// Reusable Component for Contact Info Fields
struct ContactInfoField: View {
    let label: String
    let value: String
    let editable: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(value)
                    .font(.body)
                    .foregroundColor(.black)

                Divider()
            }
            
            Spacer()

            if editable {
                Button(action: {
                    print("Change \(label) tapped")
                }) {
                    Text("Change")
                        .font(.caption)
                        .foregroundColor(.green)
                }
            }
        }
    }
}

#Preview {
    ContactInfoView()
}
