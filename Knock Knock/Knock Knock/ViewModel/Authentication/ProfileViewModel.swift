//
//  ProfileViewModel.swift
//  Knock Knock
//
//  Created by milind shelat on 23/03/20.
//  Copyright © 2020 milind shelat. All rights reserved.
//

import Foundation

enum ProfileViewModel: Int, CaseIterable {
    case accountInfo
    case settings
    
    var description: String {
        switch self {
        case .accountInfo : return "Account Info"
        case .settings : return "Settings"
        }
    }
    
    var iconImageName: String {
        switch self {
        case .accountInfo: return "person.circle"
        case .settings: return "gear"
        }
    }
}
