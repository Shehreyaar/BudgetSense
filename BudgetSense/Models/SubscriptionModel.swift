//
//  SubscriptionModel.swift
//  BudgetSense
//
//  Created by english on 2025-03-11.
//

import Foundation

struct Subscription: Identifiable, Codable {
    var id: String
    var name: String
    var amount: Double
    var renewalDate: Date
    var frequency: String
    var isActive: Bool
}
