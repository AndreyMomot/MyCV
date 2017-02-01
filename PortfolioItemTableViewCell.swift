//
//  PortfolioItemTableViewCell.swift
//  myCV
//
//  Created by Andrei Momot on 12/12/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class PortfolioItemTableViewCell: UITableViewCell
{
    static let kCellIdentifier = "ItemCell"
    @IBOutlet weak var labelView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
        
    func configureCell()
    {
        self.labelView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        self.textLabel!.textColor = UIColor.white
        self.textLabel!.font = UIFont(name: "Avenir-light", size: 20)
        self.textLabel!.textAlignment = .center
    }
}
