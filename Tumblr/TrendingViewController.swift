//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by Cameron Wu on 10/7/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var activityScrollView: UIScrollView!
    @IBOutlet weak var activityEmptyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        activityScrollView.contentSize = activityEmptyImageView.image!.size
        activityScrollView.alwaysBounceVertical = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
