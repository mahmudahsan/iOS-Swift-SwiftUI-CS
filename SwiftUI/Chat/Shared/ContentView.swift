//
//  ContentView.swift
//  Shared
//
//  Created by Mahmud Ahsan on 6/3/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var messageList = [MessageModel]()
    @State var authorMessage: String = ""
    @Namespace var bottomID
    
    var header: some View {
        HStack {
            Text("Chatting")
                .font(.headline)
                .padding()
            Spacer()
        }
    }
    
    var chatView: some View {
        ScrollViewReader { scrollView in
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(messageList) { message in
                        MessageCardView(message: message)
                            .id(message.id)
                    }
                    Text("").id(bottomID)
                }
            }
            .onReceive(Just(messageList), perform: { _ in
                if messageList.count > 0 {
                    scrollView.scrollTo(bottomID)
                }
            })
            .padding()
            .background(Color.gray.opacity(0.2))
        }
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
