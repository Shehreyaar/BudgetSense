//
//  BankAccount.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import Foundation

struct BankAccount: Identifiable, Codable {
    var id: String
    var bankName: String
    var accountType: String
    var balance: Double
    var lastUpdated: Date
}
