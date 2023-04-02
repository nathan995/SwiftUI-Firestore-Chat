//
//  MessagesViewModel.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/2/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesViewModel : ObservableObject {
    @Published private(set) var messages : [Message] = []
    @Published private(set) var lastMessageId = ""
    private let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages() -> () {
        db.collection("Messages").addSnapshotListener{ querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching Messages \(error as Any)")
                return
            }
            
            self.messages =  documents.compactMap{  document -> Message? in
                do{
                    return try document.data(as:Message.self)
                } catch let error {
                    print("Error decoding message \(error )")
                    return nil
                }
            }
            self.messages.sort{$0.timestamp < $1.timestamp}
            self.lastMessageId = self.messages.last?.id ?? ""
            
        }
    }
    
    func sendMessage(text:String) -> () {
        do {
            let message = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            _ = try db.collection("Messages").addDocument(from: message)

        } catch let error  {
            print("Error sending Message to firestore \(error as Any)")
        }
    }
    
}
