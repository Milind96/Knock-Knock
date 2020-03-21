//
//  MessageViewModel.swift
//  Knock Knock
//
//  Created by milind shelat on 21/03/20.
//  Copyright © 2020 milind shelat. All rights reserved.
//

import UIKit

struct MesssageViewModel {
    
    private let message: Message
    
    var messageBackgroundColor : UIColor {
        return message.isFromCurrentUSer ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : .systemPurple
    }
    
    var messageTextColor: UIColor {
        return message.isFromCurrentUSer ? .black : .white
    }
    
    var rightAnchor : Bool {
        return message.isFromCurrentUSer
    }
    
    var leftAnchor : Bool {
        return !message.isFromCurrentUSer
    }
    
    var shouldHideProfileImage : Bool {
        return message.isFromCurrentUSer
    }
    
//    var profileImageUrl: URL? {
//       return()
//    }
    
    init(message: Message) {
        self.message = message
    }
}
