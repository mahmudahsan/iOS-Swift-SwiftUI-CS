//
//  ContentView.swift
//  HelloWorld
//
//  Created by mahmud on 20/2/20.
//  Copyright © 2020 ithinkdiff.net. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World! My First SWiftUI Project")
                .bold()
                .font(.headline)
                .foregroundColor(.blue)
                .padding(.vertical)
            Button(action: {
                print("Hello World")
            }) {
                Text("Button")
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
