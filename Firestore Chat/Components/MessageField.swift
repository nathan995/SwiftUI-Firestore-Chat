//
//  MessageField.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/2/23.
//

import SwiftUI

struct MessageField: View {
    @State private var message = ""
    @EnvironmentObject var messagesVM : MessagesViewModel
    var body: some View {
        HStack {
            CustomTextField(placeholderText: "Start typing...", text: $message, onEditingChanged: {_ in}, onCommit: onSend)
            
            Button {
               onSend()
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Purple"))
                    .cornerRadius(50)
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color("Gray"))
        .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
        .padding()
    }
    
    private func onSend(){
        print("Message sent")
        messagesVM.sendMessage(text: message)
        message = ""
    }
}

struct MessageField_Previews: PreviewProvider {

    static var previews: some View {
        MessageField()
            .environmentObject(MessagesViewModel())
    }
}

struct CustomTextField : View {
    
    var placeholderText : String
    @Binding var text: String
    var onEditingChanged: (Bool)-> Void = {_ in}
    var onCommit: ()-> Void = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholderText)
                    .foregroundColor(.gray)
            }
            TextField("Start Typing..",text: $text,onEditingChanged: onEditingChanged,onCommit: onCommit)
            
        }
    }
}
