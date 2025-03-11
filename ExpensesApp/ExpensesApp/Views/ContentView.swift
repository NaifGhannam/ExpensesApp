//
//  ContentView.swift
//  ExpensesApp
//
//  Created by Mac on 11/09/1446 AH.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    @State private var showAddExpense = false
    @State private var sortAscending = true
    @State private var selectedCategory: String?

    var body: some View {
        NavigationView {
            ZStack {
                // الخلفية المتغيرة حسب الوضع الداكن
                Color(viewModel.isDarkMode ? .black : .white)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Toggle("Dark Mode", isOn: $viewModel.isDarkMode)
                        .padding()
                    
                    HStack {
                        Button("Sort") {
                            sortAscending.toggle()
                            withAnimation {
                                viewModel.sortExpenses(ascending: sortAscending)
                            }
                        }
                        .buttonStyle(.bordered)
                        
                        Menu("Filter") {
                            Button("All", action: { selectedCategory = nil })
                            ForEach(Array(Set(viewModel.expenses.map { $0.category })), id: \.self) { category in
                                Button(category, action: { selectedCategory = category })
                            }
                        }
                    }
                    .padding()
                    
                    ExpenseListView(expenses: viewModel.filterExpenses(by: selectedCategory), removeAction: viewModel.removeExpense)
                    
                    Button("Add Expense") {
                        showAddExpense = true
                    }
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showAddExpense) {
                        AddExpenseView(viewModel: viewModel)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(viewModel.isDarkMode ? Color.gray.opacity(0.5) : Color.white)
                    .shadow(radius: 5))
                .padding()
            }
            .animation(.easeInOut, value: viewModel.isDarkMode)
            .navigationTitle("Expenses")
        }
    }
}
