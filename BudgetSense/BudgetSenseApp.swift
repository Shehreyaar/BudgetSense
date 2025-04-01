//
//  BudgetSenseApp.swift
//  BudgetSense
//
//  Created by english on 2025-03-11.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct BudgetSenseApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false  // Persist dark mode setting
// register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LogIn(path: .constant(NavigationPath())) // Set LogIn as the first screen
                .preferredColorScheme(isDarkMode ? .dark : .light)  // Apply dark mode globally
        }
    }
}
