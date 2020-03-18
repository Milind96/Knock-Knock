//
//  RegistrationViewModel.swift
//  Knock Knock
//
//  Created by milind shelat on 18/03/20.
//  Copyright © 2020 milind shelat. All rights reserved.
//

import Foundation

struct RegistrationViewModel: AuthenticationProtocol {
    
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    
    var formIsValid: Bool{
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && userName?.isEmpty == false
    }
    
}
