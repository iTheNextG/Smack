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

let TO_LOGIN = "toLogin"
let TO_CREATEACCOUNT = "toCreatAccount"
let UNWIND = "unwindToChannel"


// user defaults
let TOKEN_KEY = "token"
let LOGGEDIN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

