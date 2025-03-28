//
//  BankAccount.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import Foundation

// Bank Account Model
struct BankAccount {
    var bankName: String
    var accountType: String // Checking, Savings, etc.
    var accountNumber: String
    var balance: Double
}

// Sample Bank Accounts
let sampleBankAccounts: [BankAccount] = [
    BankAccount(bankName: "TD Canada Trust", accountType: "Checking", accountNumber: "1234567890", balance: 1500.75),
    BankAccount(bankName: "RBC Royal Bank", accountType: "Savings", accountNumber: "9876543210", balance: 8200.00)
]
