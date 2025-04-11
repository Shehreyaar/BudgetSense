//
//  ExpenseModel.swift
//  BudgetSense
//
//  Created by english on 2025-04-11.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id: String
    var name: String
    var category: String
    var amount: Double
    var date: Date
}
