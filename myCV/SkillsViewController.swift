//
//  SkillsViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/14/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class SkillsViewController: ChildViewController, UITableViewDataSource
{
  fileprivate enum CellIdentifier: String {
    case portfolioCell = "PortfolioItemTableViewCell"
  }
  fileprivate enum LabelText: String {
    case title = "I've had experience with the following languages and tools:"
  }
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var titleLabel: UILabel!
  
  let skills = ["Swift", "CoreData", "xCode", "Adobe Photoshop", "OOP", "Design Patterns", "MapKit", "SpriteKit", "FacebookApi", "GitHub", "Bitbucket"]
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    configureTitleLabel()
    configureTableView()
  }
  
  fileprivate func configureTitleLabel()
  {
    titleLabel.text = LabelText.title.rawValue
    titleLabel.configurePlainLabel()
  }
  
  fileprivate func configureTableView()
  {
    self.tableView.dataSource = self
    self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    self.tableView.backgroundColor = UIColor.clear
    self.tableView.indicatorStyle = UIScrollViewIndicatorStyle.white
    self.tableView.register(UINib(nibName: CellIdentifier.portfolioCell.rawValue, bundle: nil), forCellReuseIdentifier: PortfolioItemTableViewCell.kCellIdentifier)
    self.tableView.rowHeight = 60
  }
  
  // MARK: - UITableView Data Source
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: PortfolioItemTableViewCell.kCellIdentifier, for: indexPath)
    cell.textLabel!.text = self.skills[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return self.skills.count
  }
}
