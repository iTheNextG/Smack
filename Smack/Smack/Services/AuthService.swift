//
//  AuthService.swift
//  Smack
//
//  Created by TheNextG on 11/26/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGEDIN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGEDIN_KEY)
        }
    }
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in

            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
    }
    
    
    func loginUser(email: String, password: String,completion: @escaping CompletionHandler){
        let lowCaseEmail = email.lowercased()
    
        let body: [String: Any] = [
            "email": lowCaseEmail,
            "password": password
        ]
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                // the commented part is the same way to get the data from json
//                if let json = response.result.value as? Dictionary<String, Any> {
//                    if let email = json["user"] as? String{
//                        self.userEmail = email
//                    }
//                    if let token = json["token"] as? String {
//                        self.authToken = token
//                    }
//
//                }
                guard let Data = response.data else { return }
                do{
                    let json = try JSON(data: Data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue

                }catch {
                    debugPrint(error as Any)
                }
                self.isLoggedIn = true
                completion(true)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String , avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        
        let lowCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "name": name,
            "email": email,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUpUserData(data: data)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findUSerByEmail(completion: @escaping CompletionHandler){
        
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            // if response is not nil that the previous statment grab the data from the API in store it in the response variable
                if response.result.error == nil {
                    guard let data = response.data else { return }
                    self.setUpUserData(data: data)
                    completion(true)
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            
        }
    
    
    }
    // this method is created due to several useed for the user data
    func setUpUserData(data: Data) {
        do {
            let json = try JSON(data: data)
            let id = json["_id"].stringValue
            let color = json["avatarColor"].stringValue
            let avatarName = json["avatarName"].stringValue
            let email = json["email"].stringValue
            let name = json["name"].stringValue
            UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
        }catch {
            debugPrint(error as Any)
        }
        
        
        
    }
    
}

























