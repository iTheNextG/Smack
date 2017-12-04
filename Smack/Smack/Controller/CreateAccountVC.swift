//
//  CreateAccountVC.swift
//  Smack
//
//  Created by TheNextG on 11/21/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else {
            return
        }
        guard let pass = passTxt.text, passTxt.text != ""  else {
            return
        }
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("logged in user!",AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    

    @IBAction func PickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func PickBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func ClosePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
