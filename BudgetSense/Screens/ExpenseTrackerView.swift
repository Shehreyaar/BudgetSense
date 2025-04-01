//
//  ExpenseTrackerView.swift
//  BudgetSense
//
//  Created by english on 2025-04-01.
//

import SwiftUI

struct ExpenseTrackerView: View {
    @State private var expenses: [Expense] = [
        Expense(name: "Coffee", category: "Food & Drinks", amount: 4.50, date: Date()),
        Expense(name: "Groceries", category: "Food", amount: 65.20, date: Date()),
        Expense(name: "Spotify", category: "Subscription", amount: 9.99, date: Date())
    ]
    @State private var showAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text(expense.category)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("$\(String(format: "%.2f", expense.amount))")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddExpense) {
                AddExpenseView(expenses: $expenses)
            }
        }
    }
}

struct Expense: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var amount: Double
    var date: Date
}

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var expenses: [Expense]
    
    @State private var name = ""
    @State private var category = ""
    @State private var amount = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Expense Details")) {
                    TextField("Name", text: $name)
                    TextField("Category", text: $category)
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let amountVal = Double(amount) {
                            let newExpense = Expense(name: name, category: category, amount: amountVal, date: Date())
                            expenses.append(newExpense)
                            dismiss()
                        }
                    }
                    .disabled(name.isEmpty || category.isEmpty || amount.isEmpty)
                }
            }
        }
    }
}

#Preview {
    ExpenseTrackerView()
}
