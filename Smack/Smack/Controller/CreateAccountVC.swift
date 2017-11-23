//
//  CreateAccountVC.swift
//  Smack
//
//  Created by TheNextG on 11/21/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func ClosePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
