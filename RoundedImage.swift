//
//  RoundedImage.swift
//  myCV
//
//  Created by Andrei Momot on 2/1/17.
//  Copyright © 2017 Dr_Mom. All rights reserved.
//

import UIKit

extension UIImageView {
  
  func roundedImage()
  {
    self.layer.borderWidth = 1.0
    self.layer.masksToBounds = false
    self.layer.borderColor = UIColor.white.cgColor
    self.layer.cornerRadius = self.frame.size.height/2
    self.clipsToBounds = true
  }
}
