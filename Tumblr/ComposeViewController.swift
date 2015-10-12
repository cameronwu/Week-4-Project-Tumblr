//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Cameron Wu on 10/7/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true
    
    @IBOutlet weak var textIconImageView: UIImageView!
    @IBOutlet weak var photoIconImageView: UIImageView!
    @IBOutlet weak var quoteIconImageView: UIImageView!
    @IBOutlet weak var linkIconImageView: UIImageView!
    @IBOutlet weak var chatIconImageView: UIImageView!
    @IBOutlet weak var videoIconImageView: UIImageView!
    
    @IBOutlet weak var nevermindButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        print("Compose view will appear!")
        textIconImageView.frame.origin.y = view.frame.height
        photoIconImageView.frame.origin.y = view.frame.height
        quoteIconImageView.frame.origin.y = view.frame.height
        linkIconImageView.frame.origin.y = view.frame.height
        chatIconImageView.frame.origin.y = view.frame.height
        videoIconImageView.frame.origin.y = view.frame.height
        nevermindButton.frame.origin.y = view.frame.height
    }
    
    override func viewDidAppear(animated: Bool) {
        print("Compose view did appear.")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView?.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            /*
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.view.bounds
            fromViewController.view.addSubview(blurEffectView)
            */
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
            
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
            revealAllButtons()
        } else {
            hideAllButtons()
            UIView.animateWithDuration(0.4, delay: 0.3, options: [], animations: { () -> Void in
                fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    func revealAllButtons() {
        revealButton(textIconImageView, delay: 0.0)
        revealButton(photoIconImageView, delay: 0.1)
        revealButton(quoteIconImageView, delay: 0.3)
        revealButton(linkIconImageView, delay: 0.2)
        revealButton(chatIconImageView, delay: 0.3)
        revealButton(videoIconImageView, delay: 0.5)
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.nevermindButton.frame.origin.y = self.view.frame.height - 54
            }, completion: nil)
    }
    
    func revealButton(button: UIImageView, delay: NSTimeInterval) {
        UIView.animateWithDuration(0.4, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
            if button == self.textIconImageView || button == self.photoIconImageView || button == self.quoteIconImageView {
                button.frame.origin.y = 160
            } else {
                button.frame.origin.y = 280
            }
            }, completion: nil)
    }
    
    @IBAction func pressNevermindButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func hideAllButtons() {
        hideButton(textIconImageView, delay: 0.2)
        hideButton(photoIconImageView, delay: 0.1)
        hideButton(quoteIconImageView, delay: 0.15)
        hideButton(linkIconImageView, delay: 0.1)
        hideButton(chatIconImageView, delay: 0.0)
        hideButton(videoIconImageView, delay: 0.05)
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.nevermindButton.frame.origin.y = self.view.frame.height
            }, completion: nil)
    }
    
    func hideButton(button: UIImageView, delay: NSTimeInterval) {
        UIView.animateWithDuration(0.2, delay: delay, options: .CurveEaseIn, animations: { () -> Void in
            button.frame.origin.y = self.view.frame.height
            }, completion: nil)
    }

}
