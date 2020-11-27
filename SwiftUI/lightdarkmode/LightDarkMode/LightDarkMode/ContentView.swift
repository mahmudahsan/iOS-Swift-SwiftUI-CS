//
//  ContentView.swift
//  LightDarkMode
//
//  Created by Mahmud Ahsan on 27/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView(title: "Mark", colorForeground: Color.CardForeground(), colorBackground: Color.CardBackground())
            CardView(title: "Bill", colorForeground: Color.CardForeground(), colorBackground: Color.CardBackground())
            Spacer()
        }
    }
}

struct CardView: View {
    let title: String
    let colorForeground: Color
    let colorBackground: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(40)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(colorForeground)
        .background(colorBackground)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .colorScheme(.light)
        }
        
        Group {
            ContentView()
                .colorScheme(.dark)
        }
    }
}
