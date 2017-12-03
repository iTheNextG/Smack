//
//  RoundedButten.swift
//  Smack
//
//  Created by TheNextG on 12/3/17.
//  Copyright © 2017 TheNextG. All rights reserved.
//

import UIKit
@IBDesignable //to see the changes that you write here in the main storyboard
class RoundedButten: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
