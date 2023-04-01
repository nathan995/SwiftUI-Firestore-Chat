//
//  Models.swift
//  Firestore Chat
//
//  Created by Nathan Getachew on 4/1/23.
//

import Foundation

struct Message : Identifiable, Codable {
    var id : String
    var text : String
    var received : Bool
    var timestamp : Date
}
