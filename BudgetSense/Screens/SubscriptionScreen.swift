//
//  SubscriptionScreen.swift
//  BudgetSense
//
//  Created by Fawad on 2025-03-11.
//

import SwiftUI


// subs screen
struct SubscriptionScreen: View {
    var subscriptions: [SubscriptionModel]

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        // Action for going back to the previous page
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                    
                    Text("Subscriptions")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.green)
                        .padding()
                }
                .padding(.horizontal)
                
                Text("Active Subscriptions")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.top)
                
                ForEach(subscriptions.filter { $0.status == "Active" }, id: \.subscriptionId) { subscription in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(subscription.subscriptionName)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text("$\(subscription.amount, specifier: "%.2f")")
                                .font(.body)
                                .foregroundColor(.black)
                            
                            Text("Renewal Date: \(subscription.renewalDate)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
                )
                .padding(.top)
                .padding(.horizontal)
                
                Divider()
                
                Text("Expired Subscriptions")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.top)
                
                ForEach(subscriptions.filter { $0.status == "Expired" }, id: \.subscriptionId) { subscription in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(subscription.subscriptionName)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text("$\(subscription.amount, specifier: "%.2f")")
                                .font(.body)
                                .foregroundColor(.black)
                            
                            Text("Renewal Date: \(subscription.renewalDate)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
                )
                .padding(.top)
                .padding(.horizontal)
                
                Divider()
                
                Text("Canceled Subscriptions")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.top)
                
                ForEach(subscriptions.filter { $0.status == "Canceled" }, id: \.subscriptionId) { subscription in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(subscription.subscriptionName)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text("$\(subscription.amount, specifier: "%.2f")")
                                .font(.body)
                                .foregroundColor(.black)
                            
                            Text("Renewal Date: \(subscription.renewalDate)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
                )
                .padding(.top)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    SubscriptionScreen(subscriptions: [
        // Active Subscriptions
        SubscriptionModel(subscriptionId: "1", subscriptionName: "Netflix", amount: 12.99, renewalDate: "03/12/2025", status: "Active"),
        SubscriptionModel(subscriptionId: "2", subscriptionName: "Amazon Prime", amount: 15.99, renewalDate: "04/10/2025", status: "Active"),
        SubscriptionModel(subscriptionId: "3", subscriptionName: "Disney+", amount: 8.99, renewalDate: "05/01/2025", status: "Active"),
        
        // Expired Subscriptions
        SubscriptionModel(subscriptionId: "4", subscriptionName: "Spotify", amount: 9.99, renewalDate: "03/01/2025", status: "Expired"),
        SubscriptionModel(subscriptionId: "5", subscriptionName: "Hulu", amount: 11.99, renewalDate: "02/15/2025", status: "Expired"),
        SubscriptionModel(subscriptionId: "6", subscriptionName: "Apple TV+", amount: 4.99, renewalDate: "02/01/2025", status: "Expired"),
        
        // Canceled Subscriptions
        SubscriptionModel(subscriptionId: "7", subscriptionName: "YouTube Premium", amount: 11.99, renewalDate: "Canceled - No renewal", status: "Canceled"),
        SubscriptionModel(subscriptionId: "8", subscriptionName: "HBO Max", amount: 14.99, renewalDate: "Canceled - No renewal", status: "Canceled"),
        SubscriptionModel(subscriptionId: "9", subscriptionName: "Peacock", amount: 9.99, renewalDate: "Canceled - No renewal", status: "Canceled")
    ])
}
