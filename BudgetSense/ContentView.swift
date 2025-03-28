//
//  ContentView.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            LogIn(path: $path) // Default to LogIn view
        }
    }
}

#Preview {
    ContentView()
}
