//
//  UserModel.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var email: String
    var fullName: String
    var monthlyBudget: Double
    var createdAt: Date
}
