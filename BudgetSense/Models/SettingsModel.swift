//
//  SettingsModel.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import Foundation

// Settings Model
struct Settings {
    var notificationsEnabled: Bool
    var darkModeEnabled: Bool
    var autoSync: Bool
}

// Sample Settings
var userSettings = Settings(
    notificationsEnabled: true,
    darkModeEnabled: false,
    autoSync: true
)
