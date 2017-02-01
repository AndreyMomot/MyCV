//
//  ProjectsCalculatorViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/14/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class ProjectsCalculatorViewController: ChildViewController
{
  fileprivate enum LabelText: String {
    case description = "Fully functional calculator is one of my first iOS applications written on swift!"
  }
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    configureLogoImageView()
    configureDescriptionLabel()
  }
  
  fileprivate func configureDescriptionLabel()
  {
    descriptionLabel.text = LabelText.description.rawValue
    descriptionLabel.configurePlainLabel()
  }
  
  fileprivate func configureLogoImageView()
  {
    logoImageView.image = UIImage(named: "calculator.png")
    logoImageView.roundedImage()
  }
  
  // MARK: ScrollingDelegate
  override func onScrollWithPageRight(_ offset: CGFloat)
  {
    self.logoImageView.transform = CGAffineTransform(rotationAngle: -offset * CGFloat(M_PI))
  }
  
  override func onScrollWithPageLeft(_ offset: CGFloat)
  {
    self.logoImageView.transform = CGAffineTransform(rotationAngle: offset * CGFloat(M_PI)).translatedBy(x: offset * self.view.width, y: -offset * self.view.height)
    self.descriptionLabel.transform = CGAffineTransform(translationX: self.view.width * offset, y: self.view.height * -offset)
  }
}
