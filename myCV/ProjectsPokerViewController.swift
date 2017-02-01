//
//  ProjectsPokerViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/14/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class ProjectsPokerViewController: ChildViewController
{
  fileprivate enum LabelText: String {
    case description = "Push-fold chart is my first own application. This tool intended for poker players to show them pre-calculated decisions about push-fold situations."
  }
  
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func viewDidLoad() {
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
    logoImageView.image = UIImage(named: "poker.png")
    logoImageView.roundedImage()
  }
  
  // MARK: ScrollingDelegate
  override func onScrollWithPageRight(_ offset: CGFloat)
  {
    self.logoImageView.transform = CGAffineTransform(rotationAngle: offset * CGFloat(M_PI))
  }
  
  override func onScrollWithPageLeft(_ offset: CGFloat)
  {
    self.logoImageView.transform = CGAffineTransform(rotationAngle: -offset * CGFloat(M_PI))
    self.descriptionLabel.transform = CGAffineTransform(translationX: offset * self.view.width, y: offset * self.view.height)
  }
}
