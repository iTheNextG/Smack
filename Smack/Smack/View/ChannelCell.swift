//
//  ChannelCell.swift
//  Smack
//
//  Created by TheNextG on 12/7/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    //outlets
    
    @IBOutlet weak var ChannelName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel){
        let title = channel.channelTitle ?? ""
        ChannelName.text = "#\(title)"
    }

}
