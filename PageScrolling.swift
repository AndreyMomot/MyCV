//
//  PageScrolling.swift
//  myCV
//
//  Created by Andrei Momot on 12/10/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

protocol PageScrolling
{
  
//  Update view when a fraction of it is on the left.
    func onScrollWithPageLeft(_ offset: CGFloat)
    
//    Update view when a fraction of it is on the right page currently visible.
    func onScrollWithPageRight(_ offset: CGFloat)
}
