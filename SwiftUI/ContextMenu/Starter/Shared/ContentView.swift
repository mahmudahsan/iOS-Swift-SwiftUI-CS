//
//  ContentView.swift
//  Shared
//
//  Created by Mahmud Ahsan on 7/6/21.
//

import SwiftUI

enum CardType {
    case Text
    case Image
}

struct Card: View {
    let type: CardType
    let text: String?
    let imageName: String?
    
    init(
        _ type: CardType,
        text: String? = nil,
        imageName: String? = nil
    ) {
        self.type = type
        self.text = text
        self.imageName = imageName
    }
    
    var body: some View {
        Group {
            if let _ = text {
                cardText
            }
            else if let _ = imageName {
                cardImage
            }
        }
        .background(Color.white)
        .cornerRadius(10.0)
    }
    
    var cardText: some View {
        VStack {
            HStack { Spacer() }
            
            Text(text ?? "")
                .foregroundColor(Color.black)
            
            HStack { Spacer() }
        }
        .padding()
    }
    
    var cardImage: some View {
        VStack {
            HStack { Spacer() }
            
            Image(imageName ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
            
            HStack { Spacer() }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            
            Card(.Text, text: "Life is Beautiful!")
            Card(.Image, imageName: "house")
            Card(.Text, text: "I am Happy!")
            
            Spacer()
        }
        .padding()
        .background(Color.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
