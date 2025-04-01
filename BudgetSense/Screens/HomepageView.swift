//
//  HomepageView.swift
//  BudgetSense
//
//  Created by english on 2025-04-01.
//

import SwiftUI

struct HomepageView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Budget Summary
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Budget Summary")
                            .font(.title2.bold())
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Income")
                                    .font(.caption)
                                    .foregroundColor(.green)
                                Text("$3,200")
                                    .font(.title3)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Expenses")
                                    .font(.caption)
                                    .foregroundColor(.red)
                                Text("$1,850")
                                    .font(.title3)
                            }
                        }
                        ProgressView(value: 1850, total: 3200)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                    // Recent Transactions
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Recent Transactions")
                            .font(.title2.bold())
                        ForEach(0..<3) { _ in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Uber Eats")
                                        .font(.headline)
                                    Text("Food & Drinks")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text("- $32.45")
                                    .foregroundColor(.red)
                            }
                            Divider()
                        }
                        NavigationLink(destination: ExpenseTrackerView()) {
                            Text("See All Transactions")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                    }

                    // Subscription Alert
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Upcoming Subscriptions")
                            .font(.title2.bold())
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Netflix")
                                    .font(.headline)
                                Text("Renews in 3 days")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("$15.99")
                                .foregroundColor(.blue)
                        }
                        Divider()
                        NavigationLink(destination: SubscriptionScreen(subscriptions: [
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
                        ])) {
                            Text("Manage Subscriptions")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}

#Preview {
    HomepageView()
}
