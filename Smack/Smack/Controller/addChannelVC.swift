//
//  addChannelVC.swift
//  Smack
//
//  Created by TheNextG on 12/8/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit

class addChannelVC: UIViewController {

    // outlets
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var ChanDesc: UITextField!
    @IBOutlet weak var BGView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }

    @IBAction func CreateChannelPressed(_ sender: Any) {
    }
    @IBAction func closedModelPresse(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setUpView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(addChannelVC.closeTap(_:)))
        BGView.addGestureRecognizer(closeTouch)
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        ChanDesc.attributedPlaceholder = NSAttributedString(string: "Discription", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

}
























