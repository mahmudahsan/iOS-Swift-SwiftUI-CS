//
//  MessageCardView.swift
//  Chat
//
//  Created by Mahmud Ahsan on 6/3/21.
//

import SwiftUI

struct MessageCardView: View {
    let message: MessageModel
    
    var getBackgroundColor: Color {
        message.isAuthor ? Color.orange : Color.green
    }
    
    var getTextAlignment: HorizontalAlignment {
        message.isAuthor ? .leading : .trailing
    }
    
    var getCardWidth: CGFloat {
        UIScreen.main.bounds.size.width - 200
    }
    
    var contentView: some View {
        VStack (alignment: getTextAlignment, spacing: 10){
            Text(message.message)
                .font(.body)
                .multilineTextAlignment(.leading)
            Text("\(message.time)")
                .font(.system(size: 10.0))
        }
        .frame(width: getCardWidth)
        .padding()
        .background(getBackgroundColor)
        .foregroundColor(Color.white)
        .cornerRadius(15)
    }
    
    var body: some View {
        HStack {
            if !message.isAuthor {
                Spacer()
            }
            
            contentView
            
            if message.isAuthor {
                Spacer()
            }
        }
    }
}


struct MessageCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MessageCardView(
                message: MessageModel(message: "Hey there!", isAuthor: true)
            )
            .padding()
            
            MessageCardView(
                message: MessageModel(message: "What do you want?", isAuthor: false)
            )
            .padding()
        }
    }
}
