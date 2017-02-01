//
//  AboutMeDescriptionViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/12/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class AboutMeDescriptionViewController: ChildViewController
{
  fileprivate enum LabelText: String {
    case description = "I am 28-years-old developer from Kharkiv, Ukraine. As an iOS developer both by career choice and hobby, I constantly enjoy learning and stretching the limits of my abilities. My passion for mobile development lies at creating something never created before and developing something really useful. I'm eager to grow professionally and achieve new goals every day!"
  }
  
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    configureDescriptionLabel()
  }
  
  fileprivate func configureDescriptionLabel()
  {
    self.descriptionLabel.text = LabelText.description.rawValue
    descriptionLabel.configurePlainLabel()
  }
  
  // ScrollingDelegate
  override func onScrollWithPageRight(_ offset: CGFloat)
  {
    self.descriptionLabel.transform = CGAffineTransform(scaleX: 1 - offset, y: 1 - offset)
  }
  
  override func onScrollWithPageLeft(_ offset: CGFloat)
  {
    self.descriptionLabel.transform = CGAffineTransform(translationX: offset * self.view.width, y: offset * self.view.height)
  }
}
