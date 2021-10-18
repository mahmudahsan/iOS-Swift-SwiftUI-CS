//
//  ContentView.swift
//  EnvironmentObject
//
//  Created by Mahmud Ahsan on 18/10/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Text("\(appState.name)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppState())
    }
}
