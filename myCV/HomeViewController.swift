//
//  HomeViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/8/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
  fileprivate enum LabelText: String {
    case title = "Andrii Momot"
    case dev = "iOS Developer"
  }
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var CVImageView: UIImageView!
  @IBOutlet weak var devLabel: UILabel!
  @IBOutlet weak var cellView: UITableView!
  @IBOutlet weak var headerConstraintHeight: NSLayoutConstraint!
  
  /* Height of personal header section above tableview */
  var defaultHeaderHeight: CGFloat { return self.view.frame.size.height * 0.4 }
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    configureTableView()
    configurateRoundImage()
    configuratePersonalLabels()
    
    self.headerConstraintHeight.constant = defaultHeaderHeight
  }
  
  fileprivate func configurateRoundImage()
  {
    CVImageView.layer.borderWidth = 1.0
    CVImageView.roundedImage()
  }
  
  fileprivate func configureTableView()
  {
    self.cellView.contentInset = UIEdgeInsetsMake(defaultHeaderHeight, 0, 0, 0)
    self.cellView.tableFooterView = UIView()
    self.cellView.register(PortfolioTableViewCell.self, forCellReuseIdentifier: PortfolioTableViewCell.kCellIdentifer)
    self.cellView.separatorColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
    self.cellView.separatorInset = UIEdgeInsets.zero
    self.cellView.layoutMargins = UIEdgeInsets.zero
    self.cellView.delegate = self
    self.cellView.dataSource = self
  }
  
  fileprivate func configuratePersonalLabels()
  {
    self.titleLabel.text = LabelText.title.rawValue
    titleLabel.configureLargeLabel()
    
    self.devLabel.text = LabelText.dev.rawValue
    devLabel.configureSmallLabel()
  }
  func scrollViewDidScroll(_ scrollView: UIScrollView)
  {
    let offsetY = scrollView.contentOffset.y
    
    // Adjust height of header view
    self.headerConstraintHeight.constant = -offsetY
    
    // When we scroll up, adjust opacity of header items
    if -offsetY < self.defaultHeaderHeight {
      
      // Point of full invisibility
      let invisiblePoint = self.defaultHeaderHeight - 150
      
      // Calculated alpha
      let newAlpha = (-offsetY - invisiblePoint) / 100
      let labelAlphaOffset: CGFloat = 0.5
      
      self.titleLabel.alpha = newAlpha - labelAlphaOffset
      self.CVImageView.alpha = newAlpha
      self.devLabel.alpha = newAlpha - labelAlphaOffset
    }
  }
}
