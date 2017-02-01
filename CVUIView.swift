//
//  CVUIView.swift
//  myCV
//
//  Created by Andrei Momot on 12/11/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

extension UIView
{
    var width : CGFloat {
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue }
    }
    
    var height: CGFloat {
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue }
    }
    
    var left: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    
    var top: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
}
