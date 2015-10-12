//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Cameron Wu on 10/7/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var spinnerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.spinnerImageView.transform = CGAffineTransformMakeDegreeRotation(0)
    }
    
    override func viewDidAppear(animated: Bool) {
        print("Home did appear.")
        UIView.animateWithDuration(25.0, delay: 0.0, options: [.CurveLinear, .Repeat], animations: { () -> Void in
            self.spinnerImageView.transform = CGAffineTransformMakeDegreeRotation(180)
            }, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        spinnerImageView.layer.removeAllAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLoginButton(sender: UIButton) {
        performSegueWithIdentifier("loginSegue", sender: self)
    }

}
