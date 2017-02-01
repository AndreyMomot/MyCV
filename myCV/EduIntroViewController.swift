//
//  EduIntroViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/12/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class EduIntroViewController: ChildViewController
{
  @IBOutlet var plainLabels: [UILabel]!
  @IBOutlet var largeLabels: [UILabel]!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }
  
  // MARK: ScrollingDelegate
  override func onScrollWithPageLeft(_ offset: CGFloat)
  {
    for label in plainLabels{
      label.transform = CGAffineTransform(translationX: self.view.width * offset, y: 0)
      label.alpha = 1 - offset
    }
  }
}
