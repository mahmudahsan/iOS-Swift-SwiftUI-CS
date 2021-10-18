//
//  EnvironmentObjectApp.swift
//  EnvironmentObject
//
//  Created by Mahmud Ahsan on 18/10/21.
//

import SwiftUI

@main
struct EnvironmentObjectApp: App {
    let appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
