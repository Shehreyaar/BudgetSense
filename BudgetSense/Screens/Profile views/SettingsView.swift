//
//  SettingsView.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false  // Use @AppStorage to persist the setting

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
            Text("Settings")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)

            Spacer().frame(height: 20)

            // Example content
            Text("Change preferences and settings")
                .font(.body)
                .padding()

            // Dark Mode Toggle Button
            Toggle("Enable Dark Mode", isOn: $isDarkMode)
                .padding()

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}


#Preview {
    SettingsView()
}
