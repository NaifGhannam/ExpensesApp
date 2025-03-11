//
//  Expense.swift
//  ExpensesApp
//
//  Created by Mac on 11/09/1446 AH.
//

import Foundation

struct Expense: Identifiable, Codable {
    let id: UUID
    var title: String
    var amount: Double
    var category: String
    var date: Date
}
