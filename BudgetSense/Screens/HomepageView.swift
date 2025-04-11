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
                            Subscription(id: "A1B2C3D4-E5F6-7890-1234-56789ABCDEF0", name: "Netflix", amount: 15.99, renewalDate: Date(), frequency: "Monthly", isActive: true),
                                Subscription(id: "12345678-90AB-CDEF-1234-567890ABCDEF", name: "Spotify", amount: 9.99, renewalDate: Date(), frequency: "Monthly", isActive: true),
                                Subscription(id: "FEDCBA98-7654-3210-FEED-C0FFEE123456", name: "Adobe Creative Cloud", amount: 52.99, renewalDate: Date(), frequency: "Monthly", isActive: false),
                                Subscription(id: "C0FFEE12-3456-7890-ABCD-1234567890AB", name: "Amazon Prime", amount: 139.00, renewalDate: Date(), frequency: "Yearly", isActive: true),
                                Subscription(id: "DEADBEEF-0000-1111-2222-333344445555", name: "Notion", amount: 4.00, renewalDate: Date(), frequency: "Monthly", isActive: true),
                                Subscription(id: "BADF00D1-2345-6789-ABCD-9876543210FF", name: "YouTube Premium", amount: 11.99, renewalDate: Date(), frequency: "Monthly", isActive: false)
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
