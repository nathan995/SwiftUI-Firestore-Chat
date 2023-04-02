//
//  Firestore_ChatApp.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/1/23.
//

import SwiftUI
import Firebase

@main
struct Firestore_ChatApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
