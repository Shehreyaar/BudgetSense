//
//  ExpenseTrackerView.swift
//  BudgetSense
//
//  Created by english on 2025-04-01.
//

import SwiftUI

struct ExpenseTrackerView: View {
    @State private var expenses: [Expense] = [
        Expense(id: "A1B2C3D4-E5F6-7890-1234-56789ABCDEF0", name: "Grocery Shopping", category: "Food", amount: 85.50, date: Date()),
        Expense(id: "12345678-90AB-CDEF-1234-567890ABCDEF",  name: "Uber Ride",  category: "Transport", amount: 18.75, date: Date()),
        Expense(id: "FEDCBA98-7654-3210-FEED-C0FFEE123456", name: "Netflix Subscription", category: "Entertainment", amount: 15.99, date: Date())
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
                            let newExpense = Expense(id: "FEDCBA98-7654-3210-FEED-C0FFEE123456", name: name, category: category, amount: amountVal, date: Date())
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
