//
//  BudgetSenseApp.swift
//  BudgetSense
//
//  Created by english on 2025-03-11.
//

import SwiftUI

@main
struct BudgetSenseApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false  // Persist dark mode setting

    var body: some Scene {
        WindowGroup {
            LogIn(path: .constant(NavigationPath())) // Set LogIn as the first screen
                .preferredColorScheme(isDarkMode ? .dark : .light)  // Apply dark mode globally
        }
    }
}
