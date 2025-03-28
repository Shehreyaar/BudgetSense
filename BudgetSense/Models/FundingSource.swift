//
//  FundingSource.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import Foundation

// Funding Source Model
struct FundingSource {
    var sourceName: String
    var amount: Double
    var frequency: String // Monthly, Yearly, etc.
}

// Sample Funding Sources
let sampleFundingSources: [FundingSource] = [
    FundingSource(sourceName: "Salary", amount: 5000.00, frequency: "Monthly"),
    FundingSource(sourceName: "Investments", amount: 200.00, frequency: "Monthly"),
    FundingSource(sourceName: "Side Business", amount: 700.00, frequency: "Quarterly")
]
