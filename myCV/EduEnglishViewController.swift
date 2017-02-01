//
//  EduEnglishViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/13/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class EduEnglishViewController: ChildViewController
{
  @IBOutlet var largeLabels: [UILabel]!
  @IBOutlet var plainLabels: [UILabel]!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }
  
  // MARK: ScrollingDelegate
  override func onScrollWithPageRight(_ offset: CGFloat)
  {
    for label in plainLabels {
      label.transform = CGAffineTransform(translationX: 0, y: self.view.height * offset)
      label.alpha = 1 - offset
    }
    for label in largeLabels {
      label.transform = CGAffineTransform(translationX: 0, y: self.view.height * -offset)
    }
  }
}
