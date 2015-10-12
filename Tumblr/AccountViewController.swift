//
//  AccountViewController.swift
//  Tumblr
//
//  Created by Cameron Wu on 10/7/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var accountScrollView: UIScrollView!
    @IBOutlet weak var accountImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        accountScrollView.contentSize = accountImageView.image!.size
        accountScrollView.alwaysBounceVertical = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
