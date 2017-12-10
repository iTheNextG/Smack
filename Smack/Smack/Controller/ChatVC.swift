//
//  ChatVC.swift
//  Smack
//
//  Created by TheNextG on 11/21/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var channelNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTE_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTE_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUSerByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTE_USER_DATA_DID_CHANGE, object: nil)
            })
        }

        // Do any additional setup after loading the view.
    }
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            // get channel
        }else {
            channelNameLbl.text = "Please Log In"
        }
    }
    @objc func channelSelected(_ notif: Notification){
        updatewithChannel()
    }
    
    func updatewithChannel() {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = "\(channelName)"
    }
    
    func onLogInGetMessages () {
        MessageService.instance.findAllChannel { (success) in
            if success {
                // Do stuff with channels
            }
        }
    }

}



























