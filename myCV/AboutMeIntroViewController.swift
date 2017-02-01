//
//  AboutMeIntroViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/9/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class AboutMeIntroViewController: ChildViewController
{
  fileprivate enum LabelText: String {
    case header = "My name is"
    case name = "Andrii Momot"
    case dev = "iOS Developer"
  }
  
  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var CVImageView: UIImageView!
  @IBOutlet weak var devLabel: UILabel!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    configureHeaderLabel()
    configureNameLabel()
    configureCVImageView()
    configureDevLabel()
  }
  
  fileprivate func configureHeaderLabel()
  {
    self.headerLabel.text = LabelText.header.rawValue
    headerLabel.configurePlainLabel()
  }
  
  fileprivate func configureNameLabel()
  {
    self.nameLabel.text = LabelText.name.rawValue
    nameLabel.configureLargeLabel()
  }
  
  fileprivate func configureCVImageView()
  {
    CVImageView.image = UIImage(named: "profile-img.jpg")
    CVImageView.roundedImage()
  }
  
  fileprivate func configureDevLabel()
  {
    self.devLabel.text = LabelText.dev.rawValue
    devLabel.configureSmallLabel()
  }
  
  // MARK: ScrollingDelegate
  override func onScrollWithPageLeft(_ offset: CGFloat)
  {
    self.headerLabel.transform = CGAffineTransform(translationX: 0, y: -(self.view.frame.height * 0.5 * offset))
    self.nameLabel.transform = CGAffineTransform(translationX: 0, y: -(self.view.frame.height * 0.3 * offset))
    self.CVImageView.transform = CGAffineTransform(scaleX: 1 + offset, y: 1 + offset)
    self.CVImageView.alpha = 1 - offset
    self.devLabel.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height * 0.3 * offset)
  }
  
  override func onScrollWithPageRight(_ offset: CGFloat)
  {
    let newAlpha = 1 - offset
    self.headerLabel.alpha = newAlpha
    self.nameLabel.alpha = newAlpha
    self.CVImageView.alpha = newAlpha
    self.devLabel.alpha = newAlpha
  }
}


