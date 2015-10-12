//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Cameron Wu on 10/7/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    // Tab Buttons
    @IBOutlet var buttons: [UIButton]!
    
    // Explore NUX
    @IBOutlet weak var exploreNUX: UIImageView!
    
    // View Controllers
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        animateExploreNUX()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func didPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        buttons[previousIndex].selected = false
        selectedIndex = sender.tag
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        if selectedIndex == 1 {
            hideExploreNUX()
        } else {
            animateExploreNUX()
        }
    }
    
    func animateExploreNUX() {
        self.exploreNUX.alpha = 1
        UIView.animateWithDuration(1.0, delay: 0, options: [UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat], animations: { () -> Void in
            self.exploreNUX.transform = CGAffineTransformMakeTranslation(0, -5)
            }, completion: nil)
    }
    
    func hideExploreNUX() {
        self.exploreNUX.alpha = 0
    }
    
    @IBAction func didPressCompose(sender: UIButton) {
        performSegueWithIdentifier("composeSegue", sender: self)
    }
    
}
