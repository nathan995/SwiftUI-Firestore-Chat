//
//  ContentView.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ChatView()
                .preferredColorScheme(.dark)
                .background(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
