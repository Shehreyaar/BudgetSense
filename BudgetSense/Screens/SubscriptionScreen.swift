//
//  SubscriptionScreen.swift
//  BudgetSense
//
//  Created by Shehreyaar Fawad on 2025-03-11.
//

import SwiftUI


// subs screen
struct SubscriptionScreen: View {
    var subscriptions: [Subscription]

    var body: some View {
        //        ScrollView {
        //            VStack {
        //                HStack {
        //                    Button(action: {
        //                        // Action for going back to the previous page
        //                    }) {
        //                        Image(systemName: "chevron.left")
        //                            .foregroundColor(.green)
        //                    }
        //
        //                    Spacer()
        //
        //                    Text("Subscriptions")
        //                        .font(.title)
        //                        .fontWeight(.bold)
        //                        .frame(maxWidth: .infinity)
        //                        .foregroundColor(.green)
        //                        .padding()
        //                }
        //                .padding(.horizontal)
        //
        //                Text("Active Subscriptions")
        //                    .font(.headline)
        //                    .foregroundColor(.green)
        //                    .padding(.top)
        //
        //                ForEach(subscriptions.filter { $0.isActive == true }, id: \.id) { subscription in
        //                    HStack {
        //                        VStack(alignment: .leading, spacing: 5) {
        //                            Text(subscription.name)
        //                                .font(.subheadline)
        //                                .fontWeight(.bold)
        //
        //                            Text("$\(subscription.amount, specifier: "%.2f")")
        //                                .font(.body)
        //                                .foregroundColor(.black)
        //
        //                            Text("Renewal Date: \(subscription.renewalDate)")
        //                                .font(.caption)
        //                                .foregroundColor(.gray)
        //                        }
        //                        Spacer()
        //                    }
        //                    .padding()
        //                }
        //                .background(
        //                    RoundedRectangle(cornerRadius: 15)
        //                        .fill(Color.white)
        //                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
        //                )
        //                .padding(.top)
        //                .padding(.horizontal)
        //
        //                Divider()
        //
        //                Text("Expired Subscriptions")
        //                    .font(.headline)
        //                    .foregroundColor(.green)
        //                    .padding(.top)
        //
        //                ForEach(subscriptions.filter { $0.isActive == false }, id: \.id) { subscription in
        //                    HStack {
        //                        VStack(alignment: .leading, spacing: 5) {
        //                            Text(subscription.name)
        //                                .font(.subheadline)
        //                                .fontWeight(.bold)
        //
        //                            Text("$\(subscription.amount, specifier: "%.2f")")
        //                                .font(.body)
        //                                .foregroundColor(.black)
        //
        //                            Text("Renewal Date: \(subscription.renewalDate)")
        //                                .font(.caption)
        //                                .foregroundColor(.gray)
        //                        }
        //                        Spacer()
        //                    }
        //                    .padding()
        //                }
        //                .background(
        //                    RoundedRectangle(cornerRadius: 15)
        //                        .fill(Color.white)
        //                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
        //                )
        //                .padding(.top)
        //                .padding(.horizontal)
        //
        //                Divider()
        //
        //                Text("Canceled Subscriptions")
        //                    .font(.headline)
        //                    .foregroundColor(.green)
        //                    .padding(.top)
        //
        //                ForEach(subscriptions.filter { $0.status == "Canceled" }, id: \.subscriptionId) { subscription in
        //                    HStack {
        //                        VStack(alignment: .leading, spacing: 5) {
        //                            Text(subscription.subscriptionName)
        //                                .font(.subheadline)
        //                                .fontWeight(.bold)
        //
        //                            Text("$\(subscription.amount, specifier: "%.2f")")
        //                                .font(.body)
        //                                .foregroundColor(.black)
        //
        //                            Text("Renewal Date: \(subscription.renewalDate)")
        //                                .font(.caption)
        //                                .foregroundColor(.gray)
        //                        }
        //                        Spacer()
        //                    }
        //                    .padding()
        //                }
        //                .background(
        //                    RoundedRectangle(cornerRadius: 15)
        //                        .fill(Color.white)
        //                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
        //                )
        //                .padding(.top)
        //                .padding(.horizontal)
        //
        //                Spacer()
        //            }
        //        }
        Text("Harro")
    }
}

#Preview {
//    SubscriptionScreen(subscriptions: [
//        Subscription(id: "A1B2C3D4-E5F6-7890-1234-56789ABCDEF0", name: "Netflix", amount: 15.99, renewalDate: Date(), frequency: "Monthly", isActive: true),
//            Subscription(id: "12345678-90AB-CDEF-1234-567890ABCDEF", name: "Spotify", amount: 9.99, renewalDate: Date(), frequency: "Monthly", isActive: true),
//            Subscription(id: "FEDCBA98-7654-3210-FEED-C0FFEE123456", name: "Adobe Creative Cloud", amount: 52.99, renewalDate: Date(), frequency: "Monthly", isActive: false),
//            Subscription(id: "C0FFEE12-3456-7890-ABCD-1234567890AB", name: "Amazon Prime", amount: 139.00, renewalDate: Date(), frequency: "Yearly", isActive: true),
//            Subscription(id: "DEADBEEF-0000-1111-2222-333344445555", name: "Notion", amount: 4.00, renewalDate: Date(), frequency: "Monthly", isActive: true),
//            Subscription(id: "BADF00D1-2345-6789-ABCD-9876543210FF", name: "YouTube Premium", amount: 11.99, renewalDate: Date(), frequency: "Monthly", isActive: false)
//    ])
}
