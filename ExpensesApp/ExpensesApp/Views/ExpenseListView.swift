//
//  ExpenseListView.swift
//  ExpensesApp
//
//  Created by Mac on 11/09/1446 AH.
//

import SwiftUI

struct ExpenseListView: View {
    let expenses: [Expense]
    let removeAction: (IndexSet) -> Void

    var body: some View {
        List {
            ForEach(expenses) { expense in
                HStack {
                    Text(expense.title).bold()
                    Spacer()
                    Text("$\(expense.amount, specifier: "%.2f")")
                        .foregroundColor(.blue)
                }
            }
            .onDelete(perform: removeAction)
        }
    }
}
