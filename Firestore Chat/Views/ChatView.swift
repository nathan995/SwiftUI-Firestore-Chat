//
//  ChatView.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/1/23.
//

import SwiftUI

struct ChatView: View {
    @StateObject var messagesVM = MessagesViewModel()
    var body: some View {
        VStack {
            VStack {
                ChatHeader()
                    .background(Color("Purple"))
                ScrollViewReader{ proxy in
                    ScrollView{
                        ForEach(messagesVM.messages,id:\.id){ message in
                            MessageBubble(message: Message(id: message.id, text: message.text, received: message.received, timestamp: message.timestamp))
                        }
                    }
                    .padding(.top,10)
                    .background(.white)
                    .onChange(of: messagesVM.lastMessageId){newValue in
                        withAnimation{
                            proxy.scrollTo(newValue,anchor: .bottom)
                        }
                    }
                }
            }
            //            .background(Color("Purple"))
            MessageField()
                .environmentObject(messagesVM)
        }
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
