//
//  UserDataService.swift
//  Smack
//
//  Created by TheNextG on 12/4/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    public private(set) var  id = ""
    public private(set) var  avatarColor = ""
    public private(set) var  avatarNAme = ""
    public private(set) var  email = ""
    public private(set) var  name = ""
    
    func setUserData (id: String, color: String, avatarName: String, email: String , name: String) {
        self.id = id
        self.avatarNAme = avatarName
        self.avatarColor = color
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String ){
        self.avatarNAme = avatarName
    }
}


































