//
//  TitleRow.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/1/23.
//

import SwiftUI

struct ChatHeader: View {
    var body: some View {
        HStack(spacing: 16){
            AsyncImage(url: URL(string:"https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60")!){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text("Emma Watson")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("Online")
                    .font(.caption)
//                    .foregroundColor(.gray)
                    .foregroundColor(.white.opacity(0.8))
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
