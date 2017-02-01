//
//  CustomLabel.swift
//  myCV
//
//  Created by Andrei Momot on 2/1/17.
//  Copyright © 2017 Dr_Mom. All rights reserved.
//

import UIKit

extension UILabel {
  
  func configurePlainLabel()
  {
    self.textColor = UIColor.white
    self.textAlignment = .center
    self.numberOfLines = 0
    self.font = UIFont(name: "Avenir-light", size: 20)
  }
  
  func configureSmallLabel()
  {
    self.textColor = UIColor.white
    self.textAlignment = .center
    self.numberOfLines = 0
    self.font = UIFont(name: "Avenir-light", size: 15)
  }
  
  func configureLargeLabel()
  {
    self.textColor = UIColor.white
    self.textAlignment = .center
    self.numberOfLines = 0
    self.font = UIFont(name: "Avenir-light", size: 30)
  }
}
