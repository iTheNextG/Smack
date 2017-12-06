//
//  ProfileVC.swift
//  Smack
//
//  Created by TheNextG on 12/6/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    // outlets
    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var userNmae: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func closedModelPressed(_ sender: Any) {
        // this dissmiss function is happining when you press the close button so that the view is being dismissed
        self.dismiss(animated: true, completion: nil)

    }
    @IBAction func LogoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        // notification center to notify all other classes about the logout
        NotificationCenter.default.post(name: NOTE_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
            }
    func setUpView() {
        userNmae.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        ProfileImg.image = UIImage(named: UserDataService.instance.avatarNAme)
        ProfileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        // the next steps is to close the view when the user tap on outside the view
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        
    }
    // he usualy create this function to use it in the selector (search why in this case he used it )
    @objc func closeTap (_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}





















