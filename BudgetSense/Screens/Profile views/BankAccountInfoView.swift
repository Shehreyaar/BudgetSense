//
//  BankAccountInfoView.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI

struct BankAccountInfoView: View {
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
            Text("Bank Account Info")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)

            Spacer().frame(height: 20)

            // Example content
            Text("Account details such as IBAN, SWIFT, etc.")
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    BankAccountInfoView()
}
