//
//  ProjectsFlappyBirdViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/14/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class ProjectsFlappyBirdViewController: ChildViewController
{
  fileprivate enum LabelText: String {
    case description = "Common app for new developers named Flappy Bird was written by some developer for less than one day after presentation Swift-language during WWDC2014 and by me in November 2016."
  }
  
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureDescriptionLabel()
    configureLogoImageView()
  }
  
  fileprivate func configureDescriptionLabel()
  {
    descriptionLabel.text = LabelText.description.rawValue
    descriptionLabel.configurePlainLabel()
  }
  
  fileprivate func configureLogoImageView()
  {
    logoImageView.image = UIImage(named: "flappybird.png")
    logoImageView.roundedImage()
  }
  
  // MARK: ScrollingDelegate
  override func onScrollWithPageRight(_ offset: CGFloat)
  {
    self.logoImageView.transform = CGAffineTransform(scaleX: 1 - offset, y: 1 - offset)
    self.descriptionLabel.alpha = 1 - offset
  }
  
  override func onScrollWithPageLeft(_ offset: CGFloat)
  {
    self.logoImageView.transform = CGAffineTransform(translationX: offset * self.view.width, y: -offset * self.view.height)
    self.descriptionLabel.transform = CGAffineTransform(translationX: offset * self.view.width, y: offset * self.view.height)
  }
}
