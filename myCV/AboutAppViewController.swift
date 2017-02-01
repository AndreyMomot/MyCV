//
//  AboutAppViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/15/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class AboutAppViewController: ChildViewController
{
  fileprivate enum LabelText: String {
    case title = "About This App"
    case description = "All code in this app was written by me. Sightseeings of my native city Kharkiv were used as background pictures. Finally, this was a very enjoyable experience!"
  }
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    configureTitleLabel()
    configureDescriptionLabel()
  }
  
  fileprivate func configureTitleLabel()
  {
    titleLabel.text = LabelText.title.rawValue
    titleLabel.configurePlainLabel()
  }
  
  fileprivate func configureDescriptionLabel()
  {
    descriptionLabel.text = LabelText.description.rawValue
    descriptionLabel.configureSmallLabel()
  }
}
