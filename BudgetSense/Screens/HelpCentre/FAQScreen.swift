//
//  FAQScreen.swift
//  BudgetSense
//
//  Created by Shehreyaar Fawad on 2025-04-01.
//

import SwiftUI

struct FAQScreen: View {
    @State private var expandedIndex: Int? = nil
    
    let faqs = [
        ("What is BudgetSense?", "BudgetSense is an intuitive budgeting app designed to help you manage your finances, track your expenses, and set saving goals with ease."),
        ("How do I add an expense?", "To add an expense, go to the 'Expenses' section, tap the '+' button, enter the amount, select the category, and save it."),
        ("How can I set a savings goal?", "You can set a savings goal by navigating to the 'Goals' section, tapping 'Create New Goal,' and entering your target amount and deadline."),
        ("Can I sync my data across multiple devices?", "Yes, your data can be synced across all devices as long as you are logged into the same account."),
        ("What do I do if I forget my password?", "Simply go to the 'Login' screen, tap 'Forgot Password,' and follow the instructions to reset your password via email."),
        ("How do I categorize my expenses?", "When adding an expense, you’ll be prompted to select a category (e.g., Groceries, Transportation, Entertainment). You can also create custom categories in the settings."),
        ("Can I track my subscriptions?", "Yes, BudgetSense allows you to track subscriptions by adding them to your monthly expenses. You’ll receive reminders when they are due for renewal.")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Frequently Asked Questions")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                ForEach(faqs.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        Button(action: {
                            withAnimation {
                                expandedIndex = (expandedIndex == index) ? nil : index
                            }
                        }) {
                            HStack {
                                Text(faqs[index].0)
                                    .font(.headline)
                                    .foregroundColor(.green)
                                
                                Spacer()
                                
                                Image(systemName: expandedIndex == index ? "chevron.down" : "chevron.right")
                                    .foregroundColor(.green)
                            }
                        }
                        
                        if expandedIndex == index {
                            Text(faqs[index].1)
                                .font(.body)
                                .foregroundColor(.primary)
                                .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .navigationTitle("FAQ")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FAQScreen()
}


