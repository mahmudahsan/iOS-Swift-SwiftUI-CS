//
//  ContentView.swift
//  Pop-To-Root-View-Navigation
//
//  Created by mahmud on 11/4/20.
//  Copyright © 2020 iThinkdiff. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State var isView1Active: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Content View")
                    .font(.headline)
                
                NavigationLink(destination: View1(), isActive: $isView1Active) {
                    Text("View 1")
                        .font(.headline)
                }
                .isDetailLink(false)
            }
            .onReceive(self.appState.$moveToDashboard) { moveToDashboard in
                if moveToDashboard {
                    print("Move to dashboard: \(moveToDashboard)")
                    self.isView1Active = false
                    self.appState.moveToDashboard = false
                }
            }
        }
    }
}

// MARK:- View 1
struct View1: View {
    
    var body: some View {
        VStack {
            Text("View 1")
                .font(.headline)
            NavigationLink(destination: View2()) {
                Text("View 2")
                    .font(.headline)
            }
        }
    }
}

// MARK:- View 2
struct View2: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Text("View 2")
                .font(.headline)
            Button(action: {
                self.appState.moveToDashboard = true
            }) {
                Text("Move to Dashboard")
                .font(.headline)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
