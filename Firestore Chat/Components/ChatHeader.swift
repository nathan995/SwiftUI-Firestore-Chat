//
//  TitleRow.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/1/23.
//

import SwiftUI

struct ChatHeader: View {
    var body: some View {
        HStack(spacing: 20){
            AsyncImage(url: URL(string:"https://images.unsplash.com/photo-1604072366595-e75dc92d6bdc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&w=1000&q=80")!){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text("Sarah Smith")
                    .font(.title)
                    .bold()
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .padding()
    }
}

struct ChatHeader_Previews: PreviewProvider {
    static var previews: some View {
        ChatHeader()
    }
}
