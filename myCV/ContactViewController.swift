//
//  ContactViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/15/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class ContactViewController: ChildViewController
{
  fileprivate enum Link: String {
    case linkedIn = "https://www.linkedin.com/in/andreymomot"
    case facebook = "https://www.facebook.com/MomotAndrii"
    case bitbucket = "https://bitbucket.org/Dr_Mom"
    case github = "https://github.com/AndreyMomot"
    
  }
  @IBOutlet var buttons: [ActionButton]!
  
  @IBAction fileprivate func goToLinkedIn(_ sender: AnyObject)
  {
    self.goToLink(scheme: Link.linkedIn.rawValue)
  }
  
  @IBAction fileprivate func goToFacebook(_ sender: AnyObject)
  {
    self.goToLink(scheme: Link.facebook.rawValue)
  }
  
  @IBAction fileprivate func goToBitbucket(_ sender: AnyObject)
  {
    self.goToLink(scheme: Link.bitbucket.rawValue)
  }
  
  @IBAction fileprivate func goToGitHub(_ sender: AnyObject)
  {
    self.goToLink(scheme: Link.github.rawValue)
  }
  
  // MARK: ScrollingDelegate
  override func onScrollWithPageLeft(_ offset: CGFloat)
  {
    for i in 0..<self.buttons.count {
      let button = self.buttons[i]
      button.transform = CGAffineTransform(rotationAngle: offset * CGFloat(i) * 0.4)
    }
  }
}
