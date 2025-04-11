//
//  BudgetScreen.swift
//  BudgetSense
//
//  Created by Shehreyaar Fawad on 2025-03-27.
//

import SwiftUI

struct BudgetScreen: View {
    @State private var selectedBudgetType = "Monthly"
    @State private var budgetAmount: String = ""
    @State private var savedBudgets: [(type: String, amount: String)] = []
    
    let budgetTypes = ["Monthly", "Yearly", "Bi-Weekly", "Weekly"]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        // Action for going back to the previous page
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                    
                    Text("Set Your Budget")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.green)
                        .padding()
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Select Budget Type")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(.horizontal)
                    
                    Picker("Budget Type", selection: $selectedBudgetType) {
                        ForEach(budgetTypes, id: \.self) { budgetType in
                            Text(budgetType)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Text("Enter Budget Amount")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    TextField("$0.00", text: $budgetAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                        
                    Divider()
                        .padding(.top)
                        .padding(.bottom)
                    
                    Text("Budget Overview")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                    
                    VStack {
                        HStack {
                            Text("Budget Type: \(selectedBudgetType)")
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Set Budget Amount: $\(budgetAmount)")
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 260, height: 120)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
                    )
                    .padding(.top)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        savedBudgets.append((type: selectedBudgetType, amount: budgetAmount))
                    }) {
                        Text("Save Budget")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.top)
                    
                    VStack {
                        Text("Saved Budgets")
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding(.horizontal)
                            .padding(.top)
                            .frame(maxWidth: .infinity)
                        
                        ForEach(savedBudgets, id: \.type) { budget in
                            HStack {
                                Text("\(budget.type) Budget: $\(budget.amount)")
                                Spacer()
                            }
                            .frame(width: 260, height: 20)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
                            )
                            .padding(.top)
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    BudgetScreen()
}
