//
//  ReportModel.swift
//  BudgetSense
//
//  Created by english on 2025-04-11.
//

import Foundation

struct Report: Identifiable, Codable {
    var id: String
    var month: String // e.g., "April 2025"
    var totalIncome: Double
    var totalExpenses: Double
    var topCategories: [String: Double] // e.g., ["Food": 320.0, "Transport": 120.0]
    var generatedAt: Date
}
