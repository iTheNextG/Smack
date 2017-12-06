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
    // this function is used to change the background color for the picture from the createAccount page to the channelVC page
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else {return defaultColor}
        guard let gUnwrapped = g else {return defaultColor}
        guard let bUnwrapped = b else {return defaultColor}
        guard let aUnwrapped = a else {return defaultColor}
        
        
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColro = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return newUIColro
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


































