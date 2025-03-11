//
//  ExpensesApp.swift
//  ExpensesApp
//
//  Created by Mac on 11/09/1446 AH.
//

import SwiftUI

@main
struct ExpensesApp: App {
    @StateObject private var expenseViewModel = ExpenseViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(expenseViewModel)
                .preferredColorScheme(expenseViewModel.isDarkMode ? .dark : .light)
        }
    }
}
