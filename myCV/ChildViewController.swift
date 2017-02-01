//
//  ChildViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/10/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController, PageScrolling
{
    let dismissButtonOffset: CGFloat = 70

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
    }
    
    //Helper Functions
    func goToLink(scheme: String)
    {
        if let url = URL(string: scheme) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    //SkrollingDelegate
    func onScrollWithPageLeft(_ offset: CGFloat) {}
    func onScrollWithPageRight(_ offset: CGFloat) {}
}
