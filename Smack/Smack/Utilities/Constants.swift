//
//  Constants.swift
//  Smack
//
//  Created by TheNextG on 11/21/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import Foundation
typealias CompletionHandler = (_ Success: Bool) -> ()


//URL Constant

let BASE_URL = "https://chattychatchatc.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL =  "\(BASE_URL)user/byEmail/"

//colors
let smackPurplePlaceholder = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

// Notification constants
 let NOTE_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")


//segue
let TO_LOGIN = "toLogin"
let TO_CREATEACCOUNT = "toCreatAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"


// user defaults
let TOKEN_KEY = "token"
let LOGGEDIN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
    
]
    //this header is to get the authorization header (you can see postman to get more detail)
let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
    
]

