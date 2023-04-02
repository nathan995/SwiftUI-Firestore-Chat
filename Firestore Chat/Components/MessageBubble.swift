//
//  MessageBubble.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/1/23.
//

import SwiftUI

struct MessageBubble: View {
    var message : Message
    
    @State private var showTime = false
    
    var body: some View {
        VStack( alignment: message.received ? .leading : .trailing) {
            HStack {
                Text (message.text)
                    .padding ()
                    .foregroundColor(message.received ? .black : .white)
                    .background (message.received ? Color ("Gray") : Color ("Purple"))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                withAnimation{
                    showTime.toggle()
                }
            }
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))" )
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading :
                            .trailing, 20)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1", text: "Hebhhiuhikuhgkuyhy", received: false, timestamp: Date()))
    }
}
