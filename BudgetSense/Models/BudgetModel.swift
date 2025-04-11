//
//  BudgetModel.swift
//  BudgetSense
//
//  Created by english on 2025-04-11.
//

import Foundation

struct Budget: Identifiable, Codable {
    var id: String
    var category: String
    var limit: Double
    var period: String
    var createdAt: Date
}
