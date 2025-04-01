//
//  ReportsInsightsView.swift
//  BudgetSense
//
//  Created by english on 2025-04-01.
//

import SwiftUI
import Charts

struct ReportsInsightsView: View {
    let expensesByCategory: [CategoryExpense] = [
        CategoryExpense(category: "Food", amount: 320),
        CategoryExpense(category: "Subscriptions", amount: 80),
        CategoryExpense(category: "Transport", amount: 120),
        CategoryExpense(category: "Entertainment", amount: 150)
    ]

    var totalSpent: Double {
        expensesByCategory.reduce(0) { $0 + $1.amount }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Spending Overview")
                        .font(.title2.bold())

                    Chart {
                        ForEach(expensesByCategory) { data in
                            BarMark(
                                x: .value("Category", data.category),
                                y: .value("Amount", data.amount)
                            )
                            .foregroundStyle(by: .value("Category", data.category))
                        }
                    }
                    .frame(height: 200)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Total Spent: $\(String(format: "%.2f", totalSpent))")
                            .font(.headline)

                        ForEach(expensesByCategory) { data in
                            HStack {
                                Text(data.category)
                                Spacer()
                                Text("$\(String(format: "%.2f", data.amount))")
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Reports & Insights")
        }
    }
}

struct CategoryExpense: Identifiable {
    var id = UUID()
    var category: String
    var amount: Double
}

#Preview {
    ReportsInsightsView()
}
