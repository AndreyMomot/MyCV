//
//  ActionButton.swift
//  myCV
//
//  Created by Andrei Momot on 12/15/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class ActionButton: UIButton
{
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    fileprivate func setup()
    {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.titleLabel!.textAlignment = .center
        self.titleLabel!.font = UIFont(name: "Alvenir-light", size: 20)
        self.setTitleColor(UIColor.white, for: UIControlState())
        self.backgroundColor = UIColor(white: 1, alpha: 0.1)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if (isHighlighted) {
                self.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                self.layer.borderColor = UIColor.white.cgColor
            }
        }
    }
}
