//
//  RootContainerViewController.swift
//  myCV
//
//  Created by Andrei Momot on 12/10/16.
//  Copyright © 2016 Dr_Mom. All rights reserved.
//

import UIKit

class RootContainerViewController: UIViewController, UIScrollViewDelegate
{
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var scrollRightImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    /* Backround image used in next views */
    var backgroundImage = UIImage(named: "city.jpg")!
    
    /* Amound image should extend on the sides of the scrollView */
    fileprivate let imageSideOffset: CGFloat = 50
    
    /* Ratio of image scrolling to scrollview scrrolling */
    fileprivate let imageShiftRatio: CGFloat = 0.25
    
    /* View controllers used in pages */
    var pages = [UIViewController]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureBackgroundImage()
        configureScrollView()
        self.view.clipsToBounds = true
        if self.pages.count == 0 {
            for _ in 0...5 {
                let childVC = ChildViewController()
                self.addChildViewController(childVC)
                self.scrollView.addSubview(childVC.view)
                childVC.didMove(toParentViewController: self)
                self.pages.append(childVC)
            }
        } else {
            for i in 0..<self.pages.count {
                let childVC = self.pages[i]
                self.addChildViewController(childVC)
                self.scrollView.addSubview(childVC.view)
                childVC.didMove(toParentViewController: self)
            }
        }
    }

    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        self.scrollView.frame = self.view.frame
        self.scrollView.contentSize.width = CGFloat(self.pages.count) * self.view.frame.width
        self.scrollView.contentSize.height = self.view.frame.height
        
        // Set position of all pages in scrollview
        for i in 0..<self.pages.count {
            pages[i].view.frame = CGRect(x: CGFloat(i) * self.view.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
        
        let aspectRatio: CGFloat = self.bgImageView.frame.height / self.bgImageView.frame.width
        
        // Calculate How big imageview needs to be for next view 
        var imageWidth: CGFloat = imageShiftRatio * (self.scrollView.contentSize.width - self.view.frame.width) + (imageSideOffset * 2) + self.view.frame.width
        
        // Adjust imageview height based on calculated width
        var imageHeight: CGFloat = imageWidth * aspectRatio
        
        // Make sure image is at least as tall as the view
        if imageHeight <= self.view.frame.height {
            imageHeight = self.view.frame.height
            imageWidth = imageHeight / aspectRatio
        }
        
        // Set imageview frame (center it vertically)
        self.bgImageView.frame = CGRect(x: -scrollView.contentOffset.x - imageSideOffset, y: -((imageHeight / 2.0) - (self.view.frame.height / 2.0)) / 2.0, width: imageWidth, height: imageHeight)
        }
    
        fileprivate func configureBackgroundImage()
        {
            self.bgImageView.image = self.backgroundImage
            self.bgImageView.contentMode = UIViewContentMode.scaleAspectFill
        }
        
        fileprivate func configureScrollView()
        {
            self.scrollView.isPagingEnabled = true
            self.scrollView.delegate = self
            self.scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            self.scrollView.indicatorStyle = UIScrollViewIndicatorStyle.white
        }
    
        // MARK: UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let offsetX: CGFloat = scrollView.contentOffset.x
        
        // Make scrollRight fade out
        self.scrollRightImageView.alpha = 1 - (offsetX * 0.01)
        
        // Get exact page position
        let positionX: CGFloat = offsetX / self.view.frame.width
        
        // Calculate left and right page index
        let leftPageIndex: Int = Int(floor(positionX))
        let rightPageIndex: Int = leftPageIndex + 1
        
        // Calculate offset for left and right pages
        let leftOffset: CGFloat = positionX - floor(positionX)
        let rightOfsset: CGFloat = 1 - leftOffset
        
        // Notify left page about scroll
        if leftPageIndex >= 0 {
            (pages[leftPageIndex] as! PageScrolling).onScrollWithPageLeft(leftOffset)
        }
        
        // Notify right page about scroll
        if rightPageIndex < self.pages.count {
            (pages[rightPageIndex] as! PageScrolling).onScrollWithPageRight(rightOfsset)
        }
        
        // Adjust background parallax
        let imageLeftAdjust: CGFloat = -offsetX * imageShiftRatio - imageSideOffset
        if imageLeftAdjust < 0 && imageLeftAdjust + self.bgImageView.frame.width > self.view.frame.width {
            self.bgImageView.left = imageLeftAdjust
        }
    }
        
    @IBAction func dismissButton(_ sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
