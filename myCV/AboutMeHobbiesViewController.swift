//
//  AboutMeHobbiesViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/12/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class AboutMeHobbiesViewController: ChildViewController, UITableViewDataSource
{
  fileprivate enum CellIdentifier: String {
    case portfolioCell = "PortfolioItemTableViewCell"
  }
  fileprivate enum LabelText: String {
    case title = "Some of my other hobbies and interests:"
  }
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var titleButtonSpace: NSLayoutConstraint!
  @IBOutlet weak var titleTableViewSpace: NSLayoutConstraint!
  
  var rowHeight: CGFloat = 70
  let hobbies = ["Poker", "Basketball", "Snowboarding", "Travelling"]
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    configureTitleLabel()
    configureTableView()
  }
  
  override func viewDidLayoutSubviews()
  {
    super.viewDidLayoutSubviews()
    if self.dismissButtonOffset + self.titleLabel.height + self.titleTableViewSpace.constant + self.titleButtonSpace.constant + (CGFloat(self.hobbies.count) * rowHeight) > self.view.height {
      self.titleButtonSpace.constant = self.dismissButtonOffset
      self.titleTableViewSpace.constant = 10
    }
    if rowHeight * CGFloat(self.hobbies.count) + self.titleLabel.height + self.titleLabel.top > self.view.height {
      self.tableView.rowHeight = 50
    }
  }
  
  fileprivate func configureTitleLabel()
  {
    self.titleLabel.text = LabelText.title.rawValue
    titleLabel.configurePlainLabel()
  }
  
  fileprivate func configureTableView()
  {
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    self.tableView.backgroundColor = UIColor.clear
    self.tableView.tableFooterView = UIView()
    self.tableView.dataSource = self
    self.tableView.register(UINib(nibName: CellIdentifier.portfolioCell.rawValue, bundle: nil), forCellReuseIdentifier: PortfolioItemTableViewCell.kCellIdentifier)
    self.tableView.rowHeight = self.rowHeight
    self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    self.tableView.isUserInteractionEnabled = false
  }
  
  // MARK: ScrollingDelegate
  override func onScrollWithPageRight(_ offset: CGFloat)
  {
    self.titleLabel.transform = CGAffineTransform(translationX: -offset * self.view.width, y: -offset/2 * self.view.height)
    
    // Animate each cell in an offset fashion
    for i in 0..<self.tableView.visibleCells.count {
      let cell = self.tableView.visibleCells[i]
      cell.transform = CGAffineTransform(translationX: CGFloat(i) * offset * 150, y: 0)
    }
  }
  
  override func onScrollWithPageLeft(_ offset: CGFloat)
  {
    self.titleLabel.alpha = 1 - offset
    
    // Animate each cell in an offset fashion
    for i in 0..<self.tableView.visibleCells.count {
      let cell = self.tableView.visibleCells[i]
      cell.transform = CGAffineTransform(translationX: CGFloat(i) * offset * -150, y: 0)
    }
  }
  
  // MARK: UITableView Data Source
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: PortfolioItemTableViewCell.kCellIdentifier, for: indexPath)
    cell.textLabel!.text = self.hobbies[indexPath.row]
    return cell
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return self.hobbies.count
  }
}
