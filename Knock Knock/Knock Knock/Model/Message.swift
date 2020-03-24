//
//  Message.swift
//  Knock Knock
//
//  Created by milind shelat on 21/03/20.
//  Copyright © 2020 milind shelat. All rights reserved.
//

import Firebase

struct Message {
    
    let text: String
    let toId: String
    let fromId: String
    var timestamp: Timestamp!
    var user: User?
    
    let isFromCurrentUSer: Bool
    
    var chatPartnerId: String {
        return isFromCurrentUSer ? toId : fromId
    }
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
        self.isFromCurrentUSer = fromId == Auth.auth().currentUser?.uid
    }
    
}

struct Conversation {
    let user: User
    let message: Message
}
