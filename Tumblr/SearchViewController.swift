//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Cameron Wu on 10/7/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchScrollView: UIScrollView!
    @IBOutlet weak var searchFeedImageView: UIImageView!
    
    @IBOutlet weak var loadingDots: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchScrollView.contentSize = searchFeedImageView.image!.size
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        loadingDots.image = animatedImage
    }
    
    override func viewDidAppear(animated: Bool) {
        print("Search did appear.")
        loadingDots.alpha = 1
        searchScrollView.alpha = 0
        delay(2.0) { () -> () in
            self.loadingDots.alpha = 0
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.searchScrollView.alpha = 1
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
