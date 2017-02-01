//
//  HomeTableViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/9/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import Foundation
import UIKit

/* Delegate and data source for HomeViewController's tableview */

extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
  fileprivate enum PortfolioIdentifier: String {
    case aboutMe = "About Me"
    case background = "Background"
    case projects = "Projects"
    case skills = "Skills"
    case contact = "Contact"
  }
  
  fileprivate enum VCIdentifier: String {
    case aboutIntroVC = "AboutMeIntroVC"
    case aboutDescriptionVC = "AboutMeDescriptionVC"
    case aboutHobbiesVC = "AboutMeHobbiesVC"
    case eduIntroVC = "EduIntroVC"
    case eduITVC = "EduITVC"
    case eduEngVC = "EduEngVC"
    case projectsCalcVC = "ProjectsCalcVC"
    case projectsFlappyVC = "ProjectsFlappyVC"
    case projectsPokerVC = "ProjectsPokerVC"
    case skillsVC = "SkillsVC"
    case contactVC = "ContactVC"
    case aboutVC = "AboutVC"
    case rootContainerVC = "RootContainerVC"
  }
  
  fileprivate var normalCellColor: UIColor {
    return UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
  }
  
  fileprivate var highlightedCellColor: UIColor {
    return UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
  }
  
  fileprivate enum PortfolioType: Int {
    case about = 0
    case background = 1
    case projects = 2
    case skills = 3
    case contact = 4
  }
  
  private func stringForPortfolioType(_ type: PortfolioType) -> String
  {
    let type = type
    
    switch type {
    case .about:
      return PortfolioIdentifier.aboutMe.rawValue
    case .background:
      return PortfolioIdentifier.background.rawValue
    case .projects:
      return PortfolioIdentifier.projects.rawValue
    case .skills:
      return PortfolioIdentifier.skills.rawValue
    case .contact:
      return PortfolioIdentifier.contact.rawValue
    }
  }
  
  private func pages(_ type: PortfolioType) -> [ChildViewController]
  {
    let type = type
    
    switch type {
    case .about:
      let aboutIntroVC = pageChildViewController(VCIdentifier.aboutIntroVC.rawValue)
      let aboutDescriptionVC = pageChildViewController(VCIdentifier.aboutDescriptionVC.rawValue)
      let aboutHobbiesVC = pageChildViewController(VCIdentifier.aboutHobbiesVC.rawValue)
      return [aboutIntroVC, aboutDescriptionVC, aboutHobbiesVC]
    case .background:
      let eduIntroVC = pageChildViewController(VCIdentifier.eduIntroVC.rawValue)
      let eduITVC = pageChildViewController(VCIdentifier.eduITVC.rawValue)
      let eduEngVC = pageChildViewController(VCIdentifier.eduEngVC.rawValue)
      return [eduIntroVC, eduITVC, eduEngVC]
    case .projects:
      let projectsCalcVC = pageChildViewController(VCIdentifier.projectsCalcVC.rawValue)
      let projectsFlappyVC = pageChildViewController(VCIdentifier.projectsFlappyVC.rawValue)
      let projectsPokerVC = pageChildViewController(VCIdentifier.projectsPokerVC.rawValue)
      return [projectsCalcVC, projectsFlappyVC, projectsPokerVC]
    case .skills:
      let skillsVC = pageChildViewController(VCIdentifier.skillsVC.rawValue)
      return [skillsVC]
    case .contact:
      let contactVC = pageChildViewController(VCIdentifier.contactVC.rawValue)
      let aboutVC = pageChildViewController(VCIdentifier.aboutVC.rawValue)
      return [contactVC, aboutVC]
    }
  }
  
  private func backgroundImage(_ type: PortfolioType) -> UIImage
  {
    let type = type
    
    switch type {
    case .about:
      return UIImage(named: "night.jpg")!
    case .background:
      return UIImage(named: "winter.jpg")!
    case .projects:
      return UIImage(named: "stadium.jpg")!
    case .skills:
      return UIImage(named: "city.jpg")!
    case .contact:
      return UIImage(named: "tram.jpg")!
    }
  }
  
  private func pageChildViewController(_ identifier: String) -> ChildViewController
  {
    return self.storyboard!.instantiateViewController(withIdentifier: identifier) as! ChildViewController
  }
  
  func configureCell(_ cell:PortfolioTableViewCell, forRow row: Int)
  {
    cell.textLabel?.text = stringForPortfolioType(PortfolioType(rawValue: row)!).uppercased()
    cell.textLabel?.textAlignment = NSTextAlignment.center
    cell.textLabel?.textColor = UIColor.white
    cell.textLabel?.font = UIFont(name: "Avenir-Light", size: 18)
    cell.textLabel?.backgroundColor = UIColor.clear
    cell.backgroundColor = self.normalCellColor
    cell.layoutMargins = UIEdgeInsets.zero
    
    let selectedView = UIView()
    selectedView.backgroundColor = self.highlightedCellColor
    cell.selectedBackgroundView = selectedView
  }
  
  // MARK: Delegate & Data Source
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell: PortfolioTableViewCell = tableView.dequeueReusableCell(withIdentifier: PortfolioTableViewCell.kCellIdentifer, for: indexPath) as! PortfolioTableViewCell
    configureCell(cell, forRow: indexPath.row)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
  {
    // Deselect cell
    tableView.deselectRow(at: indexPath, animated: true)
    
    let type: PortfolioType = PortfolioType(rawValue: indexPath.row)!
    
    // Create VC
    let containerVC: RootContainerViewController = self.storyboard!.instantiateViewController(withIdentifier: VCIdentifier.rootContainerVC.rawValue) as! RootContainerViewController
    
    // Set background image and child view controllers
    containerVC.backgroundImage = self.backgroundImage(type)
    containerVC.pages = self.pages(type)
    
    self.present(containerVC, animated: true, completion: nil)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
  {
    return (self.cellView.frame.size.height - self.defaultHeaderHeight) / 5
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return 5
  }
}
