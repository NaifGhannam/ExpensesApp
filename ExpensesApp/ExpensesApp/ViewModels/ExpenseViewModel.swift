//
//  ExpenseViewModel.swift
//  ExpensesApp
//
//  Created by Mac on 11/09/1446 AH.
//

import Foundation
import SwiftUI

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = [] {
        didSet {
            saveExpenses()
        }
    }
    
    @Published var isDarkMode: Bool = UserDefaults.standard.bool(forKey: "DarkMode") {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "DarkMode")
        }
    }
    
    init() {
        loadExpenses()
    }
    
    func addExpense(_ expense: Expense) {
        expenses.append(expense)
    }
    
    func removeExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
    
    func sortExpenses(ascending: Bool) {
        expenses.sort { ascending ? $0.amount < $1.amount : $0.amount > $1.amount }
    }
    
    func filterExpenses(by category: String?) -> [Expense] {
        guard let category = category else { return expenses }
        return expenses.filter { $0.category == category }
    }
    
    private func saveExpenses() {
        if let encoded = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.set(encoded, forKey: "SavedExpenses")
        }
    }
    
    private func loadExpenses() {
        if let savedData = UserDefaults.standard.data(forKey: "SavedExpenses"),
           let decodedExpenses = try? JSONDecoder().decode([Expense].self, from: savedData) {
            expenses = decodedExpenses
        }
    }
}
