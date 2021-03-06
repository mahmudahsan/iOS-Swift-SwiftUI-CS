//
//  ContentView.swift
//  Shared
//
//  Created by Mahmud Ahsan on 6/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var messageList = [MessageModel]()
    @State var authorMessage: String = ""
    
    var header: some View {
        HStack {
            Text("Chatting")
                .font(.headline)
                .padding()
            Spacer()
        }
    }
    
    var chatView: some View {
        List(messageList.reversed()) { message in
            MessageCardView(message: message)
                .flip()
        }
        .listStyle(SidebarListStyle())
        .flip()
    }
    
    func addMessageToMessageList() {
        let cleanMessage = authorMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanMessage.count > 0 {
            messageList.append(
                MessageModel(
                    message: cleanMessage,
                    isAuthor: true
                )
            )
            authorMessage = ""
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                let serverResponse = MessageModel.getRandomAnswer()
                messageList.append(
                    MessageModel(
                        message: serverResponse,
                        isAuthor: false
                    )
                )
            }
        }
    }
    
    var footer: some View {
        HStack {
            TextField("Write...", text: $authorMessage)
                .lineLimit(4)
                .padding()
                .border(Color.black, width: 1)
            
            Button(action: {
                addMessageToMessageList()
            }, label: {
                Text("Send")
                    .bold()
            })
        }
        .padding()
    }
    
    var body: some View {
        VStack {
            header
            VStack {
                chatView
            }
            Spacer()
            footer
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            messageList: [MessageModel(message: "Hey There", isAuthor: true)]
        )
    }
}
