📌 ExpensesApp

📋 Description

ExpensesApp is a personal expense tracker built using SwiftUI. It allows users to add, view, sort, and filter expenses dynamically. The app also supports a Dark Mode Toggle and data persistence using UserDefaults, ensuring expenses remain saved even after the app restarts.

🚀 Features

✅ Add Expenses: Enter expense details including name, amount, and category.

✅ Expense List: Display expenses dynamically in a List.

✅ Sorting: Sort expenses by amount (ascending/descending) using higher-order functions.

✅ Filtering: Filter expenses by category using filter and map.

✅ Dark Mode: Toggle between light and dark themes.

✅ Data Persistence: Save expenses using UserDefaults to retain data after app restarts.

✅ Smooth Animations: Enhance user experience with transitions while adding or sorting expenses.

📂 Project Structure

ExpensesApp/
│── ExpensesAppApp.swift     # Entry point of the app
│── ContentView.swift        # Main view with expense list, sorting, filtering, and theme switcher
│── ExpenseViewModel.swift   # Manages state and logic for expenses
│── ExpenseModel.swift       # Defines the Expense data model
│── ExpenseListView.swift    # Displays the list of expenses
│── AddExpenseView.swift     # Handles expense input form
│── Assets.xcassets          # Contains app icons and theme colors
│── README.md                # Project documentation

📷 Screenshots
<img width="425" alt="Screenshot 1446-09-11 at 7 13 45 AM" src="https://github.com/user-attachments/assets/dd66fb5f-cf89-422a-adc4-6c42962ca22b" />





🛠 Technologies Used

Swift

SwiftUI

UserDefaults (for data persistence)

Higher-Order Functions (map, filter, sort)

Animations & UI Enhancements
