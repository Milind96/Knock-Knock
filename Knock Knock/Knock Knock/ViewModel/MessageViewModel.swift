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
        return message.isFromCurrentUSer ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : .systemPurple
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
    
    var profileImageUrl: URL? {
        guard let user = message.user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    
    init(message: Message) {
        self.message = message
    }
}
