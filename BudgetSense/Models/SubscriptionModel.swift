//
//  SubscriptionModel.swift
//  BudgetSense
//
//  Created by english on 2025-03-11.
//

import Foundation

struct SubscriptionModel {
    var subscriptionId: String
    var subscriptionName: String
    var amount: Double
    var renewalDate: String // Timestamp
    var status: String // Active, Expired, Canceled
}
