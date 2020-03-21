//
//  Service.swift
//  Knock Knock
//
//  Created by milind shelat on 20/03/20.
//  Copyright © 2020 milind shelat. All rights reserved.
//

import Firebase

struct Service {
    static func fetchUsers(completion :@escaping([User]) -> Void) {
        var users = [User]()
        
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ (document) in
               
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                print("DEBUG: \(user.fullname)")
                print("DEBUG: \(user.profileImageUrl)")
                users.append(user)
                completion(users)
            })
        }
        
    }
}
