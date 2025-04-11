//
//  LiveChatModel.swift
//  BudgetSense
//
//  Created by english on 2025-04-11.
//

import Foundation

struct Message: Identifiable {
    var id: UUID
    var sender: Sender
    var content: String
}

enum Sender {
    case user
    case system
}
