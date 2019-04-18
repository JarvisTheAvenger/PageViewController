//
//  ContentViewController.swift
//  PageViewController
//
//  Created by Rahul Umap on 18/04/19.
//  Copyright © 2019 Rahul Umap. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var onboardingMessageLabel: UILabel!
    @IBOutlet weak var onboardingImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var content : Content!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        onboardingMessageLabel.text = content.description
        onboardingImageView.image = content.image
    }

}
