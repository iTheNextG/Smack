//
//  LoginVC.swift
//  Smack
//
//  Created by TheNextG on 11/21/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    //outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var PassowrdTxt: UITextField!
    @IBOutlet weak var spener: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    @IBAction func LoginPressed(_ sender: Any) {
        spener.isHidden = false
        spener.startAnimating()
        
        guard let email = userNameTxt.text, userNameTxt.text != "" else {
            return
        }
        guard let pass = PassowrdTxt.text, PassowrdTxt.text != "" else {
            return
        }
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUSerByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTE_USER_DATA_DID_CHANGE, object: nil)
                        self.spener.isHidden = true
                        self.spener.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    
    

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func CreateAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATEACCOUNT, sender: nil)
    }
    // the next func is to load the view and obtain the information of the user if he entered login info
    func setUpView(){
        spener.isHidden = true
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        PassowrdTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        
    }
    
}
