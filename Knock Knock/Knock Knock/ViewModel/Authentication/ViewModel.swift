//
//  ViewModel.swift
//  Knock Knock
//
//  Created by milind shelat on 18/03/20.
//  Copyright © 2020 milind shelat. All rights reserved.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationProtocol {
    
    var email: String?
    var password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
}
