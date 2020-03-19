//
//  AuthService.swift
//  Knock Knock
//
//  Created by milind shelat on 19/03/20.
//  Copyright © 2020 milind shelat. All rights reserved.
//

import Firebase

struct RegistrationCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
}

struct AuthService {
    
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        
    }
    
    func createUser(credentials: RegistrationCredentials, completion:((Error?) -> Void)?){
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { (meta, error) in
            if let error = error {
                completion!(error)
                return
            }
            
            ref.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                    if let error = error {
                        completion!(error)
                        return
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    
                    let data = ["email" : credentials.email,
                                "fullname" : credentials.fullName,
                                "profileimage" : profileImageUrl,
                                "uid" : uid,
                                "username" : credentials.userName] as [String : Any]
                    
                    Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
                    
                }
            }
        }
        
    }
}


