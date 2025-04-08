    //
    //  SourceOfFundingInfoView.swift
    //  Finance
    //
    //  Created by english on 2025-03-11.
    //

import SwiftUI

struct SourceOfFundingInfoView: View {
    // You can later replace this with dynamic data from a ViewModel
    let fundingSources: [FundingSource] = sampleFundingSources

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
            Text("Source of Funding Info")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)

            Spacer().frame(height: 20)

            // List of Funding Sources
            ForEach(fundingSources, id: \.sourceName) { source in
                VStack(alignment: .leading, spacing: 6) {
                    Text(source.sourceName)
                        .font(.headline)
                    HStack {
                        Text("Amount: $\(source.amount, specifier: "%.2f")")
                        Spacer()
                        Text("Frequency: \(source.frequency)")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                .padding(.horizontal)
                .padding(.vertical, 4)
            }

            Spacer()
        }
        .padding(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    SourceOfFundingInfoView()
}
