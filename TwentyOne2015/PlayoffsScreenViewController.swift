//
//  PlayoffsScreenViewController.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/25/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import UIKit

class PlayoffsScreen: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var playoffsView: UIView!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    var round1VertOffset: CGFloat = 0.0
    var round1VertOffset2: CGFloat = 0.0
    
    override func viewDidAppear(animated: Bool) {
        
        pageImages = [UIImage(named: "Round1.png")!,UIImage(named: "Round2.png")!, UIImage(named: "Round3.png")!, UIImage(named: "Round4.png")!, UIImage(named: "Round5.png")!]
        
//        let pageCount = pageImages.count
        let pageCount = 5
        
        // 2
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        // 3
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        // 4
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: playoffsView.frame.size.width * CGFloat(pageCount),
            height: pagesScrollViewSize.height)
        
        round1VertOffset = scrollView.frame.size.height / 9
        round1VertOffset2 = scrollView.frame.size.height * 0.06
        
        //Add buttons
//        addButtons()
        
        // 5
        loadVisiblePages()
    }
    
    func loadPage(page: Int) {
        if page < 0 || page >= 5 {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // 1
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            // 2
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            // 3
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleToFill
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageWidth = playoffsView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // Load the pages that are now on screen
        loadVisiblePages()
    }
    
//    func addButtons(){
//        
//        //Seed 1
//        var team1Btn   = UIButton.buttonWithType(UIButtonType.System) as UIButton
//        team1Btn.frame = CGRectMake(playoffsView.frame.size.width / 3, round1VertOffset, 100, 50)
////        team1Btn.backgroundColor = UIColor.greenColor()
//        team1Btn.setTitle("1 Seed", forState: UIControlState.Normal)
//        team1Btn.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(team1Btn)
//        
//        //Seed 2
//        var team2Btn   = UIButton.buttonWithType(UIButtonType.System) as UIButton
//        team2Btn.frame = CGRectMake(playoffsView.frame.size.width / 3, round1VertOffset + round1VertOffset2, 100, 50)
//        //        team1Btn.backgroundColor = UIColor.greenColor()
//        team2Btn.setTitle("2 Seed", forState: UIControlState.Normal)
//        team2Btn.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(team2Btn)
//        
//        //Seed 3
//        var team3Btn   = UIButton.buttonWithType(UIButtonType.System) as UIButton
//        team3Btn.frame = CGRectMake(playoffsView.frame.size.width / 3, round1VertOffset + (round1VertOffset2 * 2), 100, 50)
//        //        team1Btn.backgroundColor = UIColor.greenColor()
//        team3Btn.setTitle("3 Seed", forState: UIControlState.Normal)
//        team3Btn.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(team3Btn)
//    }
}
