//
//  SettingsModel.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import Foundation

struct Settings: Codable {
    var notificationsEnabled: Bool
    var darkModeEnabled: Bool
    var autoSync: Bool
    var defaultCurrency: String
    var monthlyReportDay: Int
}
