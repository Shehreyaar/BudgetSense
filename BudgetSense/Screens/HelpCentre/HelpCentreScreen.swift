//
//  HelpCentreScreen.swift
//  BudgetSense
//
//  Created by Shehreyaar Fawad on 2025-03-21.
//

import SwiftUI

struct HelpCentreScreen: View {
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            // Add back navigation logic if needed
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.green)
                        }

                        Spacer()

                        Text("Help Centre")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)

                    Text("How can we assist you today?")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, -10)

                    LazyVGrid(columns: columns, spacing: 20) {
                        NavigationLink(destination: FAQScreen()) {
                            HelpCentreTile(icon: "questionmark.circle.fill", label: "FAQ")
                        }

                        NavigationLink(destination: LiveChatScreen()) {
                            HelpCentreTile(icon: "message.fill", label: "Live Chat")
                        }

                        NavigationLink(destination: EmailUsScreen()) {
                            HelpCentreTile(icon: "envelope.fill", label: "Email Us")
                        }

                        NavigationLink(destination: VisitUsScreen()) {
                            HelpCentreTile(icon: "map.fill", label: "Visit Us")
                        }
                    }
                    .padding()
                    
                    Spacer(minLength: 30)
                }
                .padding(.top)
            }
            .navigationBarHidden(true)
        }
    }
}

struct HelpCentreTile: View {
    let icon: String
    let label: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .foregroundColor(.white)

            Text(label)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(Color.green)
        .cornerRadius(25)
        .shadow(radius: 4)
    }
}

#Preview {
    HelpCentreScreen()
}

