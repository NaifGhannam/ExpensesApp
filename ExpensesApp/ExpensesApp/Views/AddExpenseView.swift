//
//  AddExpenseView.swift
//  ExpensesApp
//
//  Created by Mac on 11/09/1446 AH.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ExpenseViewModel
    @State private var title = ""
    @State private var amount = ""
    @State private var category = "Food"
    let categories = ["Food", "Travel", "Shopping", "Other"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Expense Details")) {
                    TextField("Title", text: $title)
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Button("Add Expense") {
                    if let expenseAmount = Double(amount) {
                        let newExpense = Expense(id: UUID(), title: title, amount: expenseAmount, category: category, date: Date())
                        viewModel.addExpense(newExpense)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .disabled(title.isEmpty || amount.isEmpty)
            }
            .navigationTitle("New Expense")
        }
    }
}
